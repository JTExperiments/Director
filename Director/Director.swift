//
//  Director.swift
//  Director
//
//  Created by James Tang on 18/1/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class Director: NSObject {

    @IBOutlet var views : [UIView] = [UIView]()
    @IBOutlet var directors : [Director] = [Director]()

    @IBInspectable var autoStart : Bool = false

    override func awakeFromNib() {
        if self.autoStart {
            self.start()
        }
    }

    func start() {
        
    }

    internal func complete() {
        for director in self.directors {
            director.start()
        }
    }

    internal func stop() {
    }
}
