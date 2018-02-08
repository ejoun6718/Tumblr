
//
//  PhotoDetailsViewController.swift
//  Tumblr
//
//  Created by Hye Lim Joun on 2/7/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

  @IBOutlet weak var photoImageView: UIImageView!
  
  public var photoURL = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: photoURL)!
        photoImageView.af_setImage(withURL: url)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
