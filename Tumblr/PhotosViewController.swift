//
//  PhotosViewController.swift
//  Tumblr
//
//  Created by Hye Lim Joun on 1/31/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit
import AlamofireImage

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  
  // Property to store posts
  var posts: [[String: Any]] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    self.tableView.rowHeight = 200
    
    // Do any additional setup after loading the view.
    // Network request snippet
    let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
    let task = session.dataTask(with: url) { (data, response, error) in
      if let error = error {
        print(error.localizedDescription)
      } else if let data = data,
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
        print(dataDictionary)
        
        // Get the posts and store in posts property
        // Get the dictionary from the response key
        let responseDictionary = dataDictionary["response"] as! [String: Any]
        // Store the returned array of dictionaries in our posts property
        self.posts = responseDictionary["posts"] as! [[String: Any]]
        
        // Reload the table view
        self.tableView.reloadData()
      }
    }
    task.resume()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return posts.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
    
    // Get the post that corresponds to a particular cell's row
    let post = posts[indexPath.row]
    
    // Get the photos dictionary from the post
    if let photos = post["photos"] as? [[String: Any]] {
      // photos is NOT nil, we can use it!
      let photo = photos[0]
      let originalSize = photo["original_size"] as! [String: Any]
      let urlString = originalSize["url"] as! String
      let url = URL(string: urlString)
      cell.photoImageView.af_setImage(withURL: url!)
    }
    
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    
    // Get the index path from the cell that was tapped
    let indexPath = tableView.indexPathForSelectedRow
    // Get the Row of the Index Path and set as index
    let index = indexPath?.row
    // Get in touch with the DetailViewController
    if segue.identifier == "DetailSegue" {
      let detailViewController = segue.destination as! DetailViewController
      let selectedPost = posts[index!]
      // Pass on the data to the Detail ViewController
      detailViewController.post = selectedPost
    }
  }
}
