//
//  AffiliatedShipCollectionViewCell.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/25.
//

import UIKit
import SDWebImage
import SwiftUI

class AffiliatedShipCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var shipImageView: UIImageView!
    @IBOutlet weak var shipNumberLabel: UILabel!
    @IBOutlet weak var shipNameLabel: UILabel!
    
    var loadDBModel = LoadDBModel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setup(image: String, number: Int, name: String) {
        
        
        loadDBModel.createDownloadURL(passString: image, completion: { [self] in
            self.shipImageView.sd_setImage(with: loadDBModel.downloadURL, completed: nil)
            print("画像セット")
        })

        
        
        shipNumberLabel.text = String(number)
        shipNameLabel.text = name
    }

}
