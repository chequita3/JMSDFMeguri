//
//  CareerTableViewCell.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/06/07.
//

import UIKit

class CareerTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var eventLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(year: String, event: String) {
        
        yearLabel.text = year
        eventLabel.text = event
        
        yearLabel.sizeToFit()
        eventLabel.sizeToFit()
        

        
    }

    
}
