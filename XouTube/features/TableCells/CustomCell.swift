//
//  CustomCell.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/23.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec

public class CustomCell: UITableViewCell {
    @IBOutlet weak var imgListItem: UIImageView!
    @IBOutlet weak var lblListItem: UILabel!
    @IBOutlet weak var lblListItemScore: UILabel!
       public var animeViewModel: AnimeTableModel? {
            didSet {
                lblListItemScore.text = "\(animeViewModel?.score ?? 0.0)"
                lblListItem.text = animeViewModel?.title
                if let imageUrl = animeViewModel?.image_url {
                  imgListItem.loadImageUsingUrlString(urlString: imageUrl)
                }
            }
        }
        public var mangaViewModel: MangaTableModel? {
             didSet {
                lblListItemScore.text = "\(mangaViewModel?.score ?? 0.0)"
                lblListItem.text = mangaViewModel?.title
                if let imageUrl = mangaViewModel?.image_url {
                   imgListItem.loadImageUsingUrlString(urlString: imageUrl)
                 }
             }
         }
       public func setAnimeVidSearch(anime: AnimeDetails) {
            lblListItem.text = anime.title
            if let profileImageUrl = anime.image_url {
                imgListItem.loadImageUsingUrlString(urlString: profileImageUrl)
              }
        }
        public func setAnimeVidTop(anime: TopAnime) {
             lblListItem.text = anime.title
             if let profileImageUrl = anime.image_url {
                 imgListItem.loadImageUsingUrlString(urlString: profileImageUrl)
               }
         }
        public func setMangaSearch(manga: MangaDetails) {
             lblListItem.text = manga.title
             if let profileImageUrl = manga.image_url {
                 imgListItem.loadImageUsingUrlString(urlString: profileImageUrl)
               }
         }
}
