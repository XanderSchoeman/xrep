//
//  DetailsViewModel.swift
//  XouTube
//
//  Created by Xander Schoeman on 2020/04/28.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import Foundation
import XouDevSpec

public class DetailsViewModel {
    var repo: CoreDataProtocol
    var view: FavouriteViewProtocol?
    public init(repo: CoreDataProtocol) {
        self.repo = repo
    }
    public func saveAnime(model: AnimeDetails) {
        repo.saveAnime(model: model)
    }
    public func saveManga(model: MangaDetails) {
        repo.saveManga(model: model)
    }
    public func fetchAnime() {
        repo.fetchAnime { (fetchedModels) in
            self.view?.displayFavouriteAnime(model: fetchedModels)
        }
    }
    public func fetchManga() {
        repo.fetchManga { (fetchedModels) in
            self.view?.displayFavouriteManga(model: fetchedModels)
        }
    }
    public func deleteAnime(title: String) {
        repo.deleteAnime(title: title)
    }
    public func deleteManga(title: String) {
        repo.deleteManga(title: title)
    }
}
