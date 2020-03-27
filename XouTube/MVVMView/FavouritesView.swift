//
//  FavouritesView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/23.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec

public class FavouritesView: UITableViewController {
    @IBOutlet weak var tableViewAnime: UITableView!

    var mangaList = faveMangalist
    var animeList = faveAnimelist {
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
//swiftlint:disable all
extension FavouritesView {

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
           var numberOfRows = 1
            if (section == 0)
            {
              numberOfRows =  animeList.count
                return numberOfRows
            }
            else if (section == 1)
            {
               numberOfRows =  mangaList.count
               return numberOfRows
            }
            return numberOfRows
        }
    
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = AnimeFavouriteCell()
            switch indexPath.section {
             case 0:
                 cell = tableView.dequeueReusableCell(withIdentifier: "animeFavouriteCell", for: indexPath) as! AnimeFavouriteCell
                 let anime = animeList[indexPath.row]
                 cell.setAnimeVidFaves(anime: anime)
             case 1:
                 cell = tableView.dequeueReusableCell(withIdentifier: "mangaFavouriteCell", for: indexPath) as! AnimeFavouriteCell
                 let manga = mangaList[indexPath.row]
                 cell.setMangaFaves(manga: manga)
             default:
                 print("An error has occured in the table cells")
               }
             return cell
            
            
        }

    public override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
         case 0:
                        if editingStyle == .delete {
                        animeList.remove(at: indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .bottom)
                        faveAnimelist.remove(at: indexPath.row)
                        }
         case 1:
              if editingStyle == .delete {
              mangaList.remove(at: indexPath.row)
              tableView.deleteRows(at: [indexPath], with: .bottom)
              faveMangalist.remove(at: indexPath.row)
             }
         default:
             print("An error has occured in the table delete")
           }

    }

    }
//swiftlint:enable all
