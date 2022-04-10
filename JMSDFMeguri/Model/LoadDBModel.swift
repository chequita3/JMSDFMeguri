//
//  LoadDBModel.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/10.
//

import Foundation
import Firebase

protocol loadOKDelegate {
    
    func loadOK(check:Int)
}

class LoadDBModel {
    
    var DataSets = [DataSet]()
    let db = Firestore.firestore()
    var loadOKDelegate:loadOKDelegate?
    
}
