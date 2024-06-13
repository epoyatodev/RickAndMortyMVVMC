//
//  TabBarView.swift
//  RickAndMortyMVVMC
//
//  Created by Pablo Marín Gallardo on 13/6/24.
//

import SwiftUI
import CharactersModule
import Router


struct TabBarView: View {
    @Environment(Router.self) private var router
    @State var selection: Int = 0
    var body: some View {
        TabView(selection: $selection) {
            CharactersTabCoordinator()
                .tabItem { Label("Characters", systemImage: "person") }
                .tag(0)
            
            Text("Locations")
                .tabItem { Label("Locations", systemImage: "globe") }
                .tag(1)
            
            Text("Episodes")
                .tabItem { Label("Episodes", systemImage: "tv") }
                .tag(2)
        }
    }
}

#Preview {
    TabBarView()
        .environment(Router())
}
