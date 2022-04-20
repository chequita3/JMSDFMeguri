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
 
 

//    var tableView:UITableView!
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
 
 
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = """
\(dataList[indexPath.row].number)       \(dataList[indexPath.row].name)
"""
        
        
        return cell
    }

 
 

}
