//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import SwiftUI
import CharactersModule
import Router
//.,
@main
struct RickAndMortyMVVMCApp: App {
    @State private var router: Router = .init()
    var body: some Scene {
        WindowGroup {
            CharactersTabCoordinator()
                .environment(router)
        }
    }
}
