//
//  SpaceObject.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/6/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class SpaceObject: NSObject {
    
    var name:               String?
    var gravitationalForce: Float?
    var diameter:           Float?
    var yearLength:         Float?
    var dayLength:          Float?
    var temperature:        Float?
    var numberOfMoons:      Int?
    var nickname:           String?
    var interestingFact:    String?
    
    var spaceImage:         UIImage?
    
    init() {
        
    }
    
    init(initWithData data:NSDictionary, andImage image:UIImage) {
        self.name = String(data[PLANET_NAME] as NSString)
        self.gravitationalForce = Float(data[PLANET_GRAVITY] as NSNumber)
        self.diameter = Float(data[PLANET_DIAMETER] as NSNumber)
        self.yearLength = Float(data[PLANET_YEAR_LENGTH] as NSNumber)
        self.dayLength = Float(data[PLANET_DAY_LENGTH] as NSNumber)
        self.temperature = Float(data[PLANET_TEMPERATURE] as NSNumber)
        self.numberOfMoons = Int(data[PLANET_NUMBER_OF_MOONS] as NSNumber)
        self.nickname = String(data[PLANET_NICKNAME] as NSString)
        self.interestingFact = String(data[PLANET_INTERESTING_FACT] as NSString)
        
        self.spaceImage = image
    }
   
}
