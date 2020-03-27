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
    @IBOutlet weak var srchBar: UISearchBar!
    var animess = [TopStruct]()
    var animeList = [AnimeDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Anime: \(self.animeList.count)"
            }
        }
    }
    var viewModel = AnimeTableViewModel()
    override public func viewDidLoad() {
        super.viewDidLoad()
                     }
    override public func viewDidAppear(_ animated: Bool) {
    }

}
//swiftlint:disable all
extension AnimeTable: UISearchBarDelegate {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return animeList.count
        }
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell", for: indexPath) as! AnimeVideoCell
            let anime = animeList[indexPath.row]
            cell.setAnimeVidSearch(anime: anime)
            return cell
        }
        public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let newViewController = storyboard?.instantiateViewController(withIdentifier: "AnimeDetailedInfoID") as? AnimeDetailedInfoView
            newViewController?.animeList = animeList[indexPath.row]
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let replacedString = searchBar.text?.replacingOccurrences(of: " ", with: "%20")
        guard let searchBarText = replacedString else {return}
        let apiCaller = ApiCallerModel.init(SearchText: searchBarText)
        apiCaller.getAnimeData { [weak self] result in
            switch result {
            case .failure( let error):
                print(error)
            case .success(let animes):
                self?.animeList = animes
        }
        }
    }
    }
//swiftlint:enable all
