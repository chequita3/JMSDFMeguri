//
//  ViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/03/28.
//

import UIKit
import FirebaseStorage
import SDWebImage

class ViewController: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getImage(_ sender: Any) {
        
        let gsRef = Storage.storage().reference(withPath: "護衛艦/ひゅうが1.jpeg")
        
        gsRef.downloadURL { url, error in
            if error != nil {
                print("error")
            } else {
                self.image.sd_setImage(with: url, completed: nil)
            }
        }
        print("ボタン押した")
    }
    
}

