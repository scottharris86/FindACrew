//
//  Person.swift
//  FindACrew
//
//  Created by scott harris on 2/11/20.
//  Copyright © 2020 scott harris. All rights reserved.
//

import Foundation

struct Person: Codable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
        
    }
    
    
    
}
