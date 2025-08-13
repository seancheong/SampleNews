//
//  URLSessionMock.swift
//  SampleNewsTests
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import Foundation
@testable import SampleNews

struct URLSessionMock: DataFetching {
    var data: Data

    func data(from url: URL) async throws -> (Data, URLResponse) {
        (data, URLResponse())
    }
}
