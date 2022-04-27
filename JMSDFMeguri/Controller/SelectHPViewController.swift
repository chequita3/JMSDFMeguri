//
//  SelectHPViewController.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/06.
//

import UIKit

class SelectHPViewController: UIViewController,loadOKDelegate {
    
    

    
    var loadDBModel = LoadDBModel()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDBModel.loadOKDelegate = self
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        //無効にする
        view.window?.beginIgnoringInteractionEvents()
        
        
        
        loadDBModel.loadContents()
        
    }
    
    func loadOK(check: Int) {
        if check == 1 {
            //有効にする
            view.window?.endIgnoringInteractionEvents()
            
        }
    }
    
    @IBAction func ominato(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "大湊"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func yokosuka(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "横須賀"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func maizuru(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "舞鶴"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func kure(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "呉"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func sasebo(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "佐世保"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func yoichi(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "余市"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func hakodate(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "大湊"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func kobe(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "神戸"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func saeki(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "佐伯"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func shimonoseki(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "下関"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
    @IBAction func katsuren(_ sender: Any) {
        let AffiliatedShipVC = self.storyboard?.instantiateViewController(identifier: "AffiliatedShipVC") as! AffiliatedShipViewController
        
        AffiliatedShipVC.shipsArray = self.loadDBModel.dataSets
        AffiliatedShipVC.homePortName = "勝連"
        navigationController?.pushViewController(AffiliatedShipVC, animated: true)
    }
    
}


extension UIWindow {
    func beginIgnoringInteractionEvents() {
        let overlayView = UIView(frame: bounds)
        overlayView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlayView.tag = 10000
        addSubview(overlayView)
    }

    func endIgnoringInteractionEvents() {
        viewWithTag(10000)?.removeFromSuperview()
    }
}


        

