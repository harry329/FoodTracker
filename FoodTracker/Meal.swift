//
//  Meal.swift
//  FoodTracker
//
//  Created by Harsimran Singh on 12/3/17.
//  Copyright © 2017 HarsimranSingh. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCoding {
    
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
        static let photo = "name"
        static let rating = "rating"
    }
    
    
    //MARK: properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("meals")
    
    //MARK: Initializing
    init?(name mealName: String, image mealImage: UIImage?, rating mealRating: Int) {
        //Initializing should fail if there's no valid values
        guard !mealName.isEmpty else {
            return nil
        }
        
        guard mealRating >= 0 || mealRating <= 5 else {
            return nil
        }
        
        name = mealName
        photo = mealImage
        rating = mealRating
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = aDecoder.decodeObject(forKey: PropertyKey.rating) as? Int
        self.init(name: name, image: photo, rating: rating!)
    }
}
