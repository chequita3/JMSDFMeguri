//
//  ButtonSetting.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/06/02.
//

import UIKit

class ButtonSetting: UIButton {
    
    func settingButton(passedButton: UIButton) {
        passedButton.layer.cornerRadius = 10
        passedButton.layer.masksToBounds = true
        passedButton.layer.borderColor = UIColor.blue.cgColor
        passedButton.layer.borderWidth = 2
        
        
        

    }
}
