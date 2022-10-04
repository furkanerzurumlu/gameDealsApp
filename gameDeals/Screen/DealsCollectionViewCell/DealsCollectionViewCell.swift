//
//  DealsCollectionViewCell.swift
//  gameDeals
//
//  Created by Furkan Erzurumlu on 4.10.2022.
//

import UIKit

class DealsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var firstLayer: UIView!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var normalPrice: UILabel!
    @IBOutlet weak var dealPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstLayer.layer.cornerRadius = 10
    }

}

extension DealsCollectionViewCell{
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nibName: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}
