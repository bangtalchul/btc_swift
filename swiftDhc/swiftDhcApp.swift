//
//  swiftDhcApp.swift
//  swiftDhc
//
//  Created by 손수현 on 2022/08/18.
//

import SwiftUI

@main
struct swiftDhcApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
//            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
