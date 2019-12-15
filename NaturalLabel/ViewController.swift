//
//  ViewController.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bookTableView: UITableView!

    private var items: [BookTableItem] = []
    private lazy var bookRepository: BookRepository = BookRepositoryImpl.instance

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bookTableView.dataSource = self
        self.bookTableView.register(UINib(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "Book")
        self.bookTableView.rowHeight = UITableView.automaticDimension

        self.bookRepository.select(onSuccess: { [weak self] books in
            self?.items = books.map(BookTableItem.from(model:))
            self?.bookTableView.reloadData()
        })
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Book", for: indexPath) as? BookTableViewCell else { fatalError() }
        return cell
    }
}
