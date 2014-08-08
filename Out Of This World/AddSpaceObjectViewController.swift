//
//  AddSpaceObjectViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/7/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

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
        self.delegate!.addSpaceObject()
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

protocol AddSpaceObjectViewControllerDelegate {
    func addSpaceObject()
    func didCancel()
}
