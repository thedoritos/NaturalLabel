//
//  NaturalLabel.swift
//  NaturalLabel
//
//  Created by thedoritos on 2019/12/15.
//  Copyright © 2019 KakeraGames. All rights reserved.
//

import UIKit
import NaturalLanguage

class NaturalLabel: UILabel {
    func naturalize() {
        guard let text = self.text else { return }
        debugPrint(text)

        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = text

        let tokens = tokenizer.tokens(for: text.startIndex..<text.endIndex)
        let words = tokens.map({ text[$0] })
        debugPrint(words)
    }
}
