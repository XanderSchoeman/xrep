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
    var detailsScreenViewModel = DetailsViewModel(repo: CoreData())
    @IBOutlet weak var tableViewAnime: UITableView!

    var mangaList = faveMangaListViewModelObject {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Favourites Left: \(self.animeCoreDataList.count + self.mangaCoreDataList.count)"
            }
        }
    }
    var animeList = faveAnimeListViewModelObject {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Favourites Left: \(self.animeCoreDataList.count + self.mangaCoreDataList.count)"
            }
        }
    }
    override public func viewDidLoad() {
        super.viewDidLoad()
        detailsScreenViewModel.view = self
        detailsScreenViewModel.fetchAnime()
                     }
        var animeCoreDataList = [AnimeDetails]()
        var mangaCoreDataList = [MangaDetails]()
    override public func viewDidAppear(_ animated: Bool) {
    }

}

extension FavouritesView {

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           var numberOfRows = 1
            if(section == 0) {
              numberOfRows =  animeCoreDataList.count
                return numberOfRows
            } else if(section == 1) {
               numberOfRows =  mangaCoreDataList.count
               return numberOfRows
            }
            return numberOfRows
        }
        //swiftlint:disable all
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
         case 0:
           guard let cell = tableView.dequeueReusableCell(withIdentifier: "animeFavouriteCell", for: indexPath) as? FavouriteCell else {
                return UITableViewCell()
            }
         cell.setBackgroundCellGradient(colorOne: UIColor.init(red: 6/255, green: 32/255, blue: 64/255, alpha: 1),
                                        colorTwo: UIColor.init(red: 19/255, green: 97/255, blue: 191/255, alpha: 1))
         let anime = animeCoreDataList[indexPath.row]
         cell.animeViewModel = anime
            return cell
         case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "mangaFavouriteCell", for: indexPath) as? FavouriteCell else {
                return UITableViewCell()
            }
         cell.setBackgroundCellGradient(colorOne: UIColor.init(red: 6/255, green: 32/255, blue: 64/255, alpha: 1),
                                        colorTwo: UIColor.init(red: 19/255, green: 97/255, blue: 191/255, alpha: 1))
         let manga = mangaCoreDataList[indexPath.row]
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
         detailsScreenViewModel.deleteAnime(title: animeCoreDataList[indexPath.item].title ?? "")
         animeCoreDataList.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .bottom)
         }
         case 1:
         if editingStyle == .delete {
         Analytics.logEvent("MangaDeleted", parameters: nil)
         detailsScreenViewModel.deleteManga(title: mangaCoreDataList[indexPath.item].title ?? "")
         mangaCoreDataList.remove(at: indexPath.row)
         tableView.deleteRows(at: [indexPath], with: .bottom)
         }
         default:
         print("An error has occured in the table delete")
           }
    }

    }
extension FavouritesView: FavouriteViewProtocol {
    public func displayFavouriteAnime(model: [AnimeDetails]) {
        animeCoreDataList = model
    }
    public func displayFavouriteManga(model: [MangaDetails]) {
        mangaCoreDataList = model
    }
}
