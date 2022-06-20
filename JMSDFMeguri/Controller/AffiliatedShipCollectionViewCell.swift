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
    
    let alertController: UIAlertController = UIAlertController(title: "通信エラー", message: "電波状況の良いところで再度お試しください", preferredStyle: .alert)
    let defaultAction: UIAlertAction = UIAlertAction(title: "Default", style: .default, handler: { (action:UIAlertAction) -> Void in
        print("アラート表示")
    })
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setup(image: String, number: Int, name: String) {
        

        
        loadDBModel.createDownloadURL(passString: image, completion: { [self] in
            self.shipImageView.sd_setImage(with: loadDBModel.downloadURL, completed: nil)
        })
        

        shipNumberLabel.text = String(number)
        shipNameLabel.text = name
        
        clipsToBounds = true
        layer.cornerRadius = 8.0
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
    }
    
}
