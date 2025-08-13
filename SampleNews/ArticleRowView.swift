//
//  ArticleRowView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct ArticleRowView: View {
    var article: Article

    var body: some View {
        NavigationLink(value: article) {
            HStack {
                ArticleImageView(imageURL: article.thumbnail)
                    .frame(width: 80, height: 80)
                    .clipShape(.rect(cornerRadius: 10))

                VStack(alignment: .leading) {
                    Text(article.section)
                        .font(.caption.weight(.heavy))
                    Text(article.title)
                }
            }
        }
    }
}

#Preview {
    ArticleRowView(article: .example)
}
