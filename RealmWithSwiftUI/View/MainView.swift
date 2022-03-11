//
//  MainView.swift
//  RealmWithSwiftUI
//
//  Created by Rajendran Eshwaran on 3/10/22.
//

import SwiftUI
import RealmSwift
import Realm

struct MainView: View {
    @StateObject var favVM = FavroutesViewModel()
    @State private var isAddFavItem = false
    var body: some View {
        VStack{
            NavigationView{
                List(favVM.favroutes){ items in
                    Text(items.favItem)
                }
                .navigationTitle("Realm-SwiftUI-MVVM")
                .navigationBarItems(trailing:
                    Button(action: {
                    isAddFavItem.toggle()
                }, label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                    }))
                .sheet(isPresented: $isAddFavItem, content: {
                    AddFavroutesView().environmentObject(favVM)
                })
            }
        }.onAppear(perform: favVM.setupInitialData)
        .onDisappear(perform: favVM.deInitData)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

