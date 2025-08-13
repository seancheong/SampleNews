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
            List(vm.articles, rowContent: ArticleRowView.init)
                .navigationTitle("Sample News")
                .navigationDestination(for: Article.self, destination: ArticleView.init)
        }
        .task(vm.loadArticles)
    }
}

#Preview {
    ContentView()
}
