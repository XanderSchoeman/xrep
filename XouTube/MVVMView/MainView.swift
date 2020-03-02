//
//  MainVidViewController.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/02/17.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Alamofire
    //swiftlint:disable all
class MainView: UICollectionViewController, UICollectionViewDelegateFlowLayout {
     
    var animes: [animeTopInfoStruct]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
         func doRequestWithHeaders2() {
          let headers: HTTPHeaders = [
              "x-rapidapi-host": "jikan1.p.rapidapi.com",
              "x-rapidapi-key": "844aa4143cmsha9162c362813b50p169716jsn9c6c8269713a"
          ]

          AF.request("https://jikan1.p.rapidapi.com/top/anime/1/upcoming", headers: headers)
            .responseDecodable(of: animeTopInfo.self) { (response) in
                guard let animes = response.value else {return}
                
                
   
                self.animes = [animeTopInfoStruct]()
                
                for item in 0...10 {
                    var anime = animeTopInfoStruct()
                    
                    anime.top.image_url = animes.top[item].image_url as? String
                    anime.top.title = animes.top[item].title as? String
                    
                    anime.top.type = animes.top[item].type as? String
                    anime.top.rank = animes.top[item].rank as? Int
                    anime.top.end_date = animes.top[item].end_date as? String
                    
                    //video.channel = channel
                    self.animes?.append(anime)
                    DispatchQueue.main.async{
                        
                    self.collectionView.reloadData()
                    }
                    
                }
                
                    DispatchQueue.main.async{
                        
                    self.collectionView.reloadData()
                    }
                
                }

          }

        
        //view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 10/255, green: 30/255, blue: 64/255, alpha: 1)
       
        navigationItem.title = "Home"
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Home"
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.textColor = UIColor.white
        collectionView.backgroundColor = UIColor.white
        collectionView.register(VideoCells.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        setupMenuBar()
        setupNavBarButtons()
        doRequestWithHeaders2()
            }
    func setupNavBarButtons() {
        let searchImage = UIImage(systemName: "magnifyingglass")?.withRenderingMode(.alwaysOriginal)
        let moreNavigationImage = UIImage(named: "Navigation")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain,
                                                  target: self, action: #selector(handleSearch))
        let moreButton = UIBarButtonItem(image: moreNavigationImage, style: .plain,
                                         target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    @objc func handleMore() {
        print(123)
    }
    @objc func handleSearch() {
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
        return animes?.count ?? 0
    }
        //Additional Note - indexPath should be of type NSIndexPath,
    //but it seems type NSIndexPath has been changed to indexpath in swift 3.0
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath as IndexPath) as! VideoCells
        cell.anime = animes?[indexPath.item]
        //cell.backgroundColor = UIColor.red
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        //https://www.youtube.com/watch?v=APQVltARKF8&list=PL0dzCUj1L5JGKdVUtA5xds1zcyzsz7HLj&index=2
        //at 13 mins in for calculations
        let heightForCell = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: heightForCell + 16 + 88)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
//swiftlint:enable all
