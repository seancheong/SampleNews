//
//  Article.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import Foundation

struct Article: Codable, Hashable, Identifiable {
    let id: String
    var thumbnail: URL
    var image: URL
    var url: URL
    var title: String
    var section: String
    var date: Date
    var author: String
    var description: String
    var text: String

    static let example = Article(
        id: "1",
        thumbnail: URL(string: "https://placehold.co/600x400")!,
        image: URL(string: "https://placehold.co/600x400")!,
        url: URL(string: "https://placehold.co/600x400")!,
        title: "Example Title",
        section: "Example Section",
        date: .now,
        author: "Example Author",
        description: "Example Description",
        text: "Example Text"
    )
}
