//
//  ArticleView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct ArticleView: View {
    var article: Article

    var body: some View {
        ScrollView {
            AsyncImage(url: article.image) { phase in
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

            VStack(alignment: .leading, spacing: 20) {
                Text(article.title)
                    .font(.title)
                Text(article.description)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Divider()

                Text(article.text)
            }
            .padding(.horizontal)
        }
        .navigationTitle(article.section)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ArticleView(article: .example)
}
