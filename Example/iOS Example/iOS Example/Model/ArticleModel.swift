//
//  ArticleModel.swift
//  iOS Example
//
//  Created by Paris on 2023/2/12.
//

import Foundation

// MARK: Model
struct ArticleModel: Hashable, Equatable {
    let id = UUID().uuidString
    let title: String
    let cover: String
    let author: String
}


// MARK: Mock Data
extension ArticleModel {
    static func list() -> [ArticleModel] {
        [
            ArticleModel(
                title: "Capture machine-readable codes and text with VisionKit",
                cover: "Capture machine-readable codes and text with VisionKit",
                author: "Ron Santos"
            ),
            ArticleModel(
                title: "Get to know Create ML Components",
                cover: "Get to know Create ML Components",
                author: "Alejandro"
            ),
            ArticleModel(
                title: "What's new in Create ML",
                cover: "What's new in Create ML.png",
                author: "Vrushali Mundhe, "
            ),
            ArticleModel(
                title: "Compose advanced models with Create ML Components",
                cover: "Compose advanced models with Create ML Components",
                author: "David Findlay,"
            ),
            ArticleModel(
                title: "Optimize your Core ML usage",
                cover: "Optimize your Core ML usage",
                author: "Ben"
            ),
        ]
    }
}
