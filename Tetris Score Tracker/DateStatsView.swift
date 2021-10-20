//
//  DateStatsView.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/19/21.
//

import CoreData
import SwiftUI

struct DateStatsView: View {
    var fetchRequest: FetchRequest<Score>
    var scores: FetchedResults<Score> {fetchRequest.wrappedValue}
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Best Game:")
            Text("Score: \(scores[0].score)")
            Text("Lines: \(scores[0].lines)")
        }.padding()
        
        List(scores, id:\.self) { score in
               VStack (alignment: .leading) {
                   Text(score.timestamp!, formatter: itemFormatter)
                   Text("Score: \(String(score.score))")
                   Text("Lines: \(String(score.lines))")
                   }
               }
        }
    
    init(filter: Date) {
        fetchRequest = FetchRequest<Score>(
            entity:Score.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Score.score, ascending: false)],
            predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: filter) as CVarArg, Calendar.current.startOfDay(for: filter + 86400) as CVarArg)
        )
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
