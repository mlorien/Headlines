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
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet weak var alignTrailing: NSLayoutConstraint!
    @IBOutlet weak var alignLeading: NSLayoutConstraint!
    
    var titleText: String!
    var alignment: NSTextAlignment!
    var imageURL: String!
    
    let darkBlue = "242D44".toUIColor()
    let lightPink = "D1C6C7".toUIColor()
    
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
        titleLabel.textColor = lightPink
        titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.15)
        if alignment == .left {
            alignTrailing.priority = .defaultLow
        } else {
            alignLeading.priority = .defaultLow
        }
        guard imageURL != nil else { return }
        setImage()
    }
    
    fileprivate func setImage() {
        URLSession.shared
            .dataTask(with: URL(string: imageURL!)!) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                let capacity = 500 * 1024 * 1024
                let urlCache = URLCache(memoryCapacity: capacity, diskCapacity: capacity, diskPath: "diskPath")
                URLCache.shared = urlCache
                DispatchQueue.main.async {
                    self.myImageView.image = UIImage(data: data!)
                }
            }.resume()
    }
    
    func setup(with headline: Headline, even: Bool) {
        titleText = headline.title.replacingOccurrences(of: " - ", with: "\n")
        alignment = even ? .right : .left
        imageURL = headline.urlToImage
    }
    
}
