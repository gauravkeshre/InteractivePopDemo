//
//  ViewController.swift
//  InteractivePopDemo
//
//  Created by Gaurav Keshre on 15/04/17.
//  Copyright © 2017 Zoomcar. All rights reserved.
//

import UIKit

class MasterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}


class DetailVC: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UIGestureRecognizerDelegate Methods
    //--------------------------
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        guard gestureRecognizer.isEqual(self.navigationController?.interactivePopGestureRecognizer) else{ return true }
        
        /** This is our interactive pop gesture */
        let pointofTouch = gestureRecognizer.location(in: self.view)
        
        /** This logic may change a bit for accomodating your use case. But I just want to disable interactive pop for bottom half of the screen*/
        let isTouchInBottomHalf = (pointofTouch.y >= self.view.bounds.height / 2)
        return !isTouchInBottomHalf
    }
}
