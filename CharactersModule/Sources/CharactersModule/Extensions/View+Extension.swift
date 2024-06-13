//
//
//  File.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2023 Oscar R. Garrucho. All rights reserved.
//


import SwiftUI

public extension View {
    func customNav() -> some View {
        self.modifier(CustomNav())
    }
}
