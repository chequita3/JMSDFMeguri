//
//  SeachViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit
import RxSwift
import RxCocoa

struct Ship {
    let name: String
}

class SearchViewController: UIViewController,loadOKDelegate {
    
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var loadDBModel = LoadDBModel()
    var shipNameArray: [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDBModel.loadOKDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDBModel.loadContents()

    }
    
    func loadOK(check: Int) {
        if check == 1 {
            
            
            self.shipNameArray = []
            let DBArray = loadDBModel.dataSets
            for allShips in DBArray {
                let hoge: [String] = [allShips.shipName]
                
                
                for value in hoge {
                    
                    self.shipNameArray.append("\(value)")
                    
                    tableView.reloadData()
                    print("\(shipNameArray)")
                }
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


extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shipNameArray.count
        //loadDBModel.dataSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = shipNameArray[indexPath.row]
//        loadDBModel.dataSets[indexPath.row].shipName
        
        return cell
    }
}

