//
//  ViewController.swift
//  Instagram
//
//  Created by MacGihuuji on 3/3/2559 BE.
//  Copyright © 2559 MacGihuuji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
     @IBOutlet weak var selectUser: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectUser(sender: AnyObject){
        let kuma = Kumulos()
        kuma.selectUserWithUsername(selectUser.text)
        
    }


}

