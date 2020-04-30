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
        let testSearchString = "Attack"

        var dataObj = [TopAnime]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString)
            apiCaller.getAnimeTopData {  result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!dataObj.isEmpty)
        }
        }
    }
    func testApiGetAnimeDetailsSearchIsNotEmpty () {
        let testSearchString = "Attack"
        let testGenreString = "action"

        var dataObj = [AnimeDetails]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString, GenreSelected: testGenreString)
            apiCaller.getAnimeData { result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!dataObj.isEmpty)
        }
        }
    }
    func testApiGetMangaDetailsSearchIsNotEmpty () {
        let testSearchString = "Tokyo"
        let testGenreString = "romance"
        var dataObj = [MangaDetails]()
        var apiCaller = ApiCallerRepo()
        apiCaller = .init(SearchText: testSearchString, GenreSelected: testGenreString)
            apiCaller.getMangaData { result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let animes):
            dataObj = animes
            XCTAssert(!dataObj.isEmpty)
        }
        }
    }
    func testApiGetUsersIsNotEmpty() {

        var dataObj = [User]()
        let apiCaller = XouBaseApiCalls()
            apiCaller.getUsers { result in
            switch result {
            case .failure( let error):
            print(error)
            case .success(let users):
            dataObj = users
            XCTAssert(!dataObj.isEmpty)
        }
        }
    }
}
