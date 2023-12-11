//
//  CarsAdsViewController.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 4.12.23.
//

import UIKit

final class CarsAdsViewController: UIViewController {

    @IBOutlet private weak var carAdsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        carAdsTableView.dataSource = self
        carAdsTableView.delegate = self
    }

}

extension CarsAdsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        cell.textLabel?.text = ""
        return cell
    }
    
}
