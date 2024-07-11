//
//  ContentView.swift
//  Moonshot
//
//  Created by Nazar on 06.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var pathStore = PathStore()
    
    @State var toggleMissionView = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
   
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            ScrollView {
                if !toggleMissionView {
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
