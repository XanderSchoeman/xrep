//
//  MenuBar.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/19.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit

 @IBDesignable class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31, alpha: 1)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    let cellId = "cellId"
   let imageNames = ["Home" , "Trending" , "Subscriptions" , "Account"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        addSubview(collectionView)
        addConstraintsWithFormats(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormats(format: "V:|[v0]|", views: collectionView)
        let selectedIndexPath =  NSIndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: [])
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    // swiftlint:disable all
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withTintColor(UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1), renderingMode: .alwaysTemplate)
        return cell
    }
    // swiftlint:enable all
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: BaseCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Home")?.withTintColor(UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1), renderingMode: .alwaysTemplate)
        //iv.tintColor =UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        return iv
    }()
    //Have to set the render with tint colour to fix olour bug
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
        }
    }
    //Have to set the render with tint colour to fix olour bug
    override var isHighlighted: Bool {
           didSet {
               imageView.tintColor = isHighlighted ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13, alpha: 1)
           }
       }
    override func setupViews() {
        super.setupViews()
        addSubview(imageView)
        addConstraintsWithFormats(format: "H:[v0(28)]", views: imageView)
        addConstraintsWithFormats(format: "V:[v0(28)]", views: imageView)
        addConstraint(NSLayoutConstraint(item: imageView,
                                         attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView,
                                         attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: -45))
        //Replace constraint above with one below when you get the status bar to work
        //addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
