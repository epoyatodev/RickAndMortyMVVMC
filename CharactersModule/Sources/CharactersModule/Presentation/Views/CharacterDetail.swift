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
import CachedAsyncImage

struct CharacterDetail: View {
    var character: CharacterModel
    var body: some View {
        ZStack {
            VStack {
                CachedAsyncImage(url: .init(string: character.image)) { Image in
                    Image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                }
                .overlay(alignment: .bottom) {
                    Text(character.name)
                        .font(.system(size: 50))
                        .bold()
                        .shadow(radius: 1, x: 5, y: 5)
                        .foregroundStyle(.white)
                }
                
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    CharacterDetail(character: .mock)
}
