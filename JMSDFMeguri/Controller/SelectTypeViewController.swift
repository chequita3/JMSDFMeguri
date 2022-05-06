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
    
    let storage = Storage.storage()
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func pickImageButton(_ sender: Any) {
        
        let storageRef = storage.reference(forURL: "gs://jmsdfmeguri.appspot.com/Destroyer/Hyuga1.jpeg")
        storageRef.downloadURL { url, error in
            if error != nil {
                print("error")
            } else {
                self.image.sd_setImage(with: url, completed: nil)
            }
        }
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
