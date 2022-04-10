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
    
    var dataSets = [DataSet]()
    let db = Firestore.firestore()
    var loadOKDelegate:loadOKDelegate?
    
    func loadContents() {
        
        db.collection("Destroyers").order(by: "shipName", descending: true).addSnapshotListener {(snapShot, error) in
            
            self.dataSets = []
            
            if error != nil{
                print("データの受信に失敗しました")
                return
            }
            if let snapShotDoc = snapShot?.documents{
                print("データ受信開始")
                
                for doc in snapShotDoc{
                    
                    let data = doc.data()
                    
                    
                    if let type = data["type"] as? String,
                       let number = data["number"] as? Int,
                       let shipImage1 = data["shipImage1"] as? String,
                       let shipImage2 = data["shipImage2"] as? String,
                       let shipImage3 = data["shipImage3"] as? String,
                       let shipName = data["shipName"] as? String,
                       let comment = data["comment"] as? String,
                       let homePort = data["homePort"] as? String,
                       let birthday = data["birthday"] as? String,
                       let length = data["length"] as? String,
                       let width = data["width"] as? String,
                       let displacement = data["displacement"] as? String,
                       let capacity = data["capacity"] as? String,
                       let topSpeed = data["topSpeed"] as? String,
                       let equipments1 = data["equipments1"] as? String,
                       let equipments2 = data["equipments2"] as? String,
                       let equipments3 = data["equipments3"] as? String,
                       let equipments4 = data["equipments4"] as? String,
                       let equipments5 = data["equipments5"] as? String,
                       let equipments6 = data["equipments6"] as? String,
                       let equipments7 = data["equipments7"] as? String,
                       let equipments8 = data["equipments8"] as? String,
                       let equipments9 = data["equipments9"] as? String,
                       let equipments10 = data["equipments10"] as? String,
                       let toWiki = data["toWiki"] as? String {
                        
                        
                        let newDataSet = DataSet(type: type,
                                                 number: number,
                                                 shipImage1: shipImage1,
                                                 shipImage2: shipImage2,
                                                 shipImage3: shipImage3,
                                                 shipName: shipName,
                                                 comment: comment,
                                                 homePort: homePort,
                                                 birthday: birthday,
                                                 length: length,
                                                 width: width,
                                                 displacement: displacement,
                                                 capacity: capacity,
                                                 topSpeed: topSpeed,
                                                 equipments1: equipments1,
                                                 equipments2: equipments2,
                                                 equipments3: equipments3,
                                                 equipments4: equipments4,
                                                 equipments5: equipments5,
                                                 equipments6: equipments6,
                                                 equipments7: equipments7,
                                                 equipments8: equipments8,
                                                 equipments9: equipments9,
                                                 equipments10: equipments10,
                                                 toWiki: toWiki)
                        
                        self.dataSets.append(newDataSet)
                        self.loadOKDelegate?.loadOK(check: 1)
                        print("データを受信完了")
                    }else{
                        print("データが存在しないドキュメントあり")
                    }
                }
            }
        }
    }
}
