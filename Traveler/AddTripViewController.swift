//
//  AddTripViewController.swift
//  Traveler
//  This program contains all code for the add a new object page
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

class AddTripViewController: UIViewController {
    var tripOptional: Trips? = nil
    var postionalOption: Int? = nil
    
    @IBOutlet var tripNumberLabel: UILabel!
    @IBOutlet var destinationLabel: UITextField!
    @IBOutlet var startDateLabel: UITextField!
    @IBOutlet var endDateLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let position = postionalOption{
            tripNumberLabel.text = "Add Trip #" + String(position + 1)
        }
        self.startDateLabel.keyboardType = UIKeyboardType.numbersAndPunctuation
        self.endDateLabel.keyboardType = UIKeyboardType.numbersAndPunctuation
    }
    

    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let identifier = segue.identifier{
            if identifier == "saveUnwind"{
                if let destination = destinationLabel.text{
                    if let startDate = startDateLabel.text{
                        if let endDate = endDateLabel.text{
                            tripOptional = Trips(destination: destination, startDate: startDate, endDate: endDate)
                        }
                        else{
                            
                        }
                    }
                    else{
                        
                    }
                }
                else{
                    
                }
            }
            else if identifier == "cancelUnwind"{
                
            }
        }
    }
}
