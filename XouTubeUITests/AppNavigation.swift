//
//  AppNavigation.swift
//  XouTubeUITests
//
//  Created by Xander Schoeman on 2020/04/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest

class AppNavigation: TestCase {

    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        environment = TestEnvironment(application: application)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        func testNavigateThroughApp() {
            application.launch()
            sleep(2)
            application.buttons["AnimeButton"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            application.buttons["MangaButton"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            application.buttons["FavouritesButton"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            application.buttons["ProfileButton"].tap()
            sleep(2)
            application.buttons["Sign Up"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            application.buttons["Sign In"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            application.buttons["Back"].tap()
            sleep(2)
            XCTAssert(application.buttons["AnimeButton"].exists)

        }
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

}
