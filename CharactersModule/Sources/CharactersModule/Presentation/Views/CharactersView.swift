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
    @Environment(\.isSearching) private var isSearching
    @Binding public var charactersViewModel: CharactersViewModel
    
    public var body: some View {
        
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(columns: .getGridItemsCharacterRow(geometry: geometry), content: {
                        ForEach(0..<charactersViewModel.characters.count, id: \.self) { i in
                            CharacterRow(character: charactersViewModel.characters[i])
                                .onTapGesture {
                                    router.navigate(to: CharacterDestination.characterDetail(character: charactersViewModel.characters[i]))
                                }
                        }
                    })
                    .padding()
                    
                    LoadMore()
                }
            }
            .navigationTitle("Characters")
            .onChange(of: isSearching, { _, newValue in
                if !newValue {
                    charactersViewModel.resetOffset()
                }
            })
            .onChange(of: charactersViewModel.searchText) { _, searchTxt in
                charactersViewModel.resetOffset()
                charactersViewModel.fetchCharacters(filter: searchTxt, loadMore: false)
            }
                                      

        
        
        
    }
    
    @ViewBuilder
    private func LoadMore() -> some View {
        if charactersViewModel.offset == charactersViewModel.page {
            ProgressView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        charactersViewModel.fetchCharacters(filter: charactersViewModel.searchText, loadMore: true)
                        
                    }
                }
        } else {
            GeometryReader { reader -> Color in
                let minY = reader.frame(in: .global).minY
                let height = UIScreen.main.bounds.height / 1.3
                
                if minY < height {
                    
                    if !charactersViewModel.characters.isEmpty{
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

#Preview {
    NavigationStack {
        CharactersView(charactersViewModel: .constant(.init()))
            .environment(Router())
    }
}
