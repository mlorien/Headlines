//
//  HeadlineCell.swift
//  Headlines
//
//  Created by Lorien Moisyn on 15/03/19.
//  Copyright © 2019 Lorien Moisyn. All rights reserved.
//

import UIKit


class HeadlineCell: UITableViewCell {
    
    @IBOutlet var coloredView: UIView!
//    @IBOutlet weak var imageView: !
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var alignTrailing: NSLayoutConstraint!
    @IBOutlet weak var alignLeading: NSLayoutConstraint!
    
    var titleText: String!
    var titleColor: UIColor!
    var alignment: NSTextAlignment!
    var imageURL: String!
    
    let oddColor = "1F2833".toUIColor()
    let evenColor = "D1C6C7".toUIColor()
    
    override func didMoveToSuperview() {
        setup()
    }
    
    private func loadFromNib() -> UIView? {
        let nibName = String(describing: self.classForCoder)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
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
        coloredView.backgroundColor = backgroundColor
        if alignment == .left {
            alignTrailing.priority = .defaultLow
        } else {
            alignLeading.priority = .defaultLow
        }
    }
    
    func setup(with headline: Headline, even: Bool) {
        titleText = headline.title.replacingOccurrences(of: " - ", with: "\n")
        backgroundColor = even ? evenColor : oddColor
        titleColor = even ? oddColor : evenColor
        alignment = even ? .right : .left
        imageURL = headline.urlToImage
    }
    
}
