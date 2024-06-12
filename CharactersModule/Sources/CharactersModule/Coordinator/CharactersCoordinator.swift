//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//

import SwiftUI
import Router


public enum CharacterDestination: Hashable {
    case characterDetail(character: CharacterModel)
}

public struct CharactersTabCoordinator: View {
    @Environment(Router.self) var router
    
    public init() {}
    public var body: some View {
        @Bindable var router = router
        NavigationStack(path: $router.navPath) {
            CharactersView()
                .navigationDestination(for: CharacterDestination.self) { destination in
                    switch destination {
                    case let .characterDetail(character):
                        Text(character.name)
                    }
                }
        }
        .environment(self.router)
    }
}

#Preview {
    CharactersTabCoordinator()
        .environment(Router())
}
