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
    var animeList = [AnimeTableModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Anime: \(self.animeList.count)"
            }
        }
    }

    override public func viewDidLoad() {
    super.viewDidLoad()
        DispatchQueue.main.async {
            self.showSpinner()
            self.viewModel.getTopAnimeData()
        }
    }
    public override func viewDidAppear(_ animated: Bool) {
        self.removeSpinner()
    }
    lazy var viewModel: AnimeViewModel = {
        AnimeViewModel(with: self, repo: ApiCallerRepo())
    }()
}

 extension AnimeTable: UISearchBarDelegate {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return animeList.count
        }
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell", for: indexPath) as? CustomCell
            let anime = animeList[indexPath.row]
            cell?.animeViewModel = anime
            return cell ?? UITableViewCell()
        }
        public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            Analytics.logEvent(AnalyticsEventSelectItem, parameters: ["AnimeItemFromApiSelected": indexPath.row])
            let newViewController = storyboard?.instantiateViewController(withIdentifier:
                "AnimeDetailedInfoID") as? AnimeDetailedInfoView
            newViewController?.animeList = animeList[indexPath.row]
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Analytics.logEvent(AnalyticsEventSearch, parameters: ["AnimeSearchValue": searchBar.text as Any])
        DispatchQueue.main.async {
            self.showSpinner()
            var objcGenreglobal = GlobalDataGenre()
            let replacedString = searchBar.text?.replacingOccurrences(of: " ", with: "%20")
            guard let searchBarText = replacedString else {return}
            self.viewModel.getAnimeData(searchString: searchBarText, genreString: objcGenreglobal.message)
            _ = Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false) { (_) in
            self.removeSpinner()
            }
        }

        }
    }

extension AnimeTable: AnimeViewProtocol {
    public func animeRetrieveTopData(animeDetails: [TopAnime]) {
        self.animeList = animeDetails.map({return AnimeTableModel(topAnime: $0)})
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
    public func animeRetrieveData(animeDetails: [AnimeDetails]) {
        self.animeList = animeDetails.map({return AnimeTableModel(SearchedAnime: $0)})
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
}
