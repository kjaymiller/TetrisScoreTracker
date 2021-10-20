//
//  UserSettings.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/18/21.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    @Published var style: String {
        didSet {
            UserDefaults.standard.set(style, forKey: "style")
        }
    }
    
    @Published var startingLevel: String {
        didSet {
            UserDefaults.standard.set(startingLevel, forKey: "startingLevel")
        }
    }
    
    init() {
        self.style = UserDefaults.standard.object(forKey: "style") as? String ?? ""
        self.startingLevel = UserDefaults.standard.object(forKey: "startingLevel") as? String ?? "0"
    }
}
