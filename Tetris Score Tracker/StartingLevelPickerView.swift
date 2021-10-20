//
//  StartingLevelPickerView.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/19/21.
//

import SwiftUI

func getStartLevels () -> [String] {
    let commonOptions: [Int8] = [0, 15, 18, 19]
    let additions: [Int8] = Array(0...19)
    let filteredAdditions: [Int8] = additions.filter{!commonOptions.contains($0)}
    let intBaseStartLevels: [Int8] = commonOptions + filteredAdditions
    return intBaseStartLevels.map{"\($0)"}
}

struct startingLevelPickerView: View {
    @State private var startingLevel = "\(UserDefaults.standard.string(forKey: "startingLevel") ?? "")"

    var body: some View{
//        Picker("Starting Level", selection: $userSettings.startingLevel, content: {
//                                                                    ForEach(getStartLevels(), id:\.self) {
//                                                                        Text($0)
//                                                                    }})
    Text("test")
    }
}
