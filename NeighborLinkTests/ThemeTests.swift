//
//  ThemeTests.swift
//  NeighborLink
//
//  Created by Felipe Naranjo on 2/11/17.
//  Copyright © 2017 Felipe Naranjo. All rights reserved.
//

import XCTest
@testable import NeighborLink

class ThemeTests: XCTestCase {
    
    let classUnderTest = Theme()
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Theme_hasLightGreenColor() {
        let lightGreenColor = classUnderTest.lightGreen
        XCTAssertNotNil(lightGreenColor)
    }
    
    func test_Theme_hasCharcoalColor() {
        let charcoal = classUnderTest.charcoal
        XCTAssertNotNil(charcoal)
    }
    
    func test_Theme_hasGradientGreenColor() {
        let gradientContrastLightGreen = classUnderTest.gradientContrastLightGreen
        XCTAssertNotNil(gradientContrastLightGreen)
    }
}
