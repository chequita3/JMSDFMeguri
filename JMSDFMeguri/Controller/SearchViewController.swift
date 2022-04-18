//
//  SeachViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit

struct Ships {
    var name: String
    var number: Int
    
}


class SearchViewController: UITableViewController,loadOKDelegate,UISearchResultsUpdating {

//    @IBOutlet weak var tableView: UITableView!
    
    var loadDBModel = LoadDBModel()
    var allShipArray = [Ships]()
    var searchController: UISearchController!
    var resultsController: ResultsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        let resultsController = ResultsViewController()
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchResultsUpdater = self
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDBModel.loadContents()

    }
    
    func loadOK(check: Int) {
        if check == 1 {

            let DBArray = loadDBModel.dataSets
            self.allShipArray = []
            let resultController = ResultsViewController()
            
            for hoge in DBArray {
                allShipArray.append(Ships(name: hoge.shipName, number: hoge.number))
            }

            self.tableView.reloadData()
            resultController.dataList = self.allShipArray
            print("\(allShipArray)")
        }
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
            if let keyword = searchController.searchBar.text, !keyword.isEmpty {
                resultsController.dataList = allShipArray.filter { data in
                    return data.name.contains(keyword) }
            } else {
                resultsController.dataList = []
            }
        }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return allShipArray.count
        }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                cell.textLabel?.text = allShipArray[indexPath.row].name
            return cell
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


//extension SearchViewController: UITableViewDelegate,UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//            return allShipArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//            cell.textLabel?.text = allShipArray[indexPath.row].name
//        return cell
//    }
//}

