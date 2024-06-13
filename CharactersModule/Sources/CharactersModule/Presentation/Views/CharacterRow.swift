//
//
//  RickAndMortyMVVMC
//
//  Created by Enrique P. Ortiz.
//  Linkedin: https://www.linkedin.com/in/enrique-poyato-ortiz-%EF%A3%BF-7447b3200/
//  Copyright © 2024 Enrique P. Ortiz. All rights reserved.
//


import SwiftUI
import CachedAsyncImage

public struct CharacterRow: View {
    public var character: CharacterModel
    public var body: some View {
        VStack(spacing: 0) {
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
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(character.name)
                        .font(.footnote.bold())
                        .lineLimit(1)
                    Text(character.species)
                        .font(.caption)
                        .lineLimit(1)
                }
                .foregroundStyle(.primary)
                
                Spacer()
                VStack {
                    Image(systemName: character.status == "Alive" ? "circle.fill" : character.status == "unknown" ? "xmark.circle" : "circle")
                        .foregroundStyle(character.status == "Alive" ? .green : .red)
                        .font(.footnote)
                    Text(character.status)
                        .font(.caption)
                }
                .foregroundStyle(.primary)
                
                
            }
            .padding()
            .background(.white)
        }
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 3, x: 3, y: 3)
    }
}

#Preview {
    CharacterRow(character: .mock)
}
