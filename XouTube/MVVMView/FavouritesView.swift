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
    var animeList = [AnimeDetails]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.navigationItem.title = "Anime: \(self.animeList.count)"
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
        public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return animeList.count
        }
    
        public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animeFaveVidCell", for: indexPath) as! AnimeVideoCell
            let anime = animeList[indexPath.row]
            return cell
        }


    }
//swiftlint:enable all
