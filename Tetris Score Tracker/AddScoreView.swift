//
//  AddScoreView.swift
//  Tetris Tracker
//
//  Created by Jay Miller on 10/17/21.
//

import SwiftUI


struct AddScoreView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    
    @State private var datetime = Date()
    @State private var score = ""
    @State private var lines = ""
    @State private var style = UserDefaults.standard.string(forKey: "style") ?? ""
    
    var body: some View {
            Form {
                
                Section {
                    DatePicker("Date", selection: $datetime)
                    TextField("Score", text: $score).keyboardType(.numberPad)
                    TextField("Lines", text: $lines).keyboardType(.numberPad)
                    playStlyePickerView(styleSetting: $style)
                }
                
                Section {
                    Button("Save") {
                        let newScore = Score(context: viewContext)
                        newScore.score = Int32(self.score) ?? 0
                        newScore.lines = Int16(self.lines) ?? 0
                        newScore.style = self.style
                        newScore.timestamp = datetime
                        
                        try? viewContext.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }.navigationTitle("Enter a New Score")
    }

}

struct AddScoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddScoreView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

