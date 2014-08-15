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
    
    override init() {
        
    }
    
    init(initWithData data:NSDictionary, andImage image:UIImage) {
        if data[PLANET_NAME] { self.name = String(format: data[PLANET_NAME] as NSString) }
        if data[PLANET_GRAVITY] { self.gravitationalForce = Float(data[PLANET_GRAVITY] as NSNumber) }
        if data[PLANET_DIAMETER] { self.diameter = Float(data[PLANET_DIAMETER] as NSNumber) }
        if data[PLANET_YEAR_LENGTH] { self.yearLength = Float(data[PLANET_YEAR_LENGTH] as NSNumber) }
        if data[PLANET_DAY_LENGTH] { self.dayLength = Float(data[PLANET_DAY_LENGTH] as NSNumber) }
        if data[PLANET_TEMPERATURE] { self.temperature = Float(data[PLANET_TEMPERATURE] as NSNumber) }
        if data[PLANET_NUMBER_OF_MOONS] { self.numberOfMoons = Int(data[PLANET_NUMBER_OF_MOONS] as NSNumber) }
        if data[PLANET_NICKNAME] { self.nickname = String(format: data[PLANET_NICKNAME] as NSString) }
        if data[PLANET_INTERESTING_FACT] { self.interestingFact = String(format: data[PLANET_INTERESTING_FACT] as NSString) }
        
        self.spaceImage = image
    }
   
}
