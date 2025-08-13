//
//  ContentView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct ContentView: View {
    @State private var articles = [Article]()

    init(articles: [Article] = []) {
        _articles = State(initialValue: articles)
    }

    var body: some View {
        NavigationStack {
            List(articles) { article in
                NavigationLink(value: article) {
                    HStack {
                        AsyncImage(url: article.thumbnail) { phase in
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
            .navigationTitle("Sample News")
            .navigationDestination(for: Article.self, destination: ArticleView.init)
        }
        .task(loadArticles)
    }

    func loadArticles() async {
        do {
            let url = URL(string: "https://hws.dev/news")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            articles = try decoder.decode([Article].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    ContentView(articles: [.example])
}
