//
//  AddFavroutesView.swift
//  RealmWithSwiftUI
//
//  Created by Rajendran Eshwaran on 3/10/22.
//

import Foundation
import SwiftUI
import Realm
import RealmSwift

struct AddFavroutesView: View {
    @EnvironmentObject var favVM : FavroutesViewModel
    @Environment(\.presentationMode)var presentation
    var body: some View {
        VStack{
            NavigationView{
                List
                {
                    Section(header: Text("Favroute Items")){
                        TextField("", text: $favVM.fItem)
                    }
                }.listStyle(.grouped)
                    //.navigationTitle("Realm-SwiftUI")
                    .navigationBarItems(leading:Button(action: {
                        favVM.addData(presentation: presentation)
                    }, label: {
                        Text("SaveItem")
                            .foregroundColor(.white)
                            .padding()
                            .background(.green)
                            .cornerRadius(5.0)
                        
                    }) , trailing:Button(action: {
                        presentation.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .aspectRatio(1.0, contentMode: .fit)
                            .frame(width: 40, height: 40, alignment: .center)
                    })
                    )
                }
        }.onAppear(perform: favVM.setupInitialData)
        .onDisappear(perform: favVM.deInitData)
    }
}

struct AddFavroutesView_Previews: PreviewProvider {
    static var previews: some View {
        AddFavroutesView()
    }
}


