//
//  PhotoTakingHelper.swift
//  Instagram
//
//  Created by MacGihuuji on 3/24/2559 BE.
//  Copyright © 2559 MacGihuuji. All rights reserved.
//

import UIKit
typealias PhotoHelperTakingCallback = UIImage? -> Void

class PhotoTakingHelper: NSObject {
    //1. Present Action Sheet --> UIAlertController
    //2. Present the Camera or Photo libary --> UIimagePikerController
    //3. Return Image --> Callback Function
    
    weak var ViewController: UIViewController!
    var callback: PhotoHelperTakingCallback
    var imagePickerController: UIImagePickerController?
    
    init(ViewController: UIViewController, callback: PhotoHelperTakingCallback) {
        self.ViewController = ViewController
        self.callback = callback
        
        super.init()
        PhotoSourceSelection()
    }
    
    func showImagePickerController(sourceType: UIImagePickerControllerSourceType) {
        imagePickerController = UIImagePickerController()
        imagePickerController!.sourceType = sourceType
        imagePickerController!.delegate = self
        self.ViewController.presentViewController(imagePickerController!, animated: true, completion: nil)
    }
    
    func PhotoSourceSelection(){
        //Allow User to choose between camera and photo libary
        let alertController = UIAlertController(title: nil,message: "มึงจะทำอะไรไอ้กรวก",preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: .Cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        let photoLiberyAction = UIAlertAction(title: "รูปภาพจากคลังแสง", style: .Default){ (action) in
            self.showImagePickerController(.PhotoLibrary)
        }
        
        alertController.addAction(photoLiberyAction)
        
        //Only show camera
        if (UIImagePickerController.isCameraDeviceAvailable(.Rear)){
            let cameraAction = UIAlertAction(title: "Photo form camera", style: .Default){ (action) in
                self.showImagePickerController(.Camera)
            }
            
            alertController.addAction(cameraAction)
        }
        
        ViewController.presentViewController(alertController, animated: true, completion: nil)
    }
}

extension PhotoTakingHelper : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        ViewController.dismissViewControllerAnimated(false, completion: nil)
        callback(image)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        ViewController.dismissViewControllerAnimated(true, completion: nil)
    }
}