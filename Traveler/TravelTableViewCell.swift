//
//  TravelTableViewCell.swift
//  Traveler
//  This program contains all code for the cells of the table
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

import UIKit

class TravelTableViewCell: UITableViewCell {
    //Class the cell is linked to
    
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var datesLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with trip: Trips){
        destinationLabel.text = trip.destination
        datesLabel.text = trip.startDate + " - " + trip.endDate
        if let tripPic = trip.imageFileName{
            tripImageView.image = UIImage(named: tripPic)
        }
        
    }

}
