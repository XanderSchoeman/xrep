//
//  MangaTableView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/26.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

public class MangaTableView: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var mangaList = [MangaTableModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Manga: \(self.mangaList.count)"
            }
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
                     }
    override public func viewDidAppear(_ animated: Bool) {
    }
    lazy var viewModel: MangaViewModel = {
        MangaViewModel(with: self, repo: ApiCallerRepo())
    }()

}
extension MangaTableView: UISearchBarDelegate {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mangaList.count
        }
        //swiftlint:disable all
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell", for: indexPath) as! CustomCell
            let manga = mangaList[indexPath.row]
            cell.mangaViewModel = manga
            return cell
        }
        //swiftlint:enable all
        public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            Analytics.logEvent(AnalyticsEventSelectItem, parameters: ["MangaItemFromApiSelected": indexPath.row])
            let newViewController = storyboard?.instantiateViewController(withIdentifier:
                "MangaDetailedInfoID") as? MangaDetailedInfoView
            newViewController?.mangaList = mangaList[indexPath.row]
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        Analytics.logEvent(AnalyticsEventSearch, parameters: ["MangaSearchValue": searchBar.text as Any])
          var objcGenreglobal = GlobalDataGenre()
          let replacedString = searchBar.text?.replacingOccurrences(of: " ", with: "%20")
          guard let searchBarText = replacedString else {return}
        viewModel.getMangaData(searchString: searchBarText, genreString: objcGenreglobal.message)
        }
    }

extension MangaTableView: MangaViewProtocol {
    public func mangaDataRetrieve(mangaDetails: [MangaDetails]) {
        self.mangaList = mangaDetails.map({return MangaTableModel(SearchedManga: $0)})
        DispatchQueue.main.async {
        self.tableView.reloadData()
        }
    }
}
