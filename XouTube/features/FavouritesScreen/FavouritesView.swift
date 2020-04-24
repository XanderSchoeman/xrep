//
//  FavouritesView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/23.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec
import Firebase

public class FavouritesView: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!

    var mangaList = faveMangaListViewModelObject {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Favourites Left: \(self.animeList.count + self.mangaList.count)"
            }
        }
    }
    var animeList = faveAnimeListViewModelObject {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Favourites Left: \(self.animeList.count + self.mangaList.count)"
            }
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
                     }
    override public func viewDidAppear(_ animated: Bool) {
    }

}

extension FavouritesView {

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           var numberOfRows = 1
            if (section == 0) {
              numberOfRows =  animeList.count
                return numberOfRows
            } else if (section == 1) {
               numberOfRows =  mangaList.count
               return numberOfRows
            }
            return numberOfRows
        }
        //swiftlint:disable all
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = FavouriteCell()
        switch indexPath.section {
         case 0:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "animeFavouriteCell", for: indexPath) as? FavouriteCell else {
                return UITableViewCell()
            }
         let anime = animeList[indexPath.row]
         cell.animeViewModel = anime
            return cell
         case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mangaFavouriteCell", for: indexPath) as? FavouriteCell else {
                return UITableViewCell()
            }
         let manga = mangaList[indexPath.row]
         cell.mangaViewModel = manga
            return cell
         default:
         print("An error has occured in the table cells")
            return UITableViewCell()
           }
    }
        //swiftlint:enable all
    public override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle,
                                   forRowAt indexPath: IndexPath) {
        switch indexPath.section {
         case 0:
         if editingStyle == .delete {
         Analytics.logEvent("AnimeDeleted", parameters: nil)
         animeList.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .bottom)
         faveAnimeListViewModelObject.remove(at: indexPath.row)
         }
         case 1:
         if editingStyle == .delete {
         Analytics.logEvent("MangaDeleted", parameters: nil)
         mangaList.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .bottom)
         faveMangaListViewModelObject.remove(at: indexPath.row)
         }
         default:
         print("An error has occured in the table delete")
           }
    }

    }
