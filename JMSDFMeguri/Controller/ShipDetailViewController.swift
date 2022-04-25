//
//  ShipDetailViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/21.
//

import UIKit

class ShipDetailViewController: UIViewController {
    
    var loadDBModel = LoadDBModel()
    var shipName = String()
    var shipsArray = [DataSet]()

    @IBOutlet weak var shipNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shipNameLabel.text = self.shipName
        filteredContents()
    }
    
    func filteredContents(){
        let filertedData = self.shipsArray.filter ({
            
            (data: DataSet) -> Bool in
            
            //フィルター結果として、残したい要素だけtrueを返す（検索条件）
            return data.shipName == "\(self.shipName)"
        })
        

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
