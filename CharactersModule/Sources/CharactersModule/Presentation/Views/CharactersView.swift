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

public struct CharactersView: View {
    @Environment(Router.self) private var router
    @State public var charactersViewModel = CharactersViewModel()
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: .getGridItemsCharacterRow(geometry: geometry), content: {
                    if let characters = charactersViewModel.characters {
                        ForEach(characters) { character in
                            CharacterRow(character: character)
                                .onTapGesture {
                                    router.navigate(to: CharacterDestination.characterDetail(character: character))
                                }
                        }
                    }
                })
                .padding()
            }
        }
        .task {
            charactersViewModel.fetchCharacters()
        }
    }
}

#Preview {
    CharactersView()
        .environment(Router())
}

public extension [GridItem] {
    static func getGridItemsCharacterRow(geometry: GeometryProxy) -> [GridItem] {
        [.init(.adaptive(minimum: geometry.size.width, maximum: geometry.size.width)), .init(.adaptive(minimum: geometry.size.width, maximum: geometry.size.width))]
    }
}


