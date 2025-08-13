//
//  ContentView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = ViewModel()

    var body: some View {
        NavigationStack {
            switch vm.loadState {
            case .failed:
                LoadFailedView(error: vm.loadError, retry: vm.loadArticles)
            default:
                if vm.articles.isEmpty {
                    ProgressView("Loading...")
                        .controlSize(.extraLarge)
                } else {
                    List(vm.filteredArticles, rowContent: ArticleRowView.init)
                        .navigationTitle("Sample News")
                        .navigationDestination(for: Article.self, destination: ArticleView.init)
                        .refreshable(action: vm.loadArticles)
                        .searchable(text: $vm.filterText, prompt: "Filter articles")
                }
            }
        }
        .task(vm.loadArticles)
    }
}

#Preview {
    ContentView()
}
