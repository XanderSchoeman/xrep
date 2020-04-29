//
//  FirstTestCheckSomeButtons.swift
//  XouTubeUITests
//
//  Created by Xander Schoeman on 2020/03/16.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest

class FirstTestCheckSomeButtons: TestCase {

    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        environment = TestEnvironment(application: application)
    }

    func testAnimeButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["AnimeButton"].exists)
    }
    func testMangaButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["MangaButton"].exists)
    }
    func testFavesButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["FavouritesButton"].exists)
    }
    func testProfileButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["ProfileButton"].exists)
    }

}
