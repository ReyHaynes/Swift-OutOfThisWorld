//
//  Swift-Strings-Extension.swift
//
//  Created by Reinaldo Haynes on 8/8/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//
//

extension String {
    
    // Convert string to floats.
    func toFloat() -> Float? {
        return (self as NSString).floatValue
    }
    
}
