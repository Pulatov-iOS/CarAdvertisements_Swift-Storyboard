//
//  ImageCollectionViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 11.12.23.
//

import UIKit

final class ImageCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlet
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
        imageView.contentMode = .scaleAspectFill
    }

    // MARK: - Helpers
    func setImage(_ image: UIImage, isRadius: String) {
        imageView.image = image
        
        switch isRadius {
        case "first":
            imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
            imageView.layer.cornerRadius = 8
        case "last":
            imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            imageView.layer.cornerRadius = 8
        default:
            print()
        }
    }
}
