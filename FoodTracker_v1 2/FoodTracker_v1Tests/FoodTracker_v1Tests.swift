//
//  FoodTracker_v1Tests.swift
//  FoodTracker_v1Tests
//
//  Created by Naski on 2016-08-29.
//  Copyright © 2016 Naski. All rights reserved.
//

import UIKit
import XCTest
@testable import FoodTracker_v1

class FoodTracker_v1Tests: XCTestCase {
    
    //MARK: FoodTracker tests
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNotNil(badRating, "Negative ratings are invalid, be positive")
    }}
