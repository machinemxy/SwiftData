//
//  SpendSmartUITests.swift
//  SpendSmartUITests
//
//  Created by 馬学渊 on 2023/12/31.
//

import XCTest

final class SpendSmartUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITEST"]
        app.launch()
    }
}
