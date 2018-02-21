//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Harsimran Singh on 11/27/17.
//  Copyright © 2017 HarsimranSingh. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    //MARK: Meal Class Tests
    
    func testMealInitializationSucceeds() {
        //Zero Rating
        let zeroRatingMeal = Meal.init(name: "Zero", image: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //Highest Rating Meal
        let highestRatingMeal = Meal.init(name: "Highest", image: nil, rating: 5)
        XCTAssertNotNil(highestRatingMeal)
    }
    
    func testMealInitializationFails() {
        let negativeMealRating = Meal.init(name: "NeagativeRating", image: nil, rating: -1)
        XCTAssertNil(negativeMealRating)
        
        let emptyMealString = Meal.init(name: "", image: nil, rating: 0)
        XCTAssertNil(emptyMealString)
        
        let largeRating = Meal.init(name: "Large", image: nil, rating: 8)
        XCTAssertNil(largeRating)
        
    }
    
}
