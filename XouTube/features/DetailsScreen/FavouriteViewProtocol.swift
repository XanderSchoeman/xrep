//
//  AnimeDetailsViewProtocol.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import XouDevSpec

public protocol FavouriteViewProtocol: class {
    func displayFavouriteAnime(model: [AnimeDetails])
    func displayFavouriteManga(model: [MangaDetails])
}
