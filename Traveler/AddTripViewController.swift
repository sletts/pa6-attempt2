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
    //information to be returned after editting
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            if identifier == "saveUnwind"{
                if let destination = destinationLabel.text, destinationLabel.text != ""{
                    if let startDate = startDateLabel.text, startDateLabel.text != ""{
                        if let endDate = endDateLabel.text, endDateLabel.text != ""{
                            tripOptional = Trips(destination: destination, startDate: startDate, endDate: endDate)
                        }
                        else{
                            //eror: No end date
                            let alert = UIAlertController(title: "Error", message: "You didn't remeber to enter in an end date!", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                            self.present(alert, animated: true)
                        }
                    }
                    else{
                        //error: No start date
                        let alert = UIAlertController(title: "Error", message: "You didn't remeber to enter in a start date!", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                        self.present(alert, animated: true)
                    }
                }
                else{
                    //error: No destination
                    let alert = UIAlertController(title: "Error", message: "You didn't remeber to enter in an destination!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
                //NO IDEA WHY MY POP UPS VANISH SO FAST
            }
            else if identifier == "cancelUnwind"{
                //just do nothing. Cancel = empty
            }
        }
    }
}
