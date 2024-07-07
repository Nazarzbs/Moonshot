//
//  ListLayout.swift
//  Moonshot
//
//  Created by Nazar on 07.07.2024.
//

import SwiftUI

struct ListLayout: View {
    let astronauts: [String: Astronaut]
    let mission: [Mission]
    
    
    var body: some View {
        
        ForEach(mission) { mission in
            NavigationLink {
                MissionView(mission: mission, astronauts: astronauts)
                
            } label: {
                LazyVStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                    VStack {
                        Text(mission.displayName)
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Text(mission.formattedLaunchDate)
                            .font(.title2)
                            .foregroundStyle(.gray)
                    }
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(.lightBackground)
                }
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.lightBackground)
                }
            }
    }
    .padding([.horizontal, .bottom])
    }
    
    init(astronauts: [String: Astronaut], mission: [Mission]) {
        self.astronauts = astronauts
        self.mission = mission
    }
}

