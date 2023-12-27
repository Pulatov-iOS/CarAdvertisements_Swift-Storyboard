//
//  DetailsTableViewCell.swift
//  CarAdvertisements_Swift-Storyboard
//
//  Created by Alexander on 27.12.23.
//

import UIKit

final class DetailsTableViewCell: UITableViewCell {

    private var photos = [UIImage]()
    private let layout = UICollectionViewFlowLayout()
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var usdPrice: UILabel!
    @IBOutlet private weak var leasingPriceLabel: UILabel!
    @IBOutlet private weak var photoCollectionView: UICollectionView!
    @IBOutlet weak var leasingView: UIView!
    
    @IBAction func priceButtonTapped(_ sender: Any) {
        print("Price descriptions are open!")
    }
    
    @IBAction func leasingButtonTapped(_ sender: Any) {
        print("The leasing button is pressed!")
    }

    @IBAction func shareButtonTapped(_ sender: Any) {
        print("The share button is pressed!")
    }

    @IBAction func commentsButtonTapped(_ sender: Any) {
        print("The comments button is pressed!")
    }

    @IBAction func favouritesButtonTapped(_ sender: Any) {
        print("The favourites button is pressed!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
       
        photoCollectionView.delegate = self
        photoCollectionView.dataSource = self
        photoCollectionView.register(UINib(nibName: "PageIconCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PageIconCollectionViewCell")
        photoCollectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: 350, height: 220)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 2
        
        leasingView.layer.cornerRadius = 12
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setInformation(_ ad: Car) {
        
        let priceManager = PriceManager()
        
        nameLabel.text = ad.name
        priceLabel.text = "\(Int(ad.price))"
        usdPrice.text = "≈ \(Int(priceManager.usdPrice(price: ad.price))) $"
        leasingPriceLabel.text = "Лизинг\nот \(priceManager.costOfLeasing(price: ad.price)) BYN в месяц"
        
        for photo in ad.imageNames {
            photos.append(UIImage(named: photo) ?? UIImage())
        }
        photoCollectionView.reloadData()
    }
    
}

extension DetailsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let iconCell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: "PageIconCollectionViewCell", for: indexPath) as? PageIconCollectionViewCell {
            iconCell.setImage(photos[indexPath.row])
            return iconCell
        }
        return UICollectionViewCell()
    }
}
