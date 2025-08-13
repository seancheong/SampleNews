//
//  SampleNewsTests.swift
//  SampleNewsTests
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import Foundation
@testable import SampleNews
import Testing

@MainActor
struct SampleNewsTests {
    @Test func viewModelStartsEmpty() {
        let vm = ContentView.ViewModel()

        #expect(vm.articles.isEmpty, "There should be no articles initially")
        #expect(vm.loadState == .loading, "The view model should start in the loading state")
    }

    @Test func viewModelLoadsArticles() async throws {
        let vm = try ContentView.ViewModel(session: createMockURLSession())
        await vm.loadArticles()

        #expect(!vm.articles.isEmpty, "There should be articles after loading")
        #expect(vm.loadState == .loaded, "The view model should transition to the loaded state")
    }

    @Test func viewModelFilteringFull() async throws {
        let vm = try ContentView.ViewModel(session: createMockURLSession())
        await vm.loadArticles()

        #expect(vm.filteredArticles == vm.articles, "Without a filter, all articles should be shown")
    }

    @Test func viewModelFilteringExact() async throws {
        let vm = try ContentView.ViewModel(session: createMockURLSession())
        await vm.loadArticles()
        vm.filterText = vm.articles.first?.title ?? ""

        #expect(vm.filteredArticles.count == 1, "There should be exactly one matching article")
    }

    @Test func viewModelFilteringEmpty() async throws {
        let vm = try ContentView.ViewModel(session: createMockURLSession())
        await vm.loadArticles()
        vm.filterText = "This is a very long string that won't match any article title"

        #expect(vm.filteredArticles.isEmpty, "There should be no matching articles")
    }

    func createMockURLSession() throws -> URLSessionMock {
        let articles = [Article.example]
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601

        let articleData = try encoder.encode(articles)
        return URLSessionMock(data: articleData)
    }
}
