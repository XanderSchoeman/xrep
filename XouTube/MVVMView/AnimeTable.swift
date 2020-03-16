//
//  AnimeTable.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/03.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Alamofire

public class AnimeTable: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!
    
    var viewModel = AnimeTableViewModel()
    var animes: [animeTopInfoStruct]?
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        animes = viewModel.getDataFromJikanApi()
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
        
                     }
    override public func viewDidAppear(_ animated: Bool) {
//  animeTopList()
    }
//  public  func animeTopList() {
//                   let headers: HTTPHeaders = [
//                       "x-rapidapi-host": "jikan1.p.rapidapi.com",
//                       "x-rapidapi-key": "844aa4143cmsha9162c362813b50p169716jsn9c6c8269713a"
//                   ]
//
//                   AF.request("https://jikan1.p.rapidapi.com/top/anime/1/upcoming", headers: headers)
//                     .responseDecodable(of: animeTopInfo.self) { (response) in
//                         guard let animes = response.value else {return}
//                         self.animes = [animeTopInfoStruct]()
//
//                         for item in 0...10 {
//                             var anime = animeTopInfoStruct()
//                            print(animes)
//
//                            anime.top.image_url = animes.top[item].image_url
//                            anime.top.title = animes.top[item].title
//        //                     anime.top.type = animes.top[item].type as? String
//        //                     anime.top.rank = animes.top[item].rank as? Int
//        //                     anime.top.end_date = animes.top[item].end_date as? String
//                             self.animes?.append(anime)
//                            print(animes)
//                            DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                            }
//                             }
//
//                         }
//    }
}


//swiftlint:disable all
extension AnimeTable {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return (animes?.count) ?? 0
        }
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let animeVid = animes![indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell") as! AnimeVideoCell
            cell.setAnimeVid(anime: animeVid)
            return cell
        }
    }
//swiftlint:enable all
