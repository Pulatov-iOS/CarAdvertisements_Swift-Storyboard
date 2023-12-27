//
//  ComplainTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

final class ComplainTableViewCell: UITableViewCell {
    
    // MARK: - @IBOutlet
    @IBOutlet private weak var NumberAdLabel: UILabel!
    
    // MARK: - @IBAction
    @IBAction func complainButtonTapped(_ sender: Any) {
        print("The complain button is pressed!")
    }
    
    // MARK: - Helpers
    func setNumberAd(_ numberAd: String) {
        NumberAdLabel.text = "ОБЪЯВЛЕНИЕ №" + numberAd
    }
}
