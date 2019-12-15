//
//  BookRepository.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import Foundation

protocol BookRepository {
    func select(onSuccess: @escaping ([Book]) -> Void)
}

struct BookRepositoryImpl: BookRepository {
    struct BooksResponse: Decodable {
        let items: [Item]

        struct Item: Decodable {
            let volumeInfo: VolumeInfo

            struct VolumeInfo: Decodable {
                let title: String
                let authors: [String]
                let description: String
                let imageLinks: ImageLinks

                struct ImageLinks: Decodable {
                    let thumbnail: String

                    var largeThumbnail: String {
                        return self.thumbnail
                            .replacingOccurrences(of: "http://", with: "https://")
                            .replacingOccurrences(of: "zoom=1", with: "zoom=10")
                    }
                }
            }
        }
    }

    static let instance: BookRepository = BookRepositoryImpl()
    private init() {}

    func select(onSuccess: @escaping ([Book]) -> Void) {
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=%22%E3%83%A9%E3%83%96%E3%82%B3%E3%83%A1%22&maxResults=40")!
        let request = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error)
                return
            }

            guard let data = data else { return }

            let decoder = JSONDecoder()
            guard let bookResponse = try? decoder.decode(BooksResponse.self, from: data) else { return }

            let books = bookResponse.items.map({
                Book(
                    title: $0.volumeInfo.title,
                    coverImageURL: URL(string: $0.volumeInfo.imageLinks.largeThumbnail)!,
                    authors: $0.volumeInfo.authors,
                    summary: $0.volumeInfo.description
                )
            })

            onSuccess(books)
        }
        request.resume()
    }
}
