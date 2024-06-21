//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//

import Foundation
import NetworkModule
import Combine

public protocol CharactersProtocol {
    func fetchCharacters(page: Int, filter: String) -> AnyPublisher<ResponseModel, Error>
}

public final class CharactersDataSource: CharactersProtocol {
    private let apiClientService: IAPIClientService
    private let networker: NetworkerProtocol
    
    public init(apiClientService: IAPIClientService = APIClientService(), networker: NetworkerProtocol = Networker()) {
        self.apiClientService = apiClientService
        self.networker = networker
    }
    
    public func fetchCharacters(page: Int, filter: String) -> AnyPublisher<ResponseModel, Error> {
        return networker.callServer(type: ResponseModel.self, request: apiClientService.buildURLRequest(from: ApiEndpoints.fetchCharacters(page: page, filter: filter))!)
    }
}
