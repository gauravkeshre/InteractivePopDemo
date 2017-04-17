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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK:- UIGestureRecognizerDelegate Methods
    //--------------------------
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {

        /** We want to intercept the gesture only in case it is `interactivePopGestureRecognizer` */

        guard gestureRecognizer.isEqual(self.navigationController?.interactivePopGestureRecognizer) else{ return true }
        
        /** This logic may change a bit for accomodating your use case. But I just want to disable interactive pop for bottom half of the screen*/
        
        let pointofTouch = gestureRecognizer.location(in: self.view)
        
        let isTouchInBottomHalf = (pointofTouch.y >= self.view.bounds.height / 2)
        
        return !isTouchInBottomHalf
        
    }
}



class DetailTVC: UITableViewController, UIGestureRecognizerDelegate{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }

    
    //MARK:- UIGestureRecognizerDelegate Methods
    //--------------------------
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        /** We want to intercept the gesture only in case it is `interactivePopGestureRecognizer` */
        
        guard gestureRecognizer.isEqual(self.navigationController?.interactivePopGestureRecognizer) else{ return true }
        
        /** This logic may change a bit for accomodating your use case. But I just want to disable interactive pop for bottom half of the screen*/
        
        let pointofTouch = gestureRecognizer.location(in: self.view)
        
        let indexPath = IndexPath(row: 3, section: 0)
        let rect = tableView.rectForRow(at: indexPath)
        
        if rect.contains(pointofTouch){
            print("trying to swipe on scrollable content")
            return false
        }else{
            print("it's okay")
            return true
        }
        
        let isTouchInBottomHalf = (pointofTouch.y >= self.view.bounds.height / 2)
        
        return !isTouchInBottomHalf
        
    }
}
