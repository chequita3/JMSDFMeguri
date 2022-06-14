//
//  SelectTypeViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit
import FirebaseStorage
import SDWebImage

class SelectTypeViewController: UIViewController {
    
    @IBOutlet weak var DDGButton: UIButton!
    @IBOutlet weak var DDButton: UIButton!
    @IBOutlet weak var DDHButton: UIButton!
    @IBOutlet weak var DEButton: UIButton!
    
    var loadDBModel = LoadDBModel()
    var buttonSetting = ButtonSetting()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDBModel.loadContents()
        
        self.view.addBackground(name: "背景（朝日）")
        buttonSetting.settingButton(passedButton: DDGButton)
        buttonSetting.settingButton(passedButton: DDButton)
        buttonSetting.settingButton(passedButton: DDHButton)
        buttonSetting.settingButton(passedButton: DEButton)
        // Do any additional setup after loading the view.
    }
    



    
    
    @IBAction func ButtonForDDG(_ sender: Any) {
        let SortedShipVC = self.storyboard?.instantiateViewController(identifier: "SortedShipVC") as! SortedShipViewController
        
        SortedShipVC.shipsArray = self.loadDBModel.dataSets
        SortedShipVC.shipType = "DDG"
        navigationController?.pushViewController(SortedShipVC, animated: true)
    }
    
    
    @IBAction func ButtonForDD(_ sender: Any) {
        let SortedShipVC = self.storyboard?.instantiateViewController(identifier: "SortedShipVC") as! SortedShipViewController
        
        SortedShipVC.shipsArray = self.loadDBModel.dataSets
        SortedShipVC.shipType = "DD"
        navigationController?.pushViewController(SortedShipVC, animated: true)
    }
    
    
    @IBAction func ButtonForDDH(_ sender: Any) {
        let SortedShipVC = self.storyboard?.instantiateViewController(identifier: "SortedShipVC") as! SortedShipViewController
        
        SortedShipVC.shipsArray = self.loadDBModel.dataSets
        SortedShipVC.shipType = "DDH"
        navigationController?.pushViewController(SortedShipVC, animated: true)
    }
    
    
    @IBAction func ButtonForDE(_ sender: Any) {
        let SortedShipVC = self.storyboard?.instantiateViewController(identifier: "SortedShipVC") as! SortedShipViewController
        
        SortedShipVC.shipsArray = self.loadDBModel.dataSets
        SortedShipVC.shipType = "DE"
        navigationController?.pushViewController(SortedShipVC, animated: true)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
