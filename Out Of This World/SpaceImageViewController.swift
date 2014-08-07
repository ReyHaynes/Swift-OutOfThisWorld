//
//  SpaceImageViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/7/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class SpaceImageViewController: UIViewController, UIScrollViewDelegate {
    
    //MARK: - IBOutlets
    
    @IBOutlet var scrollView: UIScrollView!
    
    //MARK: - Properties
    
    var imageView: UIImageView?
    
    
    //MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView = UIImageView(image: UIImage(named: "Jupiter.jpg"))
        
        self.scrollView.contentSize = self.imageView!.frame.size
        self.scrollView.addSubview(self.imageView!)
        
        self.scrollView.delegate = self
        self.scrollView.maximumZoomScale = 1.5
        self.scrollView.minimumZoomScale = 0.5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - ScrollView
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        
        return self.imageView
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
