//
//  BaseTest.swift
//  TableViewUITests
//
//  Created by Guihal Gwenn on 25/02/2020.
//  Copyright © 2020 Oui.sncf. All rights reserved.
//

import XCTest
//import XCTest_Gherkin

class BaseTest: XCTestCase {
    lazy var app = {
        return XCUIApplication()
    }()
    
    override func setUp() {
        continueAfterFailure = false
        app.launchArguments.append("--UITests")
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }
}
