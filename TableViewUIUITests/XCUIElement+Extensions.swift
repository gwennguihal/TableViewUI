//
//  Prout.swift
//  TableViewUITests
//
//  Created by Guihal Gwenn on 25/02/2020.
//  Copyright © 2020 Oui.sncf. All rights reserved.
//

import Foundation
import XCTest_Gherkin

extension XCUIElement {
    func waitExistence(timeout: TimeInterval = TimeInterval(2)) -> Bool {
        guard exists else { return waitForExistence(timeout: timeout) }
        return true
    }
    
    public func swipeUpUntilVisible(element: XCUIElement, maximumAttempts: Int = 4) -> Bool {
        var attempts = 0
        while !element.isVisible &&  attempts < maximumAttempts {
            swipeUp()
            attempts += 1
        }
        return element.isVisible
    }
    
    private var isVisible: Bool {
        guard exists && !frame.isEmpty else { return false }
        return XCUIApplication().windows.element(boundBy: 0).frame.contains(frame)
    }
}
