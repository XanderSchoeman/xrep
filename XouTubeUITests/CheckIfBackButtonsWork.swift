//
//  CheckIfBackButtonsWork.swift
//  XouTubeUITests
//
//  Created by Xander Schoeman on 2020/03/16.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest

class CheckIfBackButtonsWork: TestCase {

    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        environment = TestEnvironment(application: application)
    }

    func testBackButtonGoesToPreviousPage() {
        application.launch()
        sleep(1)
        application.buttons["Anime"].tap()
        sleep(1)
        application.buttons["Anime"].tap()
        sleep(1)
        application.buttons["Back"].tap()
        sleep(1)
        application.buttons["Back"].tap()
        sleep(1)
        XCTAssert(application.buttons["Home"].exists)
    }

}
