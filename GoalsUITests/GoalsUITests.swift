//
//  GoalsUITests.swift
//  GoalsUITests
//
//  Created by Dominic Alvaro on 30/08/2017.
//  Copyright © 2017 Dominic Alvaro. All rights reserved.
//

import XCTest

class GoalsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        //Starting the app
        let app = XCUIApplication()
        
        //Tapping the Add button
        app.buttons["Add"].tap()
        
        //Filling out the first textfield by name
        app.textFields["Enter your Goal"].tap()
        app.textFields["Enter your Goal"].typeText("Run a Big Company")
        //Filling out the next text field
        app.textFields["Long Term?"].tap()
        app.textFields["Long Term?"].typeText("Long Term")
        //Filling out Description
        app.textViews["Description"].tap()
        app.textViews["Description"].typeText("To run a big company like Facebook")
        app.buttons["Add Goal"].tap()
       
        
        //NEED TO GET THIS WORKING
        //app.tables.cells["Run a Big Company"].tap()
        //app.buttons["Back"].tap()
        
        //WHEN IN THE DETAIL VIEW!!! CHECK TO SEE IF THE LABELS EQUAL WHAT YOU SET THEM AS (VIEW TUTORIAL) THEN FINISHED
        
        //Deletes first cell
        let tablesQuery = app.tables.cells
        tablesQuery.element(boundBy: 0).swipeLeft()
        tablesQuery.element(boundBy: 0).buttons["Delete"].tap()
        
        
        
    }
    
}
