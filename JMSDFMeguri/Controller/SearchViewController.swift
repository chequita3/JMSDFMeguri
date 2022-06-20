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
    
    let alertController: UIAlertController = UIAlertController(title: "通信エラー", message: "電波状況の良いところで再度お試しください", preferredStyle: .alert)
    let defaultAction: UIAlertAction = UIAlertAction(title: "Default", style: .default, handler: { (action:UIAlertAction) -> Void in
        print("アラート表示")
    })
    
    var loadDBModel = LoadDBModel()
    var allShipArray = [Ships]()
    var searchController: UISearchController!
    var resultsController: ResultsViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        definesPresentationContext = true
        resultsController = ResultsViewController()
        resultsController.searchViewController = self
        
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.hidesNavigationBarDuringPresentation = true
        searchController.searchBar.delegate = self
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        loadDBModel.loadOKDelegate = self
        tableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        alertController.addAction(defaultAction)
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
            
            
        } else if check == 2 {
            present(alertController, animated: true, completion: nil)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.setup(number: allShipArray[indexPath.row].number, name: allShipArray[indexPath.row].name)
        cell.contentView.backgroundColor = UIColor.white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let shipDetailVC = self.storyboard?.instantiateViewController(identifier: "shipDetailVC") as! ShipDetailViewController
        
        shipDetailVC.shipName = self.allShipArray[indexPath.row].name
        shipDetailVC.shipsArray = loadDBModel.dataSets
        
        navigationController?.pushViewController(shipDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}


