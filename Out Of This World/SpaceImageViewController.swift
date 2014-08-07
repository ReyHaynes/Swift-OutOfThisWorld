//
//  SpaceImageViewController.swift
//  Out Of This World
//
//  Created by Reinaldo Haynes on 8/7/14.
//  Copyright (c) 2014 Reinaldo Haynes. All rights reserved.
//

import UIKit

class SpaceImageViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    
    
    var imageView: UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView = UIImageView(image: UIImage(named: "Jupiter.jpg"))
        
        self.scrollView.contentSize = self.imageView!.frame.size
        self.scrollView.addSubview(self.imageView)
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
