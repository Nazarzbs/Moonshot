//
//  AstronautView.swift
//  Moonshot
//
//  Created by Nazar on 07.07.2024.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronaut["aldrin"]!)
        .preferredColorScheme(.dark)
}
