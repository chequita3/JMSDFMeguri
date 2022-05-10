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
    
    var loadDBModel = LoadDBModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDBModel.loadOKDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        //無効にする
        view.window?.beginIgnoringInteractionEvents()

        loadDBModel.loadContents()
        
    }

    func loadOK(check: Int) {
        if check == 1 {
            //有効にする
            view.window?.endIgnoringInteractionEvents()
            
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
