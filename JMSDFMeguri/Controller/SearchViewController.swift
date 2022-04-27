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


class SearchViewController: UIViewController,loadOKDelegate,UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var loadDBModel = LoadDBModel()
    var allShipArray = [Ships]()
    var searchController: UISearchController!
    var resultsController: ResultsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        resultsController = ResultsViewController()
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
//        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        loadDBModel.loadOKDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadDBModel.loadContents()
        
    }
    
    func loadOK(check: Int) {
        if check == 1 {
            
            resultsController.loadDBModel.dataSets = self.loadDBModel.dataSets
            
            let DBArray = loadDBModel.dataSets
            self.allShipArray = []
            
            
            for hoge in DBArray {
                allShipArray.append(Ships(name: hoge.shipName, number: hoge.number))
            }
            
            self.tableView.reloadData()
            
            
        }
    }
    
    

    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // searchResultsController を強制的に表示する
        // (検索バーの日本語変換待ち状態の入力のみだと、searchResultsController 自体が表示されないため）
        searchController.searchResultsController?.view.isHidden = false

        // 変換中のテキストも正しく取得できるようにするために遅延させる
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [weak self] in
            guard let self = self else { return }
            if let keyword = searchBar.text, !keyword.isEmpty {
                            if let keynumber = Int(keyword) {
                                self.resultsController.dataList = self.allShipArray.filter { data in
                                    return data.number == keynumber }
                            } else {
                                self.resultsController.dataList = self.allShipArray.filter { data in
                                    return data.name.contains(keyword) }
                            }
                        } else {
                self.resultsController.dataList = []
            }
        }

        return true
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
        return allShipArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = """
\(allShipArray[indexPath.row].number)       \(allShipArray[indexPath.row].name)
"""
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let shipDetailVC = storyboard.instantiateViewController(identifier: "shipDetailVC") as! ShipDetailViewController
        shipDetailVC.shipName = self.allShipArray[indexPath.row].name
        shipDetailVC.shipsArray = loadDBModel.dataSets
        
        self.present(shipDetailVC, animated: true, completion: nil)
    }
}

