//
//  SpaceDataViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/7/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class SpaceDataViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    
    
    var spaceObject: SpaceObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.blackColor()
        self.tableView.backgroundColor = UIColor.clearColor()
//        self.tableView!.backgroundColor = UIColor.clearColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - tableView Configuration
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("DataCell", forIndexPath: indexPath) as UITableViewCell
        
        switch indexPath.row {
            case 0:
                cell.textLabel.text = "Nickname:"
                cell.detailTextLabel.text = "\(self.spaceObject!.nickname!)"
            case 1:
                cell.textLabel.text = "Diameter (km):"
                cell.detailTextLabel.text = "\(self.spaceObject!.diameter!)"
            case 2:
                cell.textLabel.text = "Gravitational Force:"
                cell.detailTextLabel.text = "\(self.spaceObject!.gravitationalForce!)"
            case 3:
                cell.textLabel.text = "Length of a Year (in days):"
                cell.detailTextLabel.text = "\(self.spaceObject!.yearLength!)"
            case 4:
                cell.textLabel.text = "Length of a Day (in hours):"
                cell.detailTextLabel.text = "\(self.spaceObject!.dayLength!)"
            case 5:
                cell.textLabel.text = "Temperature (in celsius):"
                cell.detailTextLabel.text = "\(self.spaceObject!.temperature!)"
            case 6:
                cell.textLabel.text = "Number of Moons:"
                cell.detailTextLabel.text = "\(self.spaceObject!.numberOfMoons!)"
            case 7:
                cell.textLabel.text = "Interesting Fact:"
                cell.detailTextLabel.text = "\(self.spaceObject!.interestingFact!)"
            default: break
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
