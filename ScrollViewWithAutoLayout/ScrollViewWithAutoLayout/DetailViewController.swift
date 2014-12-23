//
//  DetailViewController.swift
//  ScrollViewWithAutoLayout
//
//  Created by wwwins on 2014/12/23.
//  Copyright (c) 2014年 isobar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      if let img = loadImage("http://lorempixel.com/400/400/cats/") as UIImage? {
        imageView.image = img
      }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func loadImage(urlString:NSString) -> UIImage? {
      let loadURL = NSURL(string: urlString)
      if let image = UIImage(data: NSData(contentsOfURL: loadURL!)!) {
        return image
      }
      return nil
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
