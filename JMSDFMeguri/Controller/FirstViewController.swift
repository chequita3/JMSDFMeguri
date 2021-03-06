//
//  ViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/03/28.
//

import UIKit
import FirebaseStorage
import SDWebImage
import SwiftUI

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var numAndNameButton: UIButton!
    @IBOutlet weak var homeportButton: UIButton!
    @IBOutlet weak var typeButton: UIButton!
    
    var buttonSetting = ButtonSetting()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "背景（昼）")
        
        buttonSetting.settingButton(passedButton: numAndNameButton)
        buttonSetting.settingButton(passedButton: homeportButton)
        buttonSetting.settingButton(passedButton: typeButton)
        
    }
    
    
    
    @IBAction func toSearchVC(_ sender: Any) {
        let searchVC = self.storyboard?.instantiateViewController(identifier: "searchVC") as! SearchViewController
        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    
    @IBAction func toSelectHPVC(_ sender: Any) {
        let selectHPVC = self.storyboard?.instantiateViewController(identifier: "selectHPVC") as! SelectHPViewController
        
        navigationController?.pushViewController(selectHPVC, animated: true)
    }
    
    @IBAction func toSelectTypeVC(_ sender: Any) {
        let selectTypeVC = self.storyboard?.instantiateViewController(identifier: "selectTypeVC") as! SelectTypeViewController
        
        navigationController?.pushViewController(selectTypeVC, animated: true)
    }
    
    
    @IBAction func privacyPolicy(_ sender: Any) {
        let url = URL(string: "https://gist.github.com/chequita3/f3cf3c1731c704632db91ab1fb2db535")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

