//
//  Trips.swift
//  Traveler
//
//  Created by Letts, Sean Aleksey on 11/5/20.
//  Copyright © 2020 Letts, Sean Aleksey. All rights reserved.
//

import Foundation

class Trips{
    var destination: String
    var startDate: String
    var endDate: String
    var imageFileName: String?
    
    init(destination: String, startDate: String, endDate: String) {
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
    }
}
