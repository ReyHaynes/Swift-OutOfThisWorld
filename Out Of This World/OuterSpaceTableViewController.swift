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
    
    let ADDED_SPACE_OBJECTS_KEY = "Added Space Objects Array"
    
    var planets = [SpaceObject]()
    var addedSpaceObjects = [SpaceObject]()
    
    var userDefaults = NSUserDefaults.standardUserDefaults()
    
    
    // MARK: - Overrides / viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for planetData in AstronomicalData.allKnownPlanets() {
            var imageName = "\(planetData[PLANET_NAME]).jpg"
            var planet = SpaceObject(initWithData: planetData as NSDictionary, andImage: UIImage(named: imageName))
            self.planets += [planet]
        }
        
        if let spaceList = self.userDefaults.arrayForKey(ADDED_SPACE_OBJECTS_KEY) {
            for spaceObjectItem in spaceList {
                self.addedSpaceObjects += self.spaceObjectForDictionary(spaceObjectItem)
            }
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
    
    
    //MARK: - AddSpaceObjectViewControllerDelegate
    
    func didCancel() {
        println("Cancel")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addSpaceObject(spaceObject: SpaceObject) {
        self.addedSpaceObjects += spaceObject
        var spaceList = [AnyObject]()
        var spaceObjectProperty = self.spaceObjectAsPropertyList(spaceObject)
        if let spaceListArray = self.userDefaults.arrayForKey(ADDED_SPACE_OBJECTS_KEY) {
            spaceList = spaceListArray + [spaceObjectProperty]
        }
        else {
            spaceList = [spaceObjectProperty]
        }
        
        self.userDefaults.setObject(spaceList, forKey: ADDED_SPACE_OBJECTS_KEY)
        self.userDefaults.synchronize()
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        self.tableView.reloadData()
    }
    
    //MARK: - Helper Methods
    
    func spaceObjectAsPropertyList(spaceObject: SpaceObject) -> [String: AnyObject] {
        var dictionary: [String: AnyObject] = [:]
        if let item = spaceObject.name { dictionary[PLANET_NAME] = item }
        if let item = spaceObject.gravitationalForce { dictionary[PLANET_GRAVITY] = item }
        if let item = spaceObject.diameter { dictionary[PLANET_DIAMETER] = item }
        if let item = spaceObject.yearLength { dictionary[PLANET_YEAR_LENGTH] = item }
        if let item = spaceObject.dayLength { dictionary[PLANET_DAY_LENGTH] = item }
        if let item = spaceObject.temperature { dictionary[PLANET_TEMPERATURE] = item }
        if let item = spaceObject.numberOfMoons { dictionary[PLANET_NUMBER_OF_MOONS] = item }
        if let item = spaceObject.nickname { dictionary[PLANET_NICKNAME] = item }
        if let item = spaceObject.interestingFact { dictionary[PLANET_INTERESTING_FACT] = item }
        //TODO: - Uncomment to save image to propertylist
//        if let item = spaceObject.spaceImage { dictionary[PLANET_IMAGE] = UIImagePNGRepresentation(item) }
        
        return dictionary
    }
    
    func spaceObjectForDictionary(dictionary: AnyObject) -> SpaceObject {
        var spaceObject = SpaceObject(initWithData: dictionary as NSDictionary, andImage: UIImage(named: "EinsteinRing.jpg"))
        return spaceObject
    }
    
}
