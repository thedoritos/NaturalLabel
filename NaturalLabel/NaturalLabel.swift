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
    private func getLines(from text: String) -> [String] {
        guard let font = self.font else { return [] }

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.font, value: font, range: NSRange(location: 0, length: attributedString.length))

        let frameSetter = CTFramesetterCreateWithAttributedString(attributedString)

        let framePath = CGPath(rect: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude), transform: nil)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRange(), framePath, nil)

        guard let lines = CTFrameGetLines(frame) as? [CTLine] else { return [] }
        return lines.map({ line in
            let cfRange = CTLineGetStringRange(line)
            let nsRange = NSRange(location: cfRange.location, length: cfRange.length)
            return NSString(string: text).substring(with: nsRange)
        })
    }

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
