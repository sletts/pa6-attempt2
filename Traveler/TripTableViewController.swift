//
//  ViewController.swift
//  Traveler
//  This program contains all code for the first/main page of the program
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

class TripTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var placesSeen = [Trips]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
    }
    
    //creates 5 trips to be added to the array as defaults. First three have pics
    func initializeTrips(){
        placesSeen.append(Trips(destination: "Hawaii", startDate: "01/01/2018", endDate: "01/10/2018"))
        placesSeen.append(Trips(destination: "Montana", startDate: "04/03/2016", endDate: "05/06/2016"))
        placesSeen.append(Trips(destination: "Alaska", startDate: "01/01/2015", endDate: "01/10/2015"))
        placesSeen.append(Trips(destination: "Maryland", startDate: "10/10/2014", endDate: "12/12/2014"))
        placesSeen.append(Trips(destination: "DC", startDate: "09/09/2013", endDate: "11/11/2013"))
        
        placesSeen[0].imageFileName = "beach"
        placesSeen[1].imageFileName = "mountains"
        placesSeen[2].imageFileName = "winter-forest"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return placesSeen.count
        }
        return 0
    }
    //adds data from every trip object to each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = placesSeen[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TravelTableViewCell
        cell.update(with: trip)
        return cell
    }
    //function in charge of directing where input to new pages takes users.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let identifier = segue.identifier{
            //if a person clicks on one for details, code goes here
            if identifier == "DetailSegue"{
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow{
                        let trip = placesSeen[indexPath.row]
                        tripDetailVC.tripOptional = trip
                        //this infor is needed to print out proper header
                        tripDetailVC.position = indexPath.row
                        tripDetailVC.totalSize = placesSeen.count
                    }
                }
            }
            //if a person clicks to add a new one, code goes here
            if identifier == "AddSegue"{
                if let addTripDetailVC = segue.destination as? AddTripViewController {
                    addTripDetailVC.postionalOption = placesSeen.count
                }
            }
        }
    }
    //if a new one is added and save is clicked, this code will add it to the array and update it
    @IBAction func unwindToTripTableViewController(segue: UIStoryboardSegue){
        if let identifier = segue.identifier{
            if identifier == "saveUnwind"{
                if let tripDetailVC = segue.source as? AddTripViewController{
                    if let trip = tripDetailVC.tripOptional{
                        placesSeen.append(trip)
                        tableView.reloadData()
                    }
                }
            }
        }
    }
    //code that runs when the edit button is pressed, enabled edit
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem){
        let newEdittingMode = !tableView.isEditing
        tableView.setEditing(newEdittingMode, animated: true)
    }
    //code to allow locations of objects to be moved. Reloads data after processing so backend is up to date with frontend
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let tempTrip = placesSeen.remove(at: sourceIndexPath.row)
        placesSeen.insert(tempTrip, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    //allows for the deletion of objects. Comes with animation
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        placesSeen.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }


}

