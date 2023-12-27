//
//  ComplainTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

final class ComplainTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var NumberAdLabel: UILabel!
    
    @IBAction func complainButtonTapped(_ sender: Any) {
        print("The complain button is pressed!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setNumberAd(_ numberAd: String) {
        NumberAdLabel.text = "ОБЪЯВЛЕНИЕ №" + numberAd
    }
}
