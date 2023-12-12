//
//  XibTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 11.12.23.
//

import UIKit

protocol XibTableViewCellDelegate: AnyObject {
    func hiddenButtonTap(index: IndexPath?)
    func favoriteButtonTap(index: IndexPath?)
    func leasingButtonTap(index: IndexPath?)
}

final class XibTableViewCell: UITableViewCell {

    // MARK: - @IBOutlet
    @IBOutlet private weak var adCarView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameAdLabel: UILabel!
    @IBOutlet private weak var priceAdLabel: UILabel!
    @IBOutlet private weak var currencyAdLabel: UILabel!
    @IBOutlet private weak var usdPriceAdLabel: UILabel!
    @IBOutlet private weak var photoCollectionView: UICollectionView!
    @IBOutlet private weak var descriptionAdLabel: UILabel!
    @IBOutlet private weak var locationAdLabel: UILabel!
    @IBOutlet private weak var leasingAdLabel: UILabel!
    @IBOutlet private weak var leasingFromAdLabel: UILabel!
    @IBOutlet private weak var leasingPriceAdLabel: UILabel!
    @IBOutlet private weak var leasingDateAdLabel: UILabel!
    @IBOutlet private weak var isHiddenButtonImage: UIImageView!
    @IBOutlet private weak var isFavoriteButtonImage: UIImageView!
    @IBOutlet private weak var topAndVinButtonsStackView: UIStackView!
    
    // MARK: - @IBAction
    @IBAction private func hideButtonTapped(_ sender: Any) {
        delegate?.hiddenButtonTap(index: index)
    }
    
    @IBAction private func favoritesButtonTapped(_ sender: Any) {
        delegate?.favoriteButtonTap(index: index)
    }
    
    @IBAction func leasingButtonTapped(_ sender: Any) {
        delegate?.leasingButtonTap(index: index)
    }
    
    // MARK: - Public properties
    var index: IndexPath?
    var ad: Car?
    weak var delegate: XibTableViewCellDelegate?
    
    // MARK: - Private properties
    private let horizontalStackView = UIStackView()
    private var photos = [UIImage]()
    private let layout = UICollectionViewFlowLayout()
    private let manager = PriceManager()
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
       
        adCarView.layer.cornerRadius = 10
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        photoCollectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 300, height: 250)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        for arrangedSubview in horizontalStackView.arrangedSubviews {
            horizontalStackView.removeArrangedSubview(arrangedSubview)
            arrangedSubview.removeFromSuperview()
        }
    }

    // MARK: - Helpers
    func setInformation() {
        if let ad = ad {
            nameAdLabel.text = ad.name
            priceAdLabel.text = String(Int(ad.price))
            currencyAdLabel.text = "р."
            usdPriceAdLabel.text = "≈ \(manager.usdPrice(price: ad.price)) $"
            
            photos.removeAll()
            for photo in ad.imageNames {
                self.photos.append(.init(named: photo) ?? UIImage())
            }
            photoCollectionView.reloadData()
            
            descriptionAdLabel.text = "\(ad.yearRelease) г., \(ad.typeBox.stringValue), \(ad.volumeEngine) л, \(ad.engineType.stringValue), \(ad.bodyType.stringValue), \(ad.mileage) км"
            locationAdLabel.text = "\(ad.location) · \(ad.date)"
            leasingAdLabel.text = "Лизинг"
            leasingFromAdLabel.text = "от"
            leasingPriceAdLabel.text = "\(String(manager.costOfLeasing(price: ad.price))) BYN"
            leasingDateAdLabel.text = "/месяц"
            
            addingTopAndVinIcons(isTop: ad.isTop, isVin: ad.isVIN)

            changeHideButton()
            changeFavoritesButton()
        }
    }
    
    func changeHideButton() {
        if ad?.isHidden ?? false {
            isHiddenButtonImage.image = .init(systemName: "eye.slash.fill")
        } else {
            isHiddenButtonImage.image = .init(systemName: "eye.slash")
        }
    }
    
    func changeFavoritesButton() {
        if ad?.isFavourites ?? false {
            isFavoriteButtonImage.image = .init(systemName: "bookmark.fill")
        } else {
            isFavoriteButtonImage.image = .init(systemName: "bookmark")
        }
    }
    
    func addingTopAndVinIcons(isTop: Bool, isVin: Bool) {
        
        if isTop || isVin {
            horizontalStackView.axis = .horizontal
            horizontalStackView.spacing = 4
            topAndVinButtonsStackView.addArrangedSubview(horizontalStackView)
            topAndVinButtonsStackView.spacing = 8
            
            if isTop {
                let topIconImage = UIImageView(image: UIImage(named: "TopButtonImage"))
                topIconImage.contentMode = .scaleAspectFit
                topIconImage.widthAnchor.constraint(equalToConstant: 53).isActive = true
                topIconImage.heightAnchor.constraint(equalToConstant: 32).isActive = true
                horizontalStackView.addArrangedSubview(topIconImage)
            }
            if isVin {
                let topIconImage = UIImageView(image: UIImage(named: "VinButtonImage"))
                topIconImage.contentMode = .scaleAspectFit
                topIconImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
                topIconImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
                horizontalStackView.addArrangedSubview(topIconImage)
            }
            
            let spacerView = UIView()
            spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
            spacerView.translatesAutoresizingMaskIntoConstraints = false
            horizontalStackView.addArrangedSubview(spacerView)
        }
    }
}

// MARK: - CollectionViewDelegate/DataSource
extension XibTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell {
            
            var isRadius = ""
            switch indexPath.row {
            case 0:
                isRadius = "first"
            case photos.count - 1:
                isRadius = "last"
            default:
                isRadius = ""
            }
            
            iconCell.setImage(photos[indexPath.row], isRadius: isRadius)
            return iconCell
        }
        
        return UICollectionViewCell()
    }
}
