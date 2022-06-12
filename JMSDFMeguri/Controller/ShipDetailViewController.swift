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
    @IBOutlet weak var tableviewHight: NSLayoutConstraint!
    
 
    var loadDBModel = LoadDBModel()
    var shipName = String()
    var shipsArray = [DataSet]()
    var filteredShipsArray = [DataSet]()

    @IBOutlet weak var shipNameLabel: UILabel!
    
    @IBOutlet weak var careerTableView: UITableView!
    var careerArray = [String]()
    var yearAndEventArray = [[String]]()
    
    
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
        
        self.careerArray = filteredShipsArray[0].career.lines

        self.yearAndEventArray = careerArray.map {
            $0.components(separatedBy: "年")
        }
        
        
        careerTableView.dataSource = self
        careerTableView.delegate = self
        

        
        careerTableView.separatorStyle = .none
        careerTableView.backgroundColor = .white
        
        let nib = UINib(nibName: "CareerTableViewCell", bundle: nil)
        careerTableView.register(nib, forCellReuseIdentifier: "CareerTableViewCell")
        

        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableviewHight.constant = CGFloat(careerTableView.contentSize.height)
    }

    
    func filerdData(){
        self.filteredShipsArray = self.shipsArray.filter ({
            
            (data: DataSet) -> Bool in
            
            //フィルター結果として、残したい要素だけtrueを返す（検索条件）
            return data.shipName == "\(self.shipName)"
        })
    }
    
    
    @IBAction func toWiki(_ sender: Any) {
        let url = URL(string: filteredShipsArray[0].toWiki)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
    


 
}

extension ShipDetailViewController: UITableViewDataSource,UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return careerArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = careerTableView.dequeueReusableCell(withIdentifier: "CareerTableViewCell", for: indexPath) as! CareerTableViewCell
        
        var str = yearAndEventArray[indexPath.row][1]
        if let i = str.firstIndex(of: "　"){
            str.remove(at: i)
        }
        
        print(str)
        
        cell.setup(year: yearAndEventArray[indexPath.row][0]+"年", event: str)
        
        cell.contentView.backgroundColor = UIColor.white

        return cell
    }
    


    
}


