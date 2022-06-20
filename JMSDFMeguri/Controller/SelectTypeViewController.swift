//
//  SelectTypeViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit
import FirebaseStorage
import SDWebImage

class SelectTypeViewController: UIViewController,loadOKDelegate {
    
    
    
    @IBOutlet weak var DDGButton: UIButton!
    @IBOutlet weak var DDButton: UIButton!
    @IBOutlet weak var DDHButton: UIButton!
    @IBOutlet weak var DEButton: UIButton!
    
    var loadDBModel = LoadDBModel()
    var buttonSetting = ButtonSetting()
    
    let alertController: UIAlertController = UIAlertController(title: "通信エラー", message: "電波状況の良いところで再度お試しください", preferredStyle: .alert)
    let defaultAction: UIAlertAction = UIAlertAction(title: "Default", style: .default, handler: { (action:UIAlertAction) -> Void in
        print("アラート表示")
    })
    
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
    
    func loadOK(check: Int) {
        if check == 2 {
            present(alertController, animated: true, completion: nil)
        }
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
