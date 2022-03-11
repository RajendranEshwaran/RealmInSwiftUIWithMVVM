//
//  RealmWithSwiftUIApp.swift
//  RealmWithSwiftUI
//
//  Created by Rajendran Eshwaran on 3/10/22.
//

import SwiftUI
import RealmSwift

@main
struct RealmWithSwiftUIApp:SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            MainView().environment(\.realmConfiguration,Realm.Configuration())
        }
    }
}
