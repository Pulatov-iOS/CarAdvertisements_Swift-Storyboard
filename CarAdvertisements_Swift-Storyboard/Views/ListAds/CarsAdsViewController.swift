//
//  CarsAdsViewController.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 4.12.23.
//

import UIKit

final class CarsAdsViewController: UIViewController {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var carAdsTableView: UITableView!
    
    // MARK: - Private properies
    private var ads = carManager().getCars()
    private var visibleAds: [Car] = []
    private let bottomButtonsView = UIView()
    private let searchButton = UIButton(type: .custom)
    private let parametersButton = UIButton(type: .custom)
    private var lastContentOffset: CGFloat = 0
    private var bottomButtonsViewConstraint: NSLayoutConstraint!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getVisibleAds()
        configNavigationBar()
        configCarAdsTableView()
        addRightButton()
        addButtonButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        carAdsTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        navigationItem.title = "\(visibleAds.count) объявление"
    }

    // MARK: - Helpers
    private func getVisibleAds () {
        visibleAds = ads.filter {
            $0.isHidden == false
        }
    }
    
    private func configNavigationBar() {
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        setSeparator()
    }
    
    private func configCarAdsTableView() {
        carAdsTableView.dataSource = self
        carAdsTableView.delegate = self
        carAdsTableView.separatorStyle = .none
        carAdsTableView.register(UINib(nibName: "XibTableViewCell", bundle: nil), forCellReuseIdentifier: "XibTableViewCell")
    }
    
    private func addRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func rightButtonTapped() {
         print("Sorting list!")
    }
    
    private func addButtonButtons() {
        
        // MARK: - bottomButtonsView
        view.addSubview(bottomButtonsView)
        bottomButtonsView.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsViewConstraint = bottomButtonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        bottomButtonsViewConstraint.isActive = true
        bottomButtonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomButtonsView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        bottomButtonsView.widthAnchor.constraint(equalToConstant: 235).isActive = true
        
        // MARK: - searchButton
        bottomButtonsView.addSubview(searchButton)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.leadingAnchor.constraint(equalTo: bottomButtonsView.leadingAnchor, constant: 0).isActive = true
        searchButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        searchButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        searchButton.backgroundColor = UIColor(red: 11/255, green: 135/255, blue: 221/255, alpha: 1)
        searchButton.layer.cornerRadius = 10
        searchButton.setImage(UIImage(named: "SearchButtonImage"), for: .normal)
        searchButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 19, bottom: 13, right: 19)
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        
        // MARK: - parametersButton
        bottomButtonsView.addSubview(parametersButton)
        parametersButton.translatesAutoresizingMaskIntoConstraints = false
        parametersButton.leadingAnchor.constraint(equalTo: searchButton.trailingAnchor, constant: 5).isActive = true
        parametersButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        parametersButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        parametersButton.backgroundColor = UIColor(red: 11/255, green: 135/255, blue: 221/255, alpha: 1)
        parametersButton.layer.cornerRadius = 10
        parametersButton.setImage(UIImage(named: "ParametersButtonImage"), for: .normal)
        parametersButton.imageEdgeInsets = UIEdgeInsets(top: 13, left: 16, bottom: 13, right: 16)
        parametersButton.addTarget(self, action: #selector(parametersButtonPressed), for: .touchUpInside)
    }
    
    @objc func searchButtonPressed() {
        print("The search button is pressed!")
    }
    
    @objc func parametersButtonPressed() {
        print("The parameters button is pressed!")
    }
    
    private func setSeparator() {
        
        let separatorTopView = UIView()
        separatorTopView.backgroundColor = .lightGray
        separatorTopView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorTopView)
        separatorTopView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        separatorTopView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        separatorTopView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        separatorTopView.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        
    }
}

// MARK: - TableViewDelegate/DataSource
extension CarsAdsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        visibleAds = visibleAds.filter {
            $0.isHidden == false
        }
        let count = visibleAds.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ad = visibleAds[indexPath.row]
        
        if !ad.isHidden {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "XibTableViewCell", for: indexPath) as? XibTableViewCell {
                cell.ad = ad
                cell.setInformation()
                cell.delegate = self
                cell.selectionStyle = .none
                cell.index = indexPath
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentAd = ads[indexPath.row]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let adInformationViewController = storyboard.instantiateViewController(identifier: "AdInformationViewController") as? AdInformationViewController {
            adInformationViewController.setCurrentAd(currentAd)
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            
            navigationController?.pushViewController(adInformationViewController, animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > self.lastContentOffset {
                    if bottomButtonsViewConstraint.constant == -20 {
                        UIView.animate(withDuration: 0.5) {
                            self.bottomButtonsViewConstraint.constant = 100
                            self.view.layoutIfNeeded()
                        }
                    }
                } else if scrollView.contentOffset.y < self.lastContentOffset {
                    if bottomButtonsViewConstraint.constant == 100 {
                        UIView.animate(withDuration: 0.5) {
                            self.bottomButtonsViewConstraint.constant = -20
                            self.view.layoutIfNeeded()
                        }
                    }
                }
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
}

extension CarsAdsViewController: XibTableViewCellDelegate {
    
    func collectionButtonTap(index: IndexPath?) {
        let currentAd = ads[index?.row ?? 0]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let adInformationViewController = storyboard.instantiateViewController(identifier: "AdInformationViewController") as? AdInformationViewController {
            adInformationViewController.setCurrentAd(currentAd)
            
            let backItem = UIBarButtonItem()
            backItem.title = ""
            navigationItem.backBarButtonItem = backItem
            
            navigationController?.pushViewController(adInformationViewController, animated: true)
        }
    }
    
    func hiddenButtonTap(index: IndexPath?) {
        if let index = index {
            visibleAds[index.row].isHidden.toggle()
            print("The hide button has been moved to: \(ads[index.row].isHidden). Announcement: \(visibleAds[index.row].name)")
        }
        carAdsTableView.reloadData()
        navigationItem.title = "\(visibleAds.count) объявление"
    }
    
    func favoriteButtonTap(index: IndexPath?) {
        if let index = index {
            visibleAds[index.row].isFavourites.toggle()
            print("The favorites button has been moved to: \(ads[index.row].isFavourites). Announcement: \(visibleAds[index.row].name)")
        }
        carAdsTableView.reloadData()
    }
    
    func leasingButtonTap(index: IndexPath?) {
        if let index = index {
            print("The leasing button is pressed! Announcement: \(ads[index.row].name)")
        }
    }
}
