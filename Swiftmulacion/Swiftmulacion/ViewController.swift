//
//  ViewController.swift
//  Swiftmulacion
//
//  Created by Fernando Martin Garcia Del Angel on 4/15/19.
//  Copyright © 2019 Fernando Martin Garcia Del Angel. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    /** M/M/1 fields */
    @IBOutlet weak var lambdamm1: NSTextField!
    @IBOutlet weak var miumm1: NSTextField!
    /** M/M/1 Answer Fields */
    @IBOutlet weak var romm1: NSTextField!
    @IBOutlet weak var lqmm1: NSTextField!
    @IBOutlet weak var lmm1: NSTextField!
    @IBOutlet weak var wqmm1: NSTextField!
    @IBOutlet weak var wmm1: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func calculateMM1(_ sender: Any) {
        let lambda = lambdamm1.doubleValue
        let miu = miumm1.doubleValue
        
        let calculation = StackCalculator.mm1(lambda, miu)
        
        romm1.stringValue =  "𝜌: \(calculation.0)"
        lqmm1.stringValue = "Lq: \(calculation.1)"
        lmm1.stringValue = "L:\(calculation.2)"
        wqmm1.stringValue = "Wq: \(calculation.3)"
        wmm1.stringValue = "W: \(calculation.4)"
    }
    


}

