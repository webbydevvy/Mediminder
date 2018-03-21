//
//  MediminderUITests.swift
//  MediminderUITests
//
//  Created by Kaari Strack on 19/03/2018.
//  Copyright © 2018 HSJK. All rights reserved.
//

import XCTest

class MediminderUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func testExample() {
        app.navigationBars["Medications"].buttons["Add"].tap()
        XCTAssert(app.staticTexts["Add a new medication!"].exists)
    }
    
    func testCancel2() {
        app.navigationBars["Medications"].buttons["Add"].tap()
        app.buttons["Cancel"].tap()
        XCTAssert(app.navigationBars["Medications"].exists)
    }
    
}
