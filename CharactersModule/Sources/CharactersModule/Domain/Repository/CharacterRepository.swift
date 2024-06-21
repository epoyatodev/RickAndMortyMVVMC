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

public final class CharacterRepository: CharactersProtocol {
    private let characterDataSource: CharactersDataSource
    
    public init(characterDataSource: CharactersDataSource = .init()) {
        self.characterDataSource = characterDataSource
    }
    
    public func fetchCharacters(page: Int, filter: String) -> AnyPublisher<ResponseModel, Error> {
        self.characterDataSource.fetchCharacters(page: page, filter: filter)
    }
}
