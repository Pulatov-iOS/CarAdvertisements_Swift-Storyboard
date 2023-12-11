//
//  CarsAdsViewController.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 4.12.23.
//

import UIKit

final class CarsAdsViewController: UIViewController {

    @IBOutlet private weak var carAdsTableView: UITableView!
    
    let ads = [
        Car(id: 53453453451, name: "Nissan GT-R R35 Рестайлинг", price: 159288, yearRelease: 2010, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 158000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car1", "Car1", "Car1", "Car1"], isTop: true, isVIN: true),
        Car(id: 53453453452, name: "Nissan GT-R R35", price: 213246, yearRelease: 2012, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 190000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car2", "Car2", "Car2", "Car2"], isTop: true),
        Car(id: 53453453453, name: "Nissan GT R46", price: 112960, yearRelease: 2019, typeBox: .automatic, volumeEngine: 2.8, engineType: .petrol, bodyType: .coupe, mileage: 70000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car3", "Car3", "Car3", "Car3"], isVIN: true),
        Car(id: 53453453454, name: "Nissan R70 Рестайлинг", price: 79800, yearRelease: 2008, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 254000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car4", "Car4", "Car4", "Car4"]),
        Car(id: 53453453455, name: "Nissan GT-R R35", price: 138900, yearRelease: 2011, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 260000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "10 окт", imageNames: ["Car5", "Car5", "Car5", "Car5"]),
        Car(id: 53453453456, name: "BMW X6 Рестайлинг", price: 190288, yearRelease: 2019, typeBox: .automatic, volumeEngine: 3.8, engineType: .petrol, bodyType: .coupe, mileage: 58000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car6", "Car6", "Car6", "Car6"], isTop: true, isVIN: true),
        Car(id: 53453453457, name: "BMW X6", price: 223246, yearRelease: 2022, typeBox: .automatic, volumeEngine: 3.2, engineType: .petrol, bodyType: .coupe, mileage: 10000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "11 окт", imageNames: ["Car7", "Car7", "Car7", "Car7"], isTop: true),
        Car(id: 53453453458, name: "BMW X6 Рестайлинг", price: 212960, yearRelease: 2017, typeBox: .automatic, volumeEngine: 4.8, engineType: .petrol, bodyType: .coupe, mileage: 50000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "11 окт", imageNames: ["Car8", "Car8", "Car8", "Car8"], isVIN: true),
        Car(id: 53453453459, name: "BMW X6", price: 179800, yearRelease: 2020, typeBox: .automatic, volumeEngine: 1.8, engineType: .diesel, bodyType: .coupe, mileage: 4000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Брест", date: "12 окт", imageNames: ["Car9", "Car9", "Car9", "Car9"]),
        Car(id: 53453453460, name: "BMW X6", price: 158900, yearRelease: 2023, typeBox: .automatic, volumeEngine: 2.8, engineType: .diesel, bodyType: .coupe, mileage: 160000, description: "Black серия\nABS, подогрев ручек, бортовой компьютер\nРодной пробег, растаможке под 100 %\nПроходит в РФ\nСрочно!!", equipment: "ABS\nКофры\nПодогрев ручек", location: "Минск", date: "16 окт", imageNames: ["Car10", "Car10", "Car10", "Car10"])
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        setSeparator()
        
        carAdsTableView.dataSource = self
        carAdsTableView.delegate = self
        carAdsTableView.separatorStyle = .none
        carAdsTableView.register(UINib(nibName: "XibTableViewCell", bundle: nil), forCellReuseIdentifier: "XibTableViewCell")
        carAdsTableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)

        let rightButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(rightButtonTapped))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let topViewController = navigationController?.topViewController {
            topViewController.title = "\(ads.count) объявление"
        }
    }

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
        
        let separatorBottomView = UIView()
        separatorBottomView.backgroundColor = .lightGray
        separatorBottomView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(separatorBottomView)
        separatorBottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        separatorBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        separatorBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        separatorBottomView.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        
    }
}

// MARK: - TableViewDelegate/DataSource
extension CarsAdsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "XibTableViewCell", for: indexPath) as? XibTableViewCell {
            let ad = ads[indexPath.row]
            cell.ad = ad
            cell.setInformation()
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}
