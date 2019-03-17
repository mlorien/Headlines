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
    @IBOutlet var coloredView: UIView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var titleText: String!
    var titleColor: UIColor!
    var alignment: NSTextAlignment!
    var imageURL: String!
    
    let darkBlue = "32363F".toUIColor()
    let lightPink = "D1C6C7".toUIColor()
    let lightGreen = "F2FFF3".toUIColor()
    let red = "C18383".toUIColor()
    let lightBlue = "C7D5E5".toUIColor()
    
    let lightGray = "DCE4E5".toUIColor()
    let lighterGray = "EDF6F7".toUIColor()
    
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        contentView.frame = contentView.frame.inset(by: margins)
    }
    
    func setupLayout() {
        titleLabel.text = titleText
        titleLabel.textColor = titleColor
        coloredView.backgroundColor = backgroundColor
        superView.backgroundColor = lighterGray
        guard imageURL != nil else { return }
        setImage()
    }
    
    fileprivate func setImage() {
        guard let url = URL(string: imageURL!) else {
            myImageView.isHidden = true
            return
        }
        myImageView.isHidden = false
        URLSession.shared
            .dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print(error!)
                    return
                }
                let capacity = 500 * 1024 * 1024
                let urlCache = URLCache(memoryCapacity: capacity, diskCapacity: capacity, diskPath: "diskPath")
                URLCache.shared = urlCache
                DispatchQueue.main.async {
                    self.myImageView.image = UIImage(data: data!)
                    self.myImageView.layer.cornerRadius = 10
                    self.myImageView.layer.masksToBounds = false
                    self.myImageView.clipsToBounds = true
                }
            }.resume()
    }
    
    func setup(with headline: Headline, even: Bool) {
        titleText = headline.title//.replacingOccurrences(of: " - ", with: "\n")
        backgroundColor = lightGray
        titleColor = darkBlue
        imageURL = headline.urlToImage
    }
    
}
