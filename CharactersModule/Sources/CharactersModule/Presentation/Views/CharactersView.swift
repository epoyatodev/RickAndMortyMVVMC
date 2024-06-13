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
                    ForEach(charactersViewModel.characters) { character in
                        CharacterRow(character: character)
                            .onTapGesture {
                                router.navigate(to: CharacterDestination.characterDetail(character: character))
                            }
                    }
                })
                .padding()
                
                if charactersViewModel.offset == charactersViewModel.page{
                    ProgressView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                charactersViewModel.fetchCharacters()
                            }
                        }
                } else {
                    GeometryReader { reader -> Color in
                        let minY = reader.frame(in: .global).minY
                        let height = UIScreen.main.bounds.height / 1.3
                        
                        if minY < height {
                            
                            if !charactersViewModel.characters.isEmpty  {
                                DispatchQueue.main.async {
                                    self.charactersViewModel.page = charactersViewModel.offset
                                }
                            }

                        }
                        return Color.clear
                    }
                    .frame(width: 30, height: 30)
                }
            }
        }
        .navigationTitle("Characters")
        .task {
            charactersViewModel.fetchCharacters()
        }
    }
}

#Preview {
    NavigationStack {
        CharactersView()
            .environment(Router())
    }
}


