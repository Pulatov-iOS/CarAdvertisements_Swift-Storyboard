//
//  XibTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 11.12.23.
//

import UIKit

final class XibTableViewCell: UITableViewCell {

    @IBOutlet private weak var adCarView: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var nameAdLabel: UILabel!
    @IBOutlet private weak var priceAdLabel: UILabel!
    @IBOutlet private weak var currencyAdLabel: UILabel!
    @IBOutlet private weak var usdPriceAdLabel: UILabel!
    @IBOutlet private weak var photoCollectionView: UICollectionView!
    @IBOutlet private weak var descriptionAdLabel: UILabel!
    @IBOutlet private weak var vimAndTopButtonView: UIView!
    @IBOutlet private weak var locationAdLabel: UILabel!
    @IBOutlet private weak var leasingAdLabel: UILabel!
    @IBOutlet private weak var leasingFromAdLabel: UILabel!
    @IBOutlet private weak var leasingPriceAdLabel: UILabel!
    @IBOutlet private weak var leasingDateAdLabel: UILabel!
    @IBOutlet private weak var isHiddenButtonImage: UIImageView!
    @IBOutlet private weak var isFavoriteButtonImage: UIImageView!
    
    @IBAction private func hideButtonTapped(_ sender: Any) {
        print("Hide Button Tapped!")
    }
    
    @IBAction private func favoritesButtonTapped(_ sender: Any) {
        print("Favorites Button Tapped!")
    }
    
    var ad: Car?
    private var photos = [UIImage]()
    private let layout = UICollectionViewFlowLayout()
    private let manager = Manager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        adCarView.layer.cornerRadius = 10
        
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        photoCollectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 200, height: 150)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInformation() {
        if let ad = ad {
            nameAdLabel.text = ad.name
            priceAdLabel.text = String(Int(ad.price))
            currencyAdLabel.text = "р."
            usdPriceAdLabel.text = "≈ \(manager.usdPrice(price: ad.price)) $"
            
            for photo in ad.imageNames {
                self.photos.append(.init(named: photo) ?? UIImage())
            }
            photoCollectionView.reloadData()
            
            var typeBox = ""
            switch ad.typeBox {
            case .automatic:
                typeBox = "автомат"
            case .manual:
                typeBox = "ручная"
            }
            
            var engineType = ""
            switch ad.engineType {
            case .petrol:
                engineType = "бензин"
            case .diesel:
                engineType = "дизель"
            case .electric:
                engineType = "электрический"
            }
            
            var bodyType = ""
            switch ad.bodyType {
            case .sedan:
                bodyType = "седан"
            case .hatchback:
                bodyType = "хэтчбек"
            case .stationWagon:
                bodyType = "пассажирский вагон"
            case .liftback:
                bodyType = "лифтбек"
            case .coupe:
                bodyType = "купе"
            case .convertible:
                bodyType = "кабриолет"
            case .roadster:
                bodyType = "родстер"
            case .stretch:
                bodyType = "стреч"
            case .targa:
                bodyType = "тарга"
            case .suv:
                bodyType = "внедорожник"
            case .crossover:
                bodyType = "кроссовер"
            case .pickupTruck:
                bodyType = "грузовик-пикап"
            case .van:
                bodyType = "фургон"
            case .Minivan:
                bodyType = "микроавтобус"
            }
            
            descriptionAdLabel.text = "\(ad.yearRelease) г., \(typeBox), \(ad.volumeEngine) л, \(engineType), \(bodyType), \(ad.mileage) км"
            locationAdLabel.text = "\(ad.location) · \(ad.date)"
            leasingAdLabel.text = "Лизинг"
            leasingFromAdLabel.text = "от"
            leasingPriceAdLabel.text = "\(String(manager.costOfLeasing(price: ad.price))) BYN"
            leasingDateAdLabel.text = "/месяц"
            
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
}

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
