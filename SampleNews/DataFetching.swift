//
//  DataFetching.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import Foundation

protocol DataFetching: Sendable {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching {}
