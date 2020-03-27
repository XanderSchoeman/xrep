//
//  Extensions.swift
//  XouTubeTests
//
//  Created by Xander Schoeman on 2020/03/09.
//  Copyright © 2020 Xander Schoeman. All rights reserved.
//


import XCTest
@testable import XouTube
@testable import XouDevSpec

class Extensions: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    func testRGBExtensionIfItChangesColour() {
        var testText: UIColor
        var testText2: UIColor
        testText = UIColor.rgb(red: 50, green: 50, blue: 50, alpha: 1)
        testText2 = UIColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        XCTAssertEqual(testText.cgColor == testText2.cgColor, true)
    }
    func testLoadUIImageExtensionIfItLoads() {

    }

    override func tearDown() {
        testRGBExtensionIfItChangesColour()
        testLoadUIImageExtensionIfItLoads()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
