//
//  CarsAdsViewController.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 4.12.23.
//

import UIKit

final class CarsAdsViewController: UIViewController, XibTableViewCellDelegate {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var carAdsTableView: UITableView!
    
    // MARK: - Private properies
    private var ads = [
        Car(id: 53453453451, name: "Nissan GT-R R35 Рестайлинг", price: 159288, yearRelease: 2010, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 158000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car1", "Car1", "Car1", "Car1"], isTop: true, isVIN: true),
        Car(id: 53453453452, name: "Nissan GT-R R35", price: 213246, yearRelease: 2012, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 190000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car2", "Car2", "Car2", "Car2"], isTop: true),
        Car(id: 53453453453, name: "Nissan GT R46", price: 112960, yearRelease: 2019, typeBox: .automatic, volumeEngine: 2.8, engineType: .petrol, bodyType: .coupe, mileage: 70000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car3", "Car3", "Car3", "Car3"], isVIN: true),
        Car(id: 53453453454, name: "Nissan R70 Рестайлинг", price: 79800, yearRelease: 2008, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 254000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car4", "Car4", "Car4", "Car4"]),
        Car(id: 53453453455, name: "Nissan GT-R R35", price: 138900, yearRelease: 2011, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 260000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "10 окт", imageNames: ["Car5", "Car5", "Car5", "Car5"]),
        Car(id: 53453453456, name: "BMW X6 Рестайлинг", price: 190288, yearRelease: 2019, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 58000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car6", "Car6", "Car6", "Car6"], isTop: true, isVIN: true),
        Car(id: 53453453457, name: "BMW X6", price: 223246, yearRelease: 2022, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 10000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car7", "Car7", "Car7", "Car7"], isTop: true),
        Car(id: 53453453458, name: "BMW X6 Рестайлинг", price: 212960, yearRelease: 2017, typeBox: .automatic, volumeEngine: 4.8, engineType: .petrol, bodyType: .coupe, mileage: 50000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "11 окт", imageNames: ["Car8", "Car8", "Car8", "Car8"], isVIN: true),
        Car(id: 53453453459, name: "BMW X6", price: 179800, yearRelease: 2020, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 4000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car9", "Car9", "Car9", "Car9"]),
        Car(id: 53453453460, name: "BMW X6", price: 158900, yearRelease: 2023, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 160000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "16 окт", imageNames: ["Car10", "Car10", "Car10", "Car10"], isFavourites: true)
    ]
    private var visibleAds: [Car] = []
    private let bottomButtonsView = UIView()
    private let searchButton = UIButton(type: .custom)
    private let parametersButton = UIButton(type: .custom)
    private var lastContentOffset: CGFloat = 0
    private var bottomButtonsViewConstraint: NSLayoutConstraint!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
        visibleAds = ads.filter {
            $0.isHidden == false
        }
        
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        setSeparator()
        
        carAdsTableView.dataSource = self
        carAdsTableView.delegate = self
        carAdsTableView.separatorStyle = .none
        carAdsTableView.register(UINib(nibName: "XibTableViewCell", bundle: nil), forCellReuseIdentifier: "XibTableViewCell")

        let rightButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
        
        addButtons()
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
    @objc private func rightButtonTapped() {
         print("Sorting list!")
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
    
    private func addButtons() {
        
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
        print("Ad \"\(visibleAds[indexPath.row].name)\" tapped!")
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
