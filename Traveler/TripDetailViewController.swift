//
//  TripDetailViewController.swift
//  Traveler
//  This program contains all code for the detailed page of info
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

class TripDetailViewController: UIViewController {
    
    @IBOutlet var tripNumberLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    var tripOptional: Trips? = nil
    var position: Int? = nil
    var totalSize: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        displayTrip()
    }
    //func that displays the relevant information in each cell
    func displayTrip(){
        if let trip = tripOptional{
            destinationLabel.text = "Destination: " + trip.destination
            startDateLabel.text = "Start Date: " + trip.startDate
            endDateLabel.text = "End Date: " + trip.endDate
            //if there is an image, display it
            if let tripPic = trip.imageFileName{
                tripImageView.image = UIImage(named: tripPic)
            }
            //unwraps the numbers needed for the top label
            if let cellPos = position, let size = totalSize{
                tripNumberLabel.text = "Trip " + String(cellPos + 1) + " of " + String(size)
            }
        }
    }
    
}
