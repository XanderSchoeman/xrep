//
//  TestApiMethods.swift
//  XouTubeTests
//
//  Created by Xander Schoeman on 2020/03/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest
import XouTube
import XouDevSpec

class TestApiMethods: XCTestCase {

    override func setUp() {
    }
    func testApiGetAnimeDataTopIsNotEmpty () {
        var testSearchString = "Attack"

        var dataObj = [TopAnime]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString)
            apiCaller.getAnimeTopData { [weak self] result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!animes.isEmpty)
        }
        }
    }
    func testApiGetAnimeDetailsSearchIsNotEmpty () {
        var testSearchString = "Attack"
        var testGenreString = "action"

        var dataObj = [AnimeDetails]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString, GenreSelected: testGenreString)
            apiCaller.getAnimeData { [weak self] result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!animes.isEmpty)
        }
        }
    }
    func testApiGetMangaDetailsSearchIsNotEmpty () {
        var testSearchString = "Tokyo"
        var testGenreString = "romance"

        var dataObj = [MangaDetails]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString, GenreSelected: testGenreString)
            apiCaller.getMangaData { [weak self] result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!animes.isEmpty)
        }
        }
    }
}
