//
//  ShipDetailViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/21.
//

import UIKit
import SDWebImage

class ShipDetailViewController: UIViewController {
    
    
    @IBOutlet weak var shipImageView: UIImageView!
    @IBOutlet weak var shipTypeLabel: UILabel!
    @IBOutlet weak var shipNumberLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var homePortLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var displacementLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var topspeedLabel: UILabel!
    @IBOutlet weak var equipmentLabel: UILabel!
    @IBOutlet weak var careerLabel: UILabel!
    
 
    var loadDBModel = LoadDBModel()
    var shipName = String()
    var shipsArray = [DataSet]()
    var filteredShipsArray = [DataSet]()

    @IBOutlet weak var shipNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shipNameLabel.text = self.shipName
        
        filerdData()
        
        loadDBModel.createDownloadURL(passString: filteredShipsArray[0].shipImage1, completion: { [self] in
            self.shipImageView.sd_setImage(with: loadDBModel.downloadURL, completed: nil)
        })
        
        self.shipTypeLabel.text = filteredShipsArray[0].type
        self.shipNumberLabel.text = String(filteredShipsArray[0].number)
        self.commentLabel.text = filteredShipsArray[0].comment
        self.homePortLabel.text = filteredShipsArray[0].homePort
        self.birthdayLabel.text = filteredShipsArray[0].birthday
        self.lengthLabel.text = filteredShipsArray[0].length
        self.widthLabel.text = filteredShipsArray[0].width
        self.depthLabel.text = filteredShipsArray[0].depth
        self.displacementLabel.text = filteredShipsArray[0].displacement
        self.capacityLabel.text = filteredShipsArray[0].capacity
        self.topspeedLabel.text = filteredShipsArray[0].topSpeed
        self.equipmentLabel.text = filteredShipsArray[0].equipment
        self.careerLabel.text = filteredShipsArray[0].career
    }
    
    func filerdData(){
        self.filteredShipsArray = self.shipsArray.filter ({
            
            (data: DataSet) -> Bool in
            
            //フィルター結果として、残したい要素だけtrueを返す（検索条件）
            return data.shipName == "\(self.shipName)"
        })
    }
        
    
    


 
}
