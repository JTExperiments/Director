//
//  ViewController.swift
//  Director
//
//  Created by James Tang on 18/1/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slideInDirector: SlideInFromLeftDirector!
    @IBOutlet var dropOutDirector: DropOutDirector!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startButtonDidPress(sender: AnyObject) {
        self.slideInDirector.start()
    }

    @IBAction func dropButtonDidPress(sender: AnyObject) {
        self.dropOutDirector.start()
    }

}

