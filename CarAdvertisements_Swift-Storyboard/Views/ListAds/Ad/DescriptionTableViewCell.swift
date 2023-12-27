//
//  DescriptionTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

final class DescriptionTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var optionsStackView: UIStackView!
    
    // MARK: - Private properties
    private var label = UILabel()
    
    // MARK: - Helpers
    func setInformation(title: String, options: [String]) {
        titleLabel.text = title
        options.forEach {
            label.text = $0
            label.textColor = .gray
            label.numberOfLines = 0
            label.font = .systemFont(ofSize: 18)
            optionsStackView.insertArrangedSubview(label, at: 0)
        }
    }
}
