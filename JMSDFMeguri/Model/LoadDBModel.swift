//
//  LoadDBModel.swift
//  JMSDFMeguri
//
//  Created by 高山航輔 on 2022/04/10.
//

import Foundation
import Firebase
import FirebaseStorage

protocol loadOKDelegate {
    
    func loadOK(check:Int)
}

class LoadDBModel {
    
    var dataSets = [DataSet]()
    let db = Firestore.firestore()
    var loadOKDelegate:loadOKDelegate?
    var downloadURL:URL!
    
    
    func loadContents() {
        
        db.collection("Destroyers").order(by: "number", descending: false).addSnapshotListener {(snapShot, error) in
            
            self.dataSets = []
            
            if error != nil{
                print("データの受信に失敗しました")
                self.loadOKDelegate?.loadOK(check: 2)
            }
            if let snapShotDoc = snapShot?.documents{
               
                
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
                       let depth = data["depth"] as? String,
                       let displacement = data["displacement"] as? String,
                       let capacity = data["capacity"] as? String,
                       let topSpeed = data["topSpeed"] as? String,
                       let equipment = data["equipment"] as? String,
                       let career = data["career"] as? String,
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
                                                 depth: depth,
                                                 displacement: displacement,
                                                 capacity: capacity,
                                                 topSpeed: topSpeed,
                                                 equipment: equipment,
                                                 career: career,
                                                 toWiki: toWiki)
                        
                        self.dataSets.append(newDataSet)
                        self.loadOKDelegate?.loadOK(check: 1)
                    }
                }
            }
        }
    }
    
    
    func createDownloadURL(passString: String, completion: @escaping (() -> Void)){
        
        let storage = Storage.storage()
        let storageRef = storage.reference(forURL: "\(passString)")
        
        storageRef.downloadURL { url, error in
            if error != nil {
                print("error")
            } else {
                self.downloadURL = url
 
                completion()
                
            }
        }
    }

}
