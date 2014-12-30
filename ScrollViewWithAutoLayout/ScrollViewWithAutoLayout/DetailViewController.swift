//
//  DetailViewController.swift
//  ScrollViewWithAutoLayout
//
//  Created by wwwins on 2014/12/23.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //loadImage("http://lorempixel.com/400/400/cats/")
        loadImageWithCompletion("http://lorempixel.com/400/400/cats/", completionHandler: { (imageData) -> () in
          self.imageView.image = UIImage(data: imageData)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadImage(urlString:NSString) {
      let loadURL = NSURL(string: urlString)
      var image: UIImage?
      var request: NSURLRequest = NSURLRequest(URL: loadURL!)
      
      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        image = UIImage(data: data)
        self.imageView.image = image
        self.activityIndicator.stopAnimating()
      })
    }
  
    func loadImageWithCompletion(urlString:NSString, completionHandler: (NSData) -> ()) {
      let loadURL = NSURL(string: urlString)
      var image: UIImage?
      var request: NSURLRequest = NSURLRequest(URL: loadURL!)
      
      NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: {(response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
        self.activityIndicator.stopAnimating()
        if ((error) != nil) {
          return
        }
        completionHandler(data)
      })
    }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
