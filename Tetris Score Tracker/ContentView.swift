//
//  ContentView.swift
//  Tetris Score Tracker
//
//  Created by Jay Miller on 10/18/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \Score.score, ascending: false)],
            animation: .default)
    
    private var scores: FetchedResults<Score>
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Tetris Tracker").font(.largeTitle)

                NavigationLink(
                    destination: AddScoreView(),
                        label: {
                        Text("Add Score")
                            .padding()
                            .frame(minWidth: 52, idealWidth: 150, maxWidth: 250, minHeight:45, idealHeight: 125, maxHeight: 150)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .cornerRadius(10)
                    }
                )
                NavigationLink(
                    destination: TodayStatsView(),
                    label: {
                        Text("See Stats")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .padding(40)
                    }
                )
                Text("Total Games Logged: \(scores.count)")
                Text("High Score: \(scores[0].score)")
            }.navigationBarItems(trailing: NavigationLink(destination: SettingsView(),
                                                          label: { Image(systemName: "gear") }))
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            }
        }
