//
//  Structs.swift
//  XouTubeTests
//
//  Created by Xander Schoeman on 2020/03/09.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest
@testable import XouTube
@testable import XouDevSpec

class Structs: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testStructs() {
        let testUsernameString = "MrTest"
       _ = AnimeTopInfo()
       _ = AnimeInfo()
       let top = TopAnime()
       let details = AnimeDetails()
       let manga = MangaDetails()
       _ = AnimeTableModel(topAnime: top)
       _ = AnimeTableModel(SearchedAnime: details)
       _ = MangaTableModel(SearchedManga: manga)
       let userObj = User(gender: "Male", password: "something", profileImage: "", age: 22, fullName: "MrTestIsTheBest", username: "MrTest", email: "mrTest@gmail.com", genrePref: "Action")
        XCTAssert(userObj.username == testUsernameString)
    }

    override func tearDown() {
        testStructs()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
