//
//  FavroutesViewModel.swift
//  RealmWithSwiftUI
//
//  Created by Rajendran Eshwaran on 3/10/22.
//

import Foundation
import RealmSwift
import SwiftUI
import Realm
class FavroutesViewModel : ObservableObject{
    @Published var fItem = ""
    @Published var favroutes:[Favroutes] = []
    @Published var updateobject : Favroutes?
    @Published var isOpen = false
    init()
    {
        
    }
    
    func fetchData(){
        guard let realm = try? Realm() else {return}
        let result = realm.objects(Favroutes.self)
        self.favroutes = result.compactMap({(fav) -> Favroutes? in
            return fav
        })
    }
    
    func addData(presentation:Binding<PresentationMode>){
        if fItem == "" {return}
        let item = Favroutes()
        item.favItem = fItem
        let realm = try? Realm() //else {return}
        try? realm?.write{
            guard let aObject = updateobject else{
                realm?.add(item)
                return
            }
            aObject.favItem = fItem
        }
        self.fetchData()
        presentation.wrappedValue.dismiss()
    }
    
    func deleteData(object:Favroutes){
        guard let realm = try? Realm() else {return}
        try? realm.write{
            realm.delete(object)
            self.fetchData()
        }
    }
    
    func setupInitialData(){
        guard let setupObject = updateobject else{return}
        fItem = setupObject.favItem
    }
    
    func deInitData(){
        updateobject = nil
        fItem = ""
    }
}
