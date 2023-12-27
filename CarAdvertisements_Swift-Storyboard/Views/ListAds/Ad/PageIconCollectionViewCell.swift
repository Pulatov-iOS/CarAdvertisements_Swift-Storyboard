//
//  PageIconCollectionViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

final class PageIconCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.layer.cornerRadius = 10
    }

    func setImage(_ image: UIImage) {
        iconImageView.image = image
    }
}
