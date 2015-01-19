//
//  Director.swift
//  Director
//
//  Created by James Tang on 18/1/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class Director: NSObject {

    @IBInspectable var autoStart : Bool = false
    @IBOutlet var views : [UIView] = [UIView]() {
        didSet {
            if self.autoStart {
                self.start()
            }
        }
    }

    @IBOutlet var directors : [Director] = [Director]()

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
