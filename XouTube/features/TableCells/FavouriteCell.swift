//
//  FavouriteCell.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/23.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import UIKit
import XouDevSpec

public class FavouriteCell: UITableViewCell {
    @IBOutlet weak var imgListItemAnime: UIImageView!
    @IBOutlet weak var lblListItemAnime: UILabel!
    @IBOutlet weak var imgListItemManga: UIImageView!
    @IBOutlet weak var lblListItemManga: UILabel!
     public var animeViewModel: AnimeTableModel! {
         didSet {
             lblListItemAnime.text = animeViewModel.title
             if let imageUrl = animeViewModel.image_url {
               imgListItemAnime.loadImageUsingUrlString(urlString: imageUrl)
             }
         }
     }
     public var mangaViewModel: MangaTableModel! {
          didSet {
              lblListItemManga.text = mangaViewModel.title
              if let imageUrl = mangaViewModel.image_url {
                imgListItemManga.loadImageUsingUrlString(urlString: imageUrl)
              }
          }
      }

}
