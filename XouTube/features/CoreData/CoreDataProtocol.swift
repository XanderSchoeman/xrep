//
//  CoreDataProtocl.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/29.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import XouDevSpec

public protocol CoreDataProtocol {
     func saveAnime(model: AnimeDetails)
     func saveManga(model: MangaDetails)
     func fetchManga(_ completion: @escaping (_ Models: [MangaDetails]) -> Void)
     func fetchAnime(_ completion: @escaping (_ Models: [AnimeDetails]) -> Void)
     func deleteAnime(title: String)
     func deleteManga(title: String)
     init()
}
