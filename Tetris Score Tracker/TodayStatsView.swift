//
//  TodayStatsView.swift
//  Tetris Tracker
//
//  Created by Jay Miller on 10/17/21.
//

import SwiftUI


struct TodayStatsView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var selectedDate = Date()
    
    var body: some View {
        VStack(alignment: .leading){
            DatePicker("Select a Date:", selection: $selectedDate, displayedComponents: .date)
                .frame(width: 250)
                .padding()
            DateStatsView(filter: selectedDate)
        }
        .navigationBarTitle("Stats for \(Text(selectedDate, formatter: shortDateFormatter ))", displayMode: .inline)
        .navigationBarItems(trailing:
                NavigationLink(destination: AddScoreView(), label: {Image( systemName: "plus")}))
    }
}

private let shortDateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    return formatter
}()

struct TodayStatsView_Previews: PreviewProvider {
    static var previews: some View {
        TodayStatsView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

