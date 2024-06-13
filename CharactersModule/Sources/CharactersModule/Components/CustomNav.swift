//
//
//  SwiftUIView.swift
//  
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2023 Oscar R. Garrucho. All rights reserved.
//


import SwiftUI
import Router

public struct CustomNav: ViewModifier {
    @Environment(Router.self) private var router
    
    public init() {}
    public func body(content: Content) -> some View {
        content
            .overlay(alignment: .topLeading) {
                HStack {
                    Button {
                        router.navigateBack()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding(10)
                    .background(.white)
                    .clipShape(.circle)
                }
                .padding(.horizontal)
            }
            
    }
}
