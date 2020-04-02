//
//  AnimeTable.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/03.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

public class AnimeTable: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!
    @IBOutlet weak var srchBar: UISearchBar!
    var animeViewModel = [AnimeTableViewModel]()
    var animeListt = [AnimeTableViewModel]()
    var animeList = [AnimeTableViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Anime: \(self.animeList.count)"
            }
        }
    }

    override public func viewDidLoad() {
    super.viewDidLoad()
    fetchTopData()
                     }
    public func fetchTopData() {
        var apiCaller = ApiCallerRepo()
        apiCaller.getAnimeTopData { [weak self] result in
        switch result {
        case .failure( let error):
        print(error)
        case .success(let animes):
        self?.animeViewModel = animes.map({return AnimeTableViewModel(topAnime: $0)})
        DispatchQueue.main.async {
        self?.tableView.reloadData()
           }
        }
        }
    }

}

 extension AnimeTable: UISearchBarDelegate {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return animeViewModel.count
        }
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell", for: indexPath) as? AnimeVideoCell
            let anime = animeViewModel[indexPath.row]
            cell?.animeViewModel = anime
            return cell!
        }
        public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            Analytics.logEvent(AnalyticsEventSelectItem, parameters: ["AnimeItemFromApiSelected": indexPath.row])
            let newViewController = storyboard?.instantiateViewController(withIdentifier:
                "AnimeDetailedInfoID") as? AnimeDetailedInfoView
            newViewController?.animeList = animeViewModel[indexPath.row]
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Analytics.logEvent(AnalyticsEventSearch, parameters: ["AnimeSearchValue": searchBar.text as Any])
        var objcGenreglobal = GlobalDataGenre()
        print(objcGenreglobal.genre)
        let replacedString = searchBar.text?.replacingOccurrences(of: " ", with: "%20")
        guard let searchBarText = replacedString else {return}
        let apiCaller = ApiCallerRepo.init(SearchText: searchBarText, GenreSelected: objcGenreglobal.message)
        apiCaller.getAnimeData { [weak self] result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            self?.animeViewModel = animes.map({return AnimeTableViewModel(SearchedAnime: $0)})
            DispatchQueue.main.async {
            self?.tableView.reloadData()
            }
        }
        }
    }
    }
