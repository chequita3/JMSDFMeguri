//
//  ViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/03/28.
//

import UIKit
import FirebaseStorage
import SDWebImage

class FirstViewController: UIViewController {
    
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
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
    
}

