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
    
    func testEnteringTextPromptsDoneButtonToAppear() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("PParacetamol")
        XCTAssert(app.buttons["Done"].exists)
    }
    
    func testEnteringTextAppearsOnIndex() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("PParacetamol")
            app.buttons["Done"].tap()
        XCTAssert(app.staticTexts["Paracetamol"].exists)
    }
    
    func testEnteringTextThenPressingCancel() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("IIbuprofen")
        app.buttons["Cancel"].tap()
        XCTAssertFalse(app.staticTexts["Ibuprofen"].exists)
    }

    func testDeletingMedication() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("CCalpol")
        app.buttons["Done"].tap()
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
//        app.swipeLeft()
        XCTAssert(app.staticTexts["Calpol"].exists)
    }
    
    
    

    
    
}

