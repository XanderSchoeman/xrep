//
//  VideoCell.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/19.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupViews()
    }
    func setupViews(){
    }
            
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        
    }
    
}
    
    
    
class VideoCell: BaseCell {
   
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sizedImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Image-1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //corner radius should be half of width and height
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    let seperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        return view
    }()
    let titleLabel: UILabel = {
       let label = UILabel()
     //   label.backgroundColor = UIColor.purple
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some Title - More Some Title"
        return label
    }()
    let subtitleTextView: UITextView = {
        let textView = UITextView()
        //textView.backgroundColor = UIColor.red
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.text = "Something • Unknown amount of views • unknown year/time"
        textView.textContainerInset = UIEdgeInsets(top: 0,left: -4,bottom: 0,right: 0)
        textView.textColor = UIColor.lightGray
        return textView
    }()
    // swiftlint:disable all
     override func setupViews()
    {
       addSubview(thumbnailImageView)
        addSubview(seperatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subtitleTextView)
        //manual constraints expanded
        //addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        
        
        //horizontal constraints
        addConstraintsWithFormats(format: "H:|-16-[v0]-16-|", views: thumbnailImageView,seperatorView)
        //for userprofile horizontal constraints
        addConstraintsWithFormats(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintsWithFormats(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,seperatorView)
        addConstraintsWithFormats(format: "H:|[v0]|", views: seperatorView)
        
       //top constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        //left constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        
        
        //top constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        //left constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        //right constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        //height constraint
        addConstraint(NSLayoutConstraint(item: subtitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        
        
        //addConstraintsWithFormats(format: "V:[v0(20)]", views: titleLabel)
        //addConstraintsWithFormats(format: "H:|[v0]|", views: titleLabel)
    }
    // swiftlint:enable all
    
}
