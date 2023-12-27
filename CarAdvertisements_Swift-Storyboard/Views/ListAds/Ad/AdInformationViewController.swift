//
//  AdInformationViewController.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

enum CarViewSection {
    case mainInfo(Car)
    case options(CarOptions)
    case buttons(ButtonDescription)
}

struct CarOptions {
    let title: String
    let options: [String]
}

struct ButtonDescription {
    let title: String
    let descriptions: String
}

final class AdInformationViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private properties
    private let callButton = UIButton(type: .system)
    private let messageButton = UIButton()
    private var currentAd: Car?
    private var sections = [CarViewSection]()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        makeData()
        addButtons()
        addRightButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController!.tabBar.isHidden = true
        callButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.67).isActive = true
        messageButton.widthAnchor.constraint(equalToConstant: view.frame.width * 0.2).isActive = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController!.tabBar.isHidden = false
    }

    // MARK: - Helpers
    func setCurrentAd(_ ad: Car) {
        currentAd = ad
    }
    
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "DetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailsTableViewCell")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.register(UINib(nibName: "ComplainTableViewCell", bundle: nil), forCellReuseIdentifier: "ComplainTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func makeData() {
        
        if let currentAd = currentAd {
            
            let description = "\(currentAd.yearRelease) г., \(currentAd.typeBox.stringValue), \(currentAd.volumeEngine) л, \(currentAd.engineType.stringValue), \(currentAd.bodyType.stringValue), \(currentAd.mileage) км"
            
            let mainInfoSection: CarViewSection = .mainInfo(currentAd)
            let descriptionSection: CarViewSection = .options(CarOptions(title: description, options: ["\(currentAd.location)\nОпубликовано \(currentAd.date)"]))
            let specificationSection: CarViewSection = .options(CarOptions(title: "Описание", options: [currentAd.description]))
            let equipmentSection: CarViewSection = .options(CarOptions(title: "Комплектация", options: [currentAd.equipment]))
            let carToExhange: CarViewSection
            if !currentAd.isExchange {
                carToExhange = .options(CarOptions(title: "Обмен не интересует", options: ["Продавца не интересуют предложения по обмену"]))
            } else {
                carToExhange = .options(CarOptions(title: "Обмен интересует", options: ["Продавца интересуют предложения по обмену"]))
            }
            let complainSection: CarViewSection = .buttons(ButtonDescription(title: "Пожаловаться", descriptions: "\(currentAd.id)"))
            
            sections.append(contentsOf: [mainInfoSection, descriptionSection, specificationSection, equipmentSection, carToExhange, complainSection])
            tableView.reloadData()
        }
    }
    
    private func addRightButton() {
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc private func rightButtonTapped() {
         print("Parameters list!")
    }
    
    private func addButtons() {
        view.addSubview(callButton)
        callButton.translatesAutoresizingMaskIntoConstraints = false
        callButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        callButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        callButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        callButton.backgroundColor = UIColor(red: 14/255, green: 170/255, blue: 113/255, alpha: 1)
        callButton.layer.cornerRadius = 10
        callButton.setTitle("Позвонить...", for: .normal)
        callButton.setTitleColor(.white, for: .normal)
        callButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        callButton.addTarget(self, action: #selector(callButtonPressed), for: .touchUpInside)
        
        view.addSubview(messageButton)
        messageButton.translatesAutoresizingMaskIntoConstraints = false
        messageButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        messageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        messageButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        messageButton.backgroundColor = UIColor(red: 14/255, green: 170/255, blue: 113/255, alpha: 1)
        messageButton.layer.cornerRadius = 10
        messageButton.setImage(UIImage(named: "ButtonMessageImage"), for: .normal)
        messageButton.addTarget(self, action: #selector(messageButtonPressed), for: .touchUpInside)
    }
    
    @objc func callButtonPressed() {
        print("The call button is pressed!")
    }
    
    @objc func messageButtonPressed() {
        print("The message button is pressed!")
    }
}

// MARK: - TableViewDelegate/DataSource
extension AdInformationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = sections[indexPath.row]
        
        switch currentSection {
        case .mainInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell {
                if let currentAd = currentAd {
                    cell.setInformation(currentAd)
                }
                return cell
            }
        case .options(let carOptions):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell {
                cell.setInformation(title: carOptions.title, options: carOptions.options)
                return cell
            }
        case.buttons(let buttonDescription):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ComplainTableViewCell", for: indexPath) as? ComplainTableViewCell {
                cell.setNumberAd(buttonDescription.descriptions)
                return cell
            }
    }
        return UITableViewCell()
    }
}
