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

    func testHomeButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["Home"].exists)
    }
    func testAnimeButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["Anime"].exists)
    }
    func testMangaButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["Manga"].exists)
    }
    func testFavesButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["Faves"].exists)
    }
    func testProfileButtonExists() {
        application.launch()
        sleep(2)
        XCTAssert(application.buttons["Profile"].exists)
    }

}
