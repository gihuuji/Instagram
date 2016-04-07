//
//  TimelineViewController.swift
//  Instagram
//
//  Created by MacGihuuji on 3/24/2559 BE.
//  Copyright © 2559 MacGihuuji. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    var photoTakingHelper: PhotoTakingHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func takePhoto() {
        photoTakingHelper = PhotoTakingHelper(ViewController: self.tabBarController!){ (image: UIImage?) in
            print("Recive Callback")
            if let image = image {
                let kuma = Kumulos()
                let imageNSData = UIImageJPEGRepresentation(image, 1)
                kuma.uploadPhotoWithImageData(imageNSData, andPostData: 1)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

//MARK: Tab bar delegate

extension TimelineViewController: UITabBarControllerDelegate{
    func tabBarController(tabBarController: UITabBarController,
                          shouldSelectViewController viewController: UIViewController) -> Bool{
        if (viewController is PhotoViewController){
            print("Take Photo")
            takePhoto()
            return false
        } else{
            return true
        }
    }
}

