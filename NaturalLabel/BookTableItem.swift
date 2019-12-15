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

    static func from(model: Book) -> BookTableItem {
        return BookTableItem(
            title: model.title
        )
    }
}
