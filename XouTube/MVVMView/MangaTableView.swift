//
//  MangaTableView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/26.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Alamofire

public class MangaTableView: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var mangaList = [MangaTableViewModel]() {
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

}
//swiftlint:disable all
extension MangaTableView: UISearchBarDelegate {
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return mangaList.count
        }
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeVidCell", for: indexPath) as! AnimeVideoCell
            let manga = mangaList[indexPath.row]
            cell.mangaViewModel = manga
            return cell
        }
        public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let newViewController = storyboard?.instantiateViewController(withIdentifier: "MangaDetailedInfoID") as? MangaDetailedInfoView
            newViewController?.mangaList = mangaList[indexPath.row]
            self.navigationController?.pushViewController(newViewController!, animated: true)
        }
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          let replacedString = searchBar.text?.replacingOccurrences(of: " ", with: "%20")
          guard let searchBarText = replacedString else {return}
          let apiCaller = ApiCallerRepo.init(SearchText: searchBarText)
          apiCaller.getMangaData { [weak self] result in
              switch result {
              case .failure( let error):
                  print(error)
              case .success(let animes):
                  self?.mangaList = animes.map({return MangaTableViewModel(SearchedManga: $0)})
                  DispatchQueue.main.async {
                  self?.tableView.reloadData()
                  }
                  
          }
          }
    }
    }
//swiftlint:enable all
