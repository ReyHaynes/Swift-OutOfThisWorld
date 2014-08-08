//
//  OuterSpaceTableViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/5/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class OuterSpaceTableViewController: UITableViewController, AddSpaceObjectViewControllerDelegate {
    
    // MARK: - Properties
    
    var planets = [SpaceObject]()
    var addedSpaceObjects = [SpaceObject]()
    
    
    // MARK: - Overrides / viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        for planetData in AstronomicalData.allKnownPlanets() {
            var imageName = "\(planetData[PLANET_NAME]).jpg"
            var planet = SpaceObject(initWithData: planetData as NSDictionary, andImage: UIImage(named: imageName))
            self.planets += [planet]
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender.isKindOfClass(UITableViewCell) {
            if segue.destinationViewController.isKindOfClass(SpaceImageViewController) {
                var nextViewController = segue.destinationViewController as SpaceImageViewController
                var path = self.tableView.indexPathForCell(sender as UITableViewCell)
                var selectedObject: SpaceObject?
                if path.section == 0 {
                    selectedObject = self.planets[path.row]
                }
                else if path.section == 1 {
                    selectedObject = self.addedSpaceObjects[path.row]
                }
                nextViewController.spaceObject = selectedObject
            }
        }
        
        if sender.isKindOfClass(NSIndexPath) {
            if segue.destinationViewController.isKindOfClass(SpaceDataViewController) {
                var nextViewController = segue.destinationViewController as SpaceDataViewController
                var path = sender as NSIndexPath
                var selectedObject: SpaceObject?
                if path.section == 0 {
                    selectedObject = self.planets[path.row]
                }
                else if path.section == 1 {
                    selectedObject = self.addedSpaceObjects[path.row]
                }
                nextViewController.spaceObject = selectedObject
            }
        }
        
        if segue.destinationViewController.isKindOfClass(AddSpaceObjectViewController) {
            var addSpaceObjectVC = segue.destinationViewController as AddSpaceObjectViewController
            addSpaceObjectVC.delegate = self
        }
    }

    
    // MARK: - UITableViewDataSource

    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        if self.addedSpaceObjects.count > 0 {
            return 2
        } else {
            return 1
        }
    }

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if section == 1 {
            return self.addedSpaceObjects.count
        } else {
            return self.planets.count
        }
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        //Configure the cell...
        
        if indexPath.section == 1 {
            var planet = self.addedSpaceObjects[indexPath.row]
            cell.textLabel.text = planet.name!
            cell.detailTextLabel.text = planet.nickname!
            cell.imageView.image = planet.spaceImage!
            
        } else {
            var planet = self.planets[indexPath.row]
            cell.textLabel.text = planet.name!
            cell.detailTextLabel.text = planet.nickname!
            cell.imageView.image = planet.spaceImage!
        }
        
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel.textColor = UIColor.whiteColor()
        cell.detailTextLabel.textColor = UIColor(white: 0.5, alpha: 1.0)

        return cell
    }
    
    
    //MARK: - UITableViewDelegate
    
    override func tableView(tableView: UITableView!, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath!) {
        self.performSegueWithIdentifier("Push To Space Data", sender: indexPath)
    }
    
    
    // MARK: - AddSpaceObjectViewControllerDelegate
    
    func didCancel() {
        println("Cancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addSpaceObject(spaceObject: SpaceObject) {
        self.addedSpaceObjects += spaceObject
        println("Add Space Object")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.tableView.reloadData()
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

}
