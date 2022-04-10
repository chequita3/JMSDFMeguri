//
//  SeachViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, loadOKDelegate {

    

    var loadDBModel = LoadDBModel()
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
                tableView.dataSource = self
                loadDBModel.loadOKDelegate = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadDBModel.loadContents()
    }
    
    func loadOK(check: Int) {
        if check == 1 {
            tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadDBModel.dataSets.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = loadDBModel.dataSets[indexPath.row].shipName
        
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
