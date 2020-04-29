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
    @IBOutlet weak var lblAnimeName: UILabel!
    @IBOutlet weak var lblAnimeType: UILabel!
    @IBOutlet weak var imgAnime: UIImageView!
    @IBOutlet weak var lblMangaName: UILabel!
    @IBOutlet weak var lblMangaType: UILabel!
    @IBOutlet weak var imgManga: UIImageView!
    
     public var animeViewModel: AnimeDetails! {
         didSet {
             lblAnimeType.text = animeViewModel?.type
             lblAnimeName.text = animeViewModel.title
             if let imageUrl = animeViewModel.image_url {
               imgAnime.loadImageUsingUrlString(urlString: imageUrl)
             }
         }
     }
     public var mangaViewModel: MangaDetails! {
          didSet {
              lblMangaName.text = mangaViewModel?.type
              lblMangaType.text = mangaViewModel.title
              if let imageUrl = mangaViewModel.image_url {
                imgManga.loadImageUsingUrlString(urlString: imageUrl)
              }
          }
      }

}
