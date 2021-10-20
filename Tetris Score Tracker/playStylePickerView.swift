//
//  playStyle.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/18/21.
//

import SwiftUI

struct playStlyePickerView: View {
    @Binding var styleSetting: String
   
    let styles: [String] = [
                            "DAS",
                            "Roll",
                            "Tap",
                            ]
    
    var body: some View{
        Picker("Play Style", selection: $styleSetting, content: {
                    ForEach(styles, id:\.self) {
                    Text($0)
                    }
        })
    }
}
