//
//  MainVidViewController.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/17.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit

@IBDesignable class MainVidViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    /*var videos: [Video] = {
        var theChannel = Channel()
        theChannel.name = "ChannelOfWonders"
        theChannel.profileImageName = "Image-1"
        
        var theSecondChannel = Channel()
        theSecondChannel.name = "ChannelOfPlanes"
        theSecondChannel.profileImageName = "planeProfile"
        
        
        var theVideo = Video()
        theVideo.title = "The Video Title - Vid Title"
        theVideo.thumbnailImageName = "sizedImage"
        theVideo.channel = theChannel
        theVideo.numberOfViews = 1131241434535
        
        var theSecondVideo = Video()
        theSecondVideo.title = "A Legendary Depiction - Bird Creature thingy of sorts"
        theSecondVideo.thumbnailImageName = "sizedImage2"
        theSecondVideo.channel = theSecondChannel
        theSecondVideo.numberOfViews = 334234244535
        
        return [theVideo,theSecondVideo]
    }()*/
    var videos: [Video]?
    //swiftlint:disable all
    
    
    func fetchVideos(){
        let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json")
        URLSession.shared.dataTask(with: url!)  { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                self.videos = [Video]()
                
                
                for dictionary in json as! [[String: AnyObject]] {
                    
                let video = Video()
                    video.title = dictionary["title"] as? String
                    video.thumbnailImageName = dictionary["thumbnail_image_name"] as? String
                    
                    video.numberOfViews = dictionary["number_of_views"] as? NSNumber
                    
                    let channelDictionary = dictionary["channel"] as! [String: AnyObject]
                    let channel = Channel()
                    channel.name = channelDictionary["name"] as? String
                    channel.profileImageName = channelDictionary["profile_image_name"] as? String
                    video.channel = channel
                    self.videos?.append(video)
                    //print(dictionary["title"])
                }
                DispatchQueue.main.async{
                self.collectionView.reloadData()
                }
                //print(json)
            } catch let jsonError {
                print(jsonError)
            }
            
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(str)
        
        }.resume()
    }
    //swiftlint:enable all
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideos()
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
        setupNavBarButtons()
    }
    func setupNavBarButtons() {
        let searchImage = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal)
        let moreNavigationImage = UIImage(named: "Navigation")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreButton = UIBarButtonItem(image: moreNavigationImage, style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    @objc func handleMore(){
        print(123)
    }
    @objc func handleSearch(){
        print(123)
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
        return videos?.count ?? 0
    }
        //Additional Note - indexPath should be of type NSIndexPath, but it seems type NSIndexPath has been changed to indexpath in swift 3.0
    //swiftlint:disable all
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! VideoCell
        cell.video = videos?[indexPath.item]
        //cell.backgroundColor = UIColor.red
        return cell
    }
    //swiftlint:enable all
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //https://www.youtube.com/watch?v=APQVltARKF8&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj&index=2 at 13 mins in for calculations
        let heightForCell = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: heightForCell + 16 + 88)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
