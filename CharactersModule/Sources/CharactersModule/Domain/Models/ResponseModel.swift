//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import Foundation

public struct ResponseModel: Codable, Hashable {
    public let info: Info
    public let results: [CharacterModel]
    
    public init(info: Info, results: [CharacterModel]) {
        self.info = info
        self.results = results
    }
}

public struct Info: Codable, Hashable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
    
    public init(count: Int, pages: Int, next: String?, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

