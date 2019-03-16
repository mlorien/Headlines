//
//  HeadlineCell.swift
//  Headlines
//
//  Created by Lorien Moisyn on 15/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit

class HeadlineCell: UITableViewCell {
    
    @IBOutlet var superView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var alignTrailing: NSLayoutConstraint!
    @IBOutlet weak var alignLeading: NSLayoutConstraint!
    
    var titleText: String!
    var titleColor: UIColor!
    var alignment: NSTextAlignment!
    
    let oddColor = "1F2833".toUIColor()//"EDE4C7".toUIColor()
    let evenColor = "D1C6C7".toUIColor()//"D6B6B8".toUIColor()//"5B9279".toUIColor()

    override func didMoveToSuperview() {
        setup()
    }
    
    func setup() {
        guard let view = loadFromNib() else { return }
        view.frame = self.bounds
        addSubview(view)
        setupLayout()
    }
    
    func setupLayout() {
        titleLabel.text = titleText
        titleLabel.textColor = titleColor
//        titleLabel.textAlignment = alignment
        superView.backgroundColor = backgroundColor
        if alignment == .left {
            alignTrailing.priority = .defaultLow
        } else {
            alignLeading.priority = .defaultLow
        }
    }
    
    func setup(with headline: Headline, even: Bool) {
        titleText = headline.title.replacingOccurrences(of: " - ", with: "\n")
        backgroundColor = even ? evenColor : oddColor
        titleColor = even ? oddColor : evenColor//oddColor : .white
        alignment = even ? .right : .left
    }
    
    private func loadFromNib() -> UIView? {
        let nibName = String(describing: self.classForCoder)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
}
