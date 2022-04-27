//
//  AffiliatedShipViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/25.
//

import UIKit

class AffiliatedShipViewController: UIViewController {

    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var homePortName = String()
    var shipsArray = [DataSet]()
    var filteredShipsArray = [DataSet]()
    var loadDBModel = LoadDBModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        let nib = UINib(nibName: "AffiliatedShipCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AffiliatedShipCollectionViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        filteredShipsArray = shipsArray.filter{ data in
            return data.homePort.contains(homePortName) }
        print("\(filteredShipsArray)")

    }




}

extension AffiliatedShipViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    filteredShipsArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AffiliatedShipCollectionViewCell", for: indexPath) as! AffiliatedShipCollectionViewCell
    
    loadDBModel.createDownloadURL(passString: filteredShipsArray[indexPath.row].shipImage1)
    print("\(loadDBModel.downloadURLString)")
    
    cell.setup(image: loadDBModel.downloadURLString, number: filteredShipsArray[indexPath.row].number, name: filteredShipsArray[indexPath.row].shipName)
    
    return cell
}

}
