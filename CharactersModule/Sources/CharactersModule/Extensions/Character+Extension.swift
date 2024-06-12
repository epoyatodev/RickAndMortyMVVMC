//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import Foundation

public extension CharacterModel {
    static let mock: CharacterModel = .init(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", type: "", gender: "Male" , origin: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"), location: .init(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2"])
}
