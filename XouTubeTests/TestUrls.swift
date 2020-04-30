//
//  TestUrls.swift
//  XouTubeTests
//
//  Created by Xander Schoeman on 2020/04/30.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//

import XCTest
import XouTube
import XouDevSpec

class TestUrls: XCTestCase {

    override func setUp() {
    }
    func testUrlsIftheyAreTheCorrectStrings() {
        let usersUrl = "https://xoubase.herokuapp.com/users"
        let regUserUrl = "https://xoubase.herokuapp.com/send"
        let loginUserUrl = "https://xoubase.herokuapp.com/authenticate"
        let urlStrings = UrlStrings()
        XCTAssert(urlStrings.getUsersUrl == usersUrl)
        XCTAssert(urlStrings.registerUserUrl == regUserUrl)
        XCTAssert(urlStrings.loginUserUrl == loginUserUrl)
    }
}
