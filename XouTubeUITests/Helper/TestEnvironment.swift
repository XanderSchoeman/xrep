//
//  TestEnvironment.swift
//  XouTubeUITests
//
//  Created by Xander Schoeman on 2020/03/16.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest
@testable import XouTube

struct TestEnvironment {

    let application: XCUIApplication

    init(application: XCUIApplication) {
    self.application = application
    self.application.launchArguments += ["-delay", "0"]
    }

}
