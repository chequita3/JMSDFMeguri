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
    
    var loadDBModel = LoadDBModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    func setup(image: String, number: Int, name: String) {
        
        
        loadDBModel.createDownloadURL(passString: image, completion: { [self] in
            self.shipImageView.sd_setImage(with: loadDBModel.downloadURL, completed: nil)
        })
        
        
        
        shipNumberLabel.text = String(number)
        shipNameLabel.text = name
    }
    
}
