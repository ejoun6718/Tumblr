//
//  DetailViewController.swift
//  Tumblr
//
//  Created by Hye Lim Joun on 2/4/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var photoImageView: UIImageView!
  var post: [String: Any]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    if let photos = post!["photos"] as? [[String: Any]] {
      // photos is NOT nil, we can use it!
      let photo = photos[0]
      let originalSize = photo["original_size"] as! [String: Any]
      let urlString = originalSize["url"] as! String
      let url = URL(string: urlString)
      photoImageView.af_setImage(withURL: url!)
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
