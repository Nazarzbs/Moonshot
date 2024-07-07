//
//  ContentView.swift
//  Moonshot
//
//  Created by Nazar on 06.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggleMissionView = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
   
    var body: some View {
        NavigationStack {
            ScrollView {
                if toggleMissionView {
                    GridLayout(astronauts: astronauts, mission: mission)
                } else {
                    ListLayout(astronauts: astronauts, mission: mission)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation(.smooth) {
                            toggleMissionView.toggle()
                        }
                    }) {
                        Image(systemName: toggleMissionView ? "list.bullet" : "square.grid.2x2")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
