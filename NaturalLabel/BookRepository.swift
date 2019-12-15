//
//  BookRepository.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import Foundation

protocol BookRepository {
    func select(onSuccess: ([Book]) -> Void)
}

struct BookRepositoryImpl: BookRepository {
    static let instance: BookRepository = BookRepositoryImpl()
    private init() {}

    func select(onSuccess: ([Book]) -> Void) {
        onSuccess([])
    }
}
