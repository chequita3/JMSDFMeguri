//
//  ResultsViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/14.
//

import UIKit
 
class ResultsViewController: UITableViewController {

    

    
    var dataList: [Ships] = [] {
        didSet {
            if isViewLoaded {
                tableView.reloadData()
            }
        }
    }
 
 
    var loadDBModel = LoadDBModel()
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
    }
 
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.setup(number: dataList[indexPath.row].number, name: dataList[indexPath.row].name)
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let shipDetailVC = storyboard.instantiateViewController(identifier: "shipDetailVC") as! ShipDetailViewController
        shipDetailVC.shipName = self.dataList[indexPath.row].name
        shipDetailVC.shipsArray = loadDBModel.dataSets
        
        self.present(shipDetailVC, animated: true, completion: nil)
    }

 
 

}
