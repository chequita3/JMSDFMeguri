//
//  SelectHPViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit

class SelectHPViewController: UIViewController {
    
    @IBOutlet weak var ominatoButton: UIButton!
    @IBOutlet weak var yokosukaButton: UIButton!
    @IBOutlet weak var maizuruButton: UIButton!
    @IBOutlet weak var kureButton: UIButton!
    @IBOutlet weak var saseboButton: UIButton!
    
    var loadDBModel = LoadDBModel()
    var buttonSetting = ButtonSetting()
    var shadowView1 = UIView()
    var shadowView2 = UIView()
    var shadowView3 = UIView()
    var shadowView4 = UIView()
    var shadowView5 = UIView()



    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "背景（夕方）")
        loadDBModel.loadContents()

        buttonSetting.settingButton(passedButton: ominatoButton)
        buttonSetting.settingButton(passedButton: yokosukaButton)
        buttonSetting.settingButton(passedButton: maizuruButton)
        buttonSetting.settingButton(passedButton: kureButton)
        buttonSetting.settingButton(passedButton: saseboButton)
    }
    


    
    @IBAction func ominato(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "大湊"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func yokosuka(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "横須賀"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func maizuru(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "舞鶴"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func kure(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "呉"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func sasebo(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "佐世保"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
}





        

