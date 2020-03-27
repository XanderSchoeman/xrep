//
//  FavouritesListView.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/03/27.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import UIKit
import XouDevSpec

public class FavouritesListView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var animeTableView: UITableView!
    @IBOutlet weak var mangaTableView: UITableView!
    var animeList = faveAnimelist
    var mangaList = faveMangalist

    override public func viewDidLoad() {
        super.viewDidLoad()
                     }
    override public func viewDidAppear(_ animated: Bool) {
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            var numberOfRows = 1
            switch tableView {
            case animeTableView:
                numberOfRows = animeList.count
            case mangaTableView:
                numberOfRows = mangaList.count
            default:
                print("An error has occured in the table")
            }
        return numberOfRows
        }
    //swiftlint:disable all
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = AnimeFavouriteCell()
        switch tableView {
        case animeTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "animeFavouriteCell", for: indexPath) as! AnimeFavouriteCell
            let anime = animeList[indexPath.row]
            cell.setAnimeVidFaves(anime: anime)
        case mangaTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "mangaFavouriteCell", for: indexPath) as! AnimeFavouriteCell
            let manga = mangaList[indexPath.row]
            cell.setMangaFaves(manga: manga)
        default:
            print("An error has occured in the table cells")
          }
        return cell
        }
    //swiftlint:enable all

    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch tableView {
        case animeTableView:
                    if editingStyle == .delete {
                animeList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
                faveAnimelist.remove(at: indexPath.row)
            }
        case mangaTableView:
                    if editingStyle == .delete {
                mangaList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .bottom)
                faveMangalist.remove(at: indexPath.row)
            }
        default:
            print("An error has occured when trying to delete")
        }

    }

}
