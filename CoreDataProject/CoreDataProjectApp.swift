//
//  CoreDataProjectApp.swift
//  CoreDataProject
//
//  Created by Baptiste Cadoux on 16/11/2021.
//

import SwiftUI

@main
struct CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
