//
//  AffiliatedShipViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/25.
//

import UIKit

class AffiliatedShipViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var CollectionViewFlowLayout: UICollectionViewFlowLayout! {
        didSet {
            CollectionViewFlowLayout.estimatedItemSize = .zero
        }
    }
    
    
    var homePortName = String()
    var shipsArray = [DataSet]()
    var filteredShipsArray = [DataSet]()
//    var loadDBModel = LoadDBModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        let nib = UINib(nibName: "AffiliatedShipCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AffiliatedShipCollectionViewCell")
        let layout = CollectionViewFlowLayout!
                layout.minimumInteritemSpacing = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        filteredShipsArray = shipsArray.filter{ data in
            return data.homePort.contains(homePortName) }


    }

    




}

extension AffiliatedShipViewController:UICollectionViewDataSource {
    
func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filteredShipsArray.count
}

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AffiliatedShipCollectionViewCell", for: indexPath) as! AffiliatedShipCollectionViewCell
    

    cell.setup(image:filteredShipsArray[indexPath.row].shipImage1 , number: filteredShipsArray[indexPath.row].number, name: filteredShipsArray[indexPath.row].shipName)
 
    return cell
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let shipDetailVC = storyboard.instantiateViewController(identifier: "shipDetailVC") as! ShipDetailViewController
        
        shipDetailVC.shipName = self.filteredShipsArray[indexPath.row].shipName
        shipDetailVC.shipsArray = self.shipsArray
        
        self.present(shipDetailVC, animated: true, completion: nil)
    }

}


extension AffiliatedShipViewController: UICollectionViewDelegateFlowLayout {
    // [1]
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let prototypeCell = UINib(nibName: "AffiliatedShipCollectionViewCell", bundle: nil).instantiate(withOwner: nil, options: nil).first as! AffiliatedShipCollectionViewCell
        return prototypeCell.systemLayoutSizeFitting(
            CGSize(width: cellWidth, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow)
    }

    private var cellWidth: CGFloat {
        let availableWidth = collectionView.bounds.inset(by: collectionView.adjustedContentInset).width
        let interColumnSpace = CGFloat(8)
        let numColumns = CGFloat(3)
        let numInterColumnSpaces = numColumns - 1

        return ((availableWidth - interColumnSpace * numInterColumnSpaces) / numColumns).rounded(.down)
    }
}






