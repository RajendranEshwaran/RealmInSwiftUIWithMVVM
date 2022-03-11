//
//  Favroutes.swift
//  RealmWithSwiftUI
//
//  Created by Rajendran Eshwaran on 3/10/22.
//

import Foundation
import RealmSwift

//class Favroutes : Object,Identifiable{
//    @Persisted (primaryKey: true) var id : ObjectId
//    @Persisted var favItem:String = ""
//}
class Favroutes : Object,Identifiable{
    @objc dynamic var id : Date = Date()
    @objc dynamic var favItem = ""
}
