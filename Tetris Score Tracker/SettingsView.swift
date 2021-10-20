//
//  SettingsView.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/18/21.
//

import SwiftUI


struct SettingsView: View {
    @ObservedObject var userSettings = UserSettings()
   
    var body: some View {
        
            Form {
                Section(header: Text("Game Settings")){
                    Picker("Starting Level", selection: $userSettings.startingLevel, content: {
                                                                ForEach(getStartLevels(), id:\.self) {
                                                                    Text($0)
                                                                }})
                }
                Section(header: Text("Player Settings")) {
                    playStlyePickerView(styleSetting: $userSettings.style)
                }
            }.navigationBarTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
