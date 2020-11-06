//
//  AddTripViewController.swift
//  Traveler
//
//  Created by Letts, Sean Aleksey on 11/5/20.
//  Copyright © 2020 Letts, Sean Aleksey. All rights reserved.
//

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
