//
//  Tetris_Score_TrackerApp.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/18/21.
//

import SwiftUI

@main
struct Tetris_Score_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
