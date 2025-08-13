//
//  ContentViewModel.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import Foundation

extension ContentView {
    enum LoadState {
        case loading, loaded, failed
    }

    @Observable @MainActor
    final class ViewModel {
        private(set) var articles = [Article]()

        private(set) var loadState = LoadState.loading
        private(set) var loadError: (any Error)?

        private var urlSession: any DataFetching

        init(session: DataFetching = URLSession.shared) {
            self.urlSession = session
        }

        var filterText = ""
        var filteredArticles: [Article] {
            if filterText.isEmpty {
                articles
            } else {
                articles.filter {
                    /// Using localizedStandardContains() here means we ignore case and diacritics
                    $0.title.localizedStandardContains(filterText)
                }
            }
        }

        func loadArticles() async {
            loadState = .loading

            do {
                let url = URL(string: "https://hws.dev/news")!
                let (data, _) = try await urlSession.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601

                articles = try decoder.decode([Article].self, from: data)
                loadState = .loaded
            } catch {
                print(error.localizedDescription)
                loadState = .failed
                loadError = error
            }
        }
    }
}
