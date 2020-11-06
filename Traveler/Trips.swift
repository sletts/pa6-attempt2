//
//  Trips.swift
//  Traveler
//  This program contains all code for the Trips class
//  CPSC 315-01, Fall 2020
//  PA #6
//
//  Created by Letts, Sean Aleksey on 11/5/20.
//  Copyright © 2020 Letts, Sean Aleksey. All rights reserved.
// images used
// beach:https://unsplash.com/photos/RF5U8BkaQHU
// snowy forest: https://www.twenty20.com/photos/64038666
//mountain image: https://unsplash.com/photos/Bkci_8qcdvQ

// DID NOT DO EXTRA CREDIT
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
