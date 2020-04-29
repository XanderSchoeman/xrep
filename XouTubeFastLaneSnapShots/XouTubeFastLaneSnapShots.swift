//
//  XouTubeFastLaneSnapShots.swift
//  XouTubeFastLaneSnapShots
//
//  Created by Xander Schoeman on 2020/04/29.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest

//swiftlint:disable all
class XouTubeFastLaneSnapShots: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        
        
    }


    func testNavigateThroughAppAndTakeSnapShotsShots() {
        setupSnapshot(app)
        app.launch()
        sleep(2)
        snapshot("HomeScreenShot")
        app.buttons["AnimeButton"].tap()
        sleep(2)
        snapshot("AnimeScreenShot")
        app.buttons["Back"].tap()
        sleep(2)
        app.buttons["MangaButton"].tap()
        sleep(2)
        snapshot("MangaScreenShot")
        app.buttons["Back"].tap()
        sleep(2)
        app.buttons["FavouritesButton"].tap()
        sleep(2)
        snapshot("FaveScreenShot")
        app.buttons["Back"].tap()
        sleep(2)
        app.buttons["ProfileButton"].tap()
        sleep(2)
        snapshot("ProfileScreenShot")
        app.buttons["Sign Up"].tap()
        sleep(2)
        snapshot("RegisterScreenShot")
        app.buttons["Back"].tap()
        sleep(2)
        app.buttons["Sign In"].tap()
        sleep(2)
        snapshot("SignInScreenShot")
        app.buttons["Back"].tap()
        sleep(2)
        app.buttons["Back"].tap()
        sleep(2)
                
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
