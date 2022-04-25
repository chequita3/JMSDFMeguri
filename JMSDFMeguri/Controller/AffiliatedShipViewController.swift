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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "AffiliatedShipCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AffiliatedShipCollectionViewCell")
        
        
    }
    




}

extension AffiliatedShipViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    shipsArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AffiliatedShipCollectionViewCell", for: indexPath) as! AffiliatedShipCollectionViewCell
    
    cell.setup(image: shipsArray[indexPath.row].shipImage1, number: shipsArray[indexPath.row].number, name: shipsArray[indexPath.row].shipName)
    
    return cell
}

}
