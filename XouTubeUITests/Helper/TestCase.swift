//
//  TestCase.swift
//  XouTubeUITests
//
//  Created by Xander Schoeman on 2020/03/16.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest

class TestCase: XCTestCase {

    var application: XCUIApplication!
    var environment: TestEnvironment!

     override func setUp() {
         continueAfterFailure = false
         application = XCUIApplication()
         environment = TestEnvironment(application: application)
     }

}
