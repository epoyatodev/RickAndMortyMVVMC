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
    public var characters: [CharacterModel]?
    private var subscriptor = Set<AnyCancellable>()
    private let charactersRepository: CharacterRepository
    
    public init(charactersRepository: CharacterRepository = .init()) {
        self.charactersRepository = charactersRepository
    }
    
    @MainActor
    public func fetchCharacters() {
        charactersRepository.fetchCharacters()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                default:
                    break
                }
            } receiveValue: { response in
                self.characters = response.results
            }
            .store(in: &subscriptor)

    }
}
