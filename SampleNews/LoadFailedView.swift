//
//  LoadFailedView.swift
//  SampleNews
//
//  Created by Zhen Xiong Cheong on 2025/08/13.
//

import SwiftUI

struct LoadFailedView: View {
    var error: (any Error)?
    var retry: () async -> Void

    var body: some View {
        ContentUnavailableView {
            Text("Load Error")
                .font(.headline)
        } description: {
            Text("There was an error loading the articles.")
        } actions: {
            Button("Retry") {
                Task {
                    await retry()
                }
            }
        }
    }
}

#Preview {
    LoadFailedView(error: NSError(domain: "Sample News", code: 1)) {
        // do nothing
    }
}
