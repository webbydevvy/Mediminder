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
    
    func testAddNewMedication() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        XCTAssert(app.staticTexts["Add a new medication!"].exists)
    }
    
    func testCancelButton() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        app.buttons["Cancel"].tap()
        XCTAssert(app.navigationBars["Mediminder!"].exists)
    }
    
    func testClickTextBoxRemovePlaceHolder() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let returnButton = app.buttons["Return"]
        returnButton.tap()
        XCTAssertFalse(app.staticTexts["Enter details here..."].exists)
    }
    
}
