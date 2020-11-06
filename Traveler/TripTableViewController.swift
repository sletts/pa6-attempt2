//
//  ViewController.swift
//  Traveler
//
//  Created by Letts, Sean Aleksey on 11/5/20.
//  Copyright © 2020 Letts, Sean Aleksey. All rights reserved.
//

import UIKit

class TripTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var placesSeen = [Trips]()
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeTrips()
    }
    
    func initializeTrips(){
        placesSeen.append(Trips(destination: "Hawaii", startDate: "01/01/2018", endDate: "01/10/2018"))
        placesSeen.append(Trips(destination: "Montana", startDate: "04/03/2016", endDate: "05/06/2016"))
        placesSeen.append(Trips(destination: "Alaska", startDate: "01/01/2015", endDate: "01/10/2015"))
        placesSeen.append(Trips(destination: "Maryland", startDate: "10/10/2014", endDate: "12/12/2014"))
        placesSeen.append(Trips(destination: "DC", startDate: "09/09/2013", endDate: "11/11/2013"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return placesSeen.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let trip = placesSeen[row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TravelTableViewCell
        cell.update(with: trip)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if let identifier = segue.identifier{
            if identifier == "DetailSegue"{
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    if let indexPath = tableView.indexPathForSelectedRow{
                        let trip = placesSeen[indexPath.row]
                        tripDetailVC.tripOptional = trip
                    }
                }
            }
            if identifier == "AddSegue"{
                if let addTripDetailVC = segue.destination as? AddTripViewController {
                    addTripDetailVC.postionalOption = placesSeen.count
                }
            }
        }
    }
    
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


}
