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
    @IBOutlet weak var dealRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setCellLayout()
    }

    func setCellLayout(){
        firstLayer.layer.cornerRadius = 10
        self.firstLayer.layer.borderWidth = 2
        self.firstLayer.layer.borderColor = UIColor.black.cgColor
        
        self.dealRating.layer.cornerRadius = self.dealRating.frame.size.width/2
        self.dealRating.clipsToBounds = true
        self.dealRating.backgroundColor = .red
        self.dealRating.layer.borderWidth = 1
        self.dealRating.layer.borderColor = UIColor.black.cgColor
        
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
