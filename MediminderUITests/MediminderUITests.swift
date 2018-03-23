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
        let textView = app.textViews["Enter details here..."]
        textView.typeText("PParacetamol")
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
            textView.typeText("PParacetamol")
            app.buttons["Done"].tap()
            let tablesQuery = app.tables
            tablesQuery.staticTexts["Paracetamol"].swipeLeft()
            tablesQuery.staticTexts["Paracetamol"].swipeLeft()
            XCTAssertFalse(app.staticTexts["Paracetamol"].exists)
    }
    
        func testMarkingMedicationComplete() {
            app.navigationBars["Mediminder!"].buttons["Add"].tap()
            let textView = app.textViews["Enter details here..."]
            textView.typeText("CCalpol")
            app.buttons["Done"].tap()
            let tablesQuery = app.tables
            tablesQuery.staticTexts["Calpol"].swipeRight()
            tablesQuery.staticTexts["Calpol"].swipeRight()
            XCTAssertFalse(app.staticTexts["Calpol"].exists)
    }
    
    func testEditPage() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("GGaviscon")
        app.buttons["Done"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Gaviscon"].tap()
        XCTAssert(app.staticTexts["Add a new medication!"].exists)
    }
    
    func testAbilityToEditExistingMedication() {
        app.navigationBars["Mediminder!"].buttons["Add"].tap()
        let textView = app.textViews["Enter details here..."]
        textView.typeText("MMorphine")
        app.buttons["Done"].tap()
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Morphine"].tap()
        let textView2 = app.textViews["Morphine"]
        textView2.tap()
        _ = app.keys["Delete"].tap()
//        deleteKey.press(forDuration: 4.0)
        textView2.typeText("MMetformin")
        XCTAssertFalse(app.staticTexts["Metformin"].exists)
    }
    
}

