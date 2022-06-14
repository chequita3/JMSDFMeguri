//
//  TableViewCell.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/05/08.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(number: Int, name: String) {
        numberLabel.text = String(number)
        nameLabel.text = name
    }
    
}
