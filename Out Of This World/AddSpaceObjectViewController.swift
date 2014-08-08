//
//  AddSpaceObjectViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/7/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

protocol AddSpaceObjectViewControllerDelegate {
    func addSpaceObject(spaceObject: SpaceObject)
    func didCancel()
}

class AddSpaceObjectViewController: UIViewController {
    
    //MARK: - Properties
    var delegate: AddSpaceObjectViewControllerDelegate?
    
    //MARK: - IBOutlets
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var diameterTextField: UITextField!
    @IBOutlet var temperatureTextField: UITextField!
    @IBOutlet var numberOfMoonsTextField: UITextField!
    @IBOutlet var interestingFactTextField: UITextField!
    
    //MARK: - IBActions
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        self.delegate!.didCancel()
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        var newSpaceObject = self.returnNewSpaceObject()
        self.delegate!.addSpaceObject(newSpaceObject)
    }
    
    //MARK: - Overrides / viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var orionImage = UIImage(named: "Orion.jpg")
        self.view.backgroundColor = UIColor(patternImage: orionImage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Helper Methods
    
    private func returnNewSpaceObject() -> SpaceObject {
        var addedSpaceObject = SpaceObject()
        addedSpaceObject.name = self.nameTextField.text
        addedSpaceObject.nickname = self.nicknameTextField.text
        // extension String .toFloat()
        // addedSpaceObject.diameter = (self.diameterTextField.text as NSString).floatValue
        addedSpaceObject.diameter = self.diameterTextField.text.toFloat()
        addedSpaceObject.temperature = self.temperatureTextField.text.toFloat()
        addedSpaceObject.numberOfMoons = self.numberOfMoonsTextField.text.toInt()
        addedSpaceObject.interestingFact = self.interestingFactTextField.text
        addedSpaceObject.spaceImage = UIImage(named: "EinsteinRing.jpg")
        
        return addedSpaceObject
    }
}
