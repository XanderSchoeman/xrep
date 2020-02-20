//
//  MainVidViewController.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/17.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit

@IBDesignable class MainVidViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.red
        navigationItem.title = "Home"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
    }
    let menuBar: MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormats(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormats(format: "V:|[v0(150)]", views: menuBar)
        //Add this instead of constraint above then you get the status bar to allocate its size/ to get it to work
       //view.addConstraintsWithFormats(format: "V:|[v0(50)]", views: menuBar)
    }
     //Does not look like it is changing anything - need to fix in future
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
        //Additional Note - indexPath should be of type NSIndexPath, but it seems type NSIndexPath has been changed to indexpath in swift 3.0
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath)
        //cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //https://www.youtube.com/watch?v=APQVltARKF8&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj&index=2 at 13 mins in for calculations
        let heightForCell = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: heightForCell + 16 + 68)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
