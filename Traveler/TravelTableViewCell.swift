//
//  TravelTableViewCell.swift
//  Traveler
//
//  Created by Letts, Sean Aleksey on 11/5/20.
//  Copyright © 2020 Letts, Sean Aleksey. All rights reserved.
//

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
