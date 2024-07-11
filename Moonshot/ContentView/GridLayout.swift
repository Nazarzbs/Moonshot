//
//  GridLayout.swift
//  Moonshot
//
//  Created by Nazar on 07.07.2024.
//

import SwiftUI

struct GridLayout: View {
    
    let astronauts: [String: Astronaut]
    let mission: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        
        LazyVGrid(columns: columns) {
            ForEach(mission) { mission in
                NavigationLink(value: mission) {
                    LazyVStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.lightBackground)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.lightBackground)
                    }
                }
            }
        }
        .padding([.horizontal, .bottom])
        .navigationDestination(for: Mission.self) { mission in
            MissionView(mission: mission, astronauts: astronauts)
        }
    }
    
    init(astronauts: [String: Astronaut], mission: [Mission]) {
        self.astronauts = astronauts
        self.mission = mission
    }
}

