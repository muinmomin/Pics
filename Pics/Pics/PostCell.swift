//
//  PostCell.swift
//  Pics
//
//  Created by Muin Momin on 2/29/16.
//  Copyright © 2016 Muin. All rights reserved.
//

import UIKit
import Parse

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var captionText: UILabel!
    
    var postPic: PFFile? {
        didSet {
            print(postPic)
            postPic?.getDataInBackgroundWithBlock({ (data: NSData?, error: NSError?) -> Void in
                if error == nil {
                    self.postImage.image = UIImage(data: data!)!
                }
                else {
                    print(error?.localizedDescription)
                }
            })
        }
    }
    var caption: String? {
        didSet {
            captionText.text = caption
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
