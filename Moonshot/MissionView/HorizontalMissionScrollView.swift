//
//  HorizontalMissionScrollView.swift
//  Moonshot
//
//  Created by Nazar on 07.07.2024.
//
import SwiftUI

struct HorizontalMissionScrollView: View {
    let crew: [MissionView.CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember.astronaut) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(Color.white, lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                            
                                Text(crewMember.role)
                                    .foregroundColor(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .navigationDestination(for: Astronaut.self) { astronaut in
            AstronautView(astronaut: astronaut)
        }
    }
    
    init(crew: [MissionView.CrewMember]) {
        self.crew = crew
    }
}
