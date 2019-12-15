//
//  BookTableItem.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import Foundation

struct BookTableItem {
    let title: String
    let coverImageURL: URL
    let authors: String
    let summary: String

    static func from(model: Book) -> BookTableItem {
        return BookTableItem(
            title: model.title,
            coverImageURL: model.coverImageURL,
            authors: model.authors.joined(separator: " / "),
            summary: model.summary
        )
    }
}
