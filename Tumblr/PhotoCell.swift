//
//  PhotoCell.swift
//  Tumblr
//
//  Created by Hye Lim Joun on 2/3/18.
//  Copyright © 2018 hyelim. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {
  
  @IBOutlet weak var photoImageView: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell") as! PhotoCell
    
    // Configure YourCustomCell using the outlets that you've defined.
    
    return cell
  }

}
