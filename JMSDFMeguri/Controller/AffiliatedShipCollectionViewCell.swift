//
//  AffiliatedShipCollectionViewCell.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/25.
//

import UIKit
import SDWebImage

class AffiliatedShipCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var shipImageView: UIImageView!
    @IBOutlet weak var shipNumberLabel: UILabel!
    @IBOutlet weak var shipNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: String, number: Int, name: String){
        
        let url = URL(string: image)
        shipImageView.sd_setImage(with: url, completed: nil)
        shipNumberLabel.text = String(number)
        shipNameLabel.text = name
    }

}
