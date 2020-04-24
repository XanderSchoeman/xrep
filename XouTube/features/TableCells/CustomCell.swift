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
       public var animeViewModel: AnimeTableModel? {
            didSet {
                lblListItem.text = animeViewModel?.title
                if let imageUrl = animeViewModel?.image_url {
                  imgListItem.loadImageUsingUrlString(urlString: imageUrl)
                }
            }
        }
        public var mangaViewModel: MangaTableModel? {
             didSet {
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
