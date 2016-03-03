//
//  PostImageViewController.swift
//  Pics
//
//  Created by Muin Momin on 2/29/16.
//  Copyright © 2016 Muin. All rights reserved.
//

import UIKit

class PostImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageToShare: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
            self.dismissViewControllerAnimated(true, completion: nil)
            print(originalImage)
            print(editedImage)
            UserMedia.postUserImage(editedImage, withCaption: "\(captionTextField.text!)") { (success: Bool, error: NSError?) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
    }

    @IBAction func onShareImage() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
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
