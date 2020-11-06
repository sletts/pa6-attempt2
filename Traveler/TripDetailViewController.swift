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
    
    func displayTrip(){
        if let trip = tripOptional{
            destinationLabel.text = "Destination: " + trip.destination
            startDateLabel.text = "Start Date: " + trip.startDate
            endDateLabel.text = "End Date: " + trip.endDate
            if let tripPic = trip.imageFileName{
                tripImageView.image = UIImage(named: tripPic)
            }
            if let cellPos = position, let size = totalSize{
                tripNumberLabel.text = "Trip " + String(cellPos) + " of " + String(size)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */
    

}
