//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import Foundation
import Combine

@Observable
public final class CharactersViewModel {
    public var characters: [CharacterModel] = []
    
    public var page: Int = 0
    public var offset: Int = 1
    public var searchText: String = ""
    
    private var subscriptor = Set<AnyCancellable>()
    private let charactersRepository: CharacterRepository
    
    public init(charactersRepository: CharacterRepository = .init()) {
        self.charactersRepository = charactersRepository
        Task {
            await self.fetchCharacters(filter: "" , loadMore: false)
        }
    }
    
    @MainActor
    public func fetchCharacters(filter: String, loadMore: Bool) {
        charactersRepository.fetchCharacters(page: offset, filter: filter)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    self.offset += 1
                    
                }
            } receiveValue: { response in
                if !loadMore {
                    self.characters = response.results
                } else {
                    self.characters.append(contentsOf: response.results)
                }
                
            }
            .store(in: &subscriptor)
    }
    
    public func resetOffset() {
        self.offset = 1
        self.page = 0
    }
    
}
