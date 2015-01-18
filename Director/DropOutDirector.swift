//
//  DropOutDirector.swift
//  Director
//
//  Created by James Tang on 18/1/15.
//  Copyright (c) 2015 James Tang. All rights reserved.
//

import UIKit

class DropOutDirector: Director {

    @IBOutlet var referenceView : UIView?
    @IBOutlet var animator : UIDynamicAnimator?

    var originalCenter = [CGPoint]()

    override func start() {

        if let referenceView = self.referenceView {

            self.animator = UIDynamicAnimator(referenceView: referenceView)

            self.originalCenter.removeAll(keepCapacity: false)
            for view in self.views {
                self.originalCenter.append(view.center)
            }

            if let animator = self.animator {
                let gravity = UIGravityBehavior(items: self.views)
                gravity.magnitude = 6
                animator.addBehavior(gravity);

                gravity.action = {

                    var hasOnScreenViews = false
                    for view in self.views {
                        if CGRectIntersectsRect(view.frame, referenceView.bounds) {
                            hasOnScreenViews = true
                            break
                        }
                    }

                    if !hasOnScreenViews {
                        self.stop()
                    }

                }
            }


        }
    }



    override func stop() {
        self.animator = nil
        for (index, view) in enumerate(self.views) {
            view.center = self.originalCenter[index]
        }
    }


}
