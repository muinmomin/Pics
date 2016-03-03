//
//  ViewController.swift
//  Pics
//
//  Created by Muin Momin on 2/28/16.
//  Copyright © 2016 Muin. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var posts: NSArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let predicate = NSPredicate(format: "likesCount >= 0")
        let query = PFQuery(className: "UserMedia", predicate: predicate)
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                self.posts = media
                self.tableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        }
        else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PostsCellRI", forIndexPath: indexPath) as! PostCell
        cell.postPic = posts![indexPath.row]["media"] as? PFFile
        cell.caption = posts![indexPath.row]["caption"] as? String
        return cell
    }
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    

    @IBAction func onLogout() {
        PFUser.logOut()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    

}

