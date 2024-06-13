//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import SwiftUI

public extension [GridItem] {
    static func getGridItemsCharacterRow(geometry: GeometryProxy) -> [GridItem] {
        [.init(.adaptive(minimum: geometry.size.width, maximum: geometry.size.width)), .init(.adaptive(minimum: geometry.size.width, maximum: geometry.size.width))]
    }
}

