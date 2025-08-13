//
//  ArticleImageView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct ArticleImageView: View {
    var imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
    }
}

#Preview {
    ArticleImageView(imageURL: Article.example.image.absoluteURL)
}
