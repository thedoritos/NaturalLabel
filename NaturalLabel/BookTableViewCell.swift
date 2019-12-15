//
//  BookTableViewCell.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var bookTitleLabel: NaturalLabel!
    @IBOutlet weak var authorsLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!

    override func layoutSubviews() {
        self.bookTitleLabel.naturalize()
        super.layoutSubviews()
    }
}
