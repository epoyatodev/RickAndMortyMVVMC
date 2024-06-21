//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import Foundation

public enum ApiEndpoints {
    public static func fetchCharacters(page: Int, filter: String) -> APIEndpoint {
        return .init(baseURL: URL(string: "https://rickandmortyapi.com") ,path: "/api/character", httpMethod: .get, urlQueries: ["page": page.description, "name": filter.description])
    }
}
