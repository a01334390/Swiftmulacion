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
    
    /** M/M/s fields */
    @IBOutlet weak var lambdamms: NSTextField!
    @IBOutlet weak var miumms: NSTextField!
    @IBOutlet weak var smms: NSTextField!
    
    /** M/M/s/K fields */
    @IBOutlet weak var lambdammsk: NSTextField!
    @IBOutlet weak var miummsk: NSTextField!
    @IBOutlet weak var smmsk: NSTextField!
    @IBOutlet weak var kmmsk: NSTextField!
    
    /** M/G/1 fields */
    @IBOutlet weak var lambdamg1: NSView!
    @IBOutlet weak var miumg1: NSTextField!
    @IBOutlet weak var estdvmg1: NSTextField!
    
    /** M/D/1 fields */
    @IBOutlet weak var lambdamd1: NSTextField!
    @IBOutlet weak var miumd1: NSTextField!
    @IBOutlet weak var smd1: NSTextField!
    
    /** M/Ek/1 fields */
    @IBOutlet weak var lambdamek1: NSTextField!
    @IBOutlet weak var miumek1: NSTextField!
    @IBOutlet weak var nmek1: NSTextFieldCell!
    @IBOutlet weak var kmek1: NSTextField!
    
    /** M/M/1 Answer Fields */
    @IBOutlet weak var romm1: NSTextField!
    @IBOutlet weak var lqmm1: NSTextField!
    @IBOutlet weak var lmm1: NSTextField!
    @IBOutlet weak var wqmm1: NSTextField!
    @IBOutlet weak var wmm1: NSTextField!
    
    /** M/M/s Answer fields */
    @IBOutlet weak var romms: NSTextField!
    @IBOutlet weak var lqmms: NSTextField!
    @IBOutlet weak var lmms: NSTextField!
    @IBOutlet weak var wqmms: NSTextField!
    @IBOutlet weak var wmms: NSTextField!
    
     /** M/M/s/K Answer fields */
    @IBOutlet weak var rommsk: NSTextField!
    @IBOutlet weak var lqmmsk: NSTextField!
    @IBOutlet weak var lmmsk: NSTextField!
    @IBOutlet weak var wqmmsk: NSTextField!
    @IBOutlet weak var wmmsk: NSTextField!
    
    /** M/G/1 Answer fields */
    @IBOutlet weak var romg1: NSTextField!
    @IBOutlet weak var lqmg1: NSTextField!
    @IBOutlet weak var lmg1: NSTextField!
    @IBOutlet weak var wqmg1: NSTextField!
    @IBOutlet weak var wmg1: NSTextField!
    
    /** M/D/1 Answer fields */
    @IBOutlet weak var romd1: NSTextField!
    @IBOutlet weak var lqmd1: NSTextField!
    @IBOutlet weak var lmd1: NSTextField!
    @IBOutlet weak var wqmd1: NSTextField!
    @IBOutlet weak var wmd1: NSTextField!
    
    
    /** M/Ek/1 Answer fields */
    @IBOutlet weak var romek1: NSTextField!
    @IBOutlet weak var lqmek1: NSTextField!
    @IBOutlet weak var lmek1: NSTextField!
    @IBOutlet weak var wqmek1: NSTextField!
    @IBOutlet weak var wmek1: NSTextField!
    
    
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
    
    @IBAction func calculateMMS(_ sender: Any) {
        let lambda = lambdamms.doubleValue
        let miu = miumms.doubleValue
        let s = smms.integerValue
        
        let calculation = StackCalculator.mms(lambda,miu,s)
        
        romms.stringValue =  "𝜌: \(calculation.0)"
        lqmms.stringValue = "Lq: \(calculation.1)"
        lmms.stringValue = "L:\(calculation.2)"
        wqmms.stringValue = "Wq: \(calculation.3)"
        wmms.stringValue = "W: \(calculation.4)"
    }
    
    @IBAction func calculateMMSK(_ sender: Any) {
        let lambda = lambdammsk.doubleValue
        let miu = miummsk.doubleValue
        let s = smmsk.integerValue
        let k = kmmsk.integerValue
        
        let calculation = StackCalculator.mmsk(lambda,miu,s,k)
        
        rommsk.stringValue =  "𝜌: \(calculation.0)"
        lqmmsk.stringValue = "Lq: \(calculation.1)"
        lmmsk.stringValue = "L:\(calculation.2)"
        wqmmsk.stringValue = "Wq: \(calculation.3)"
        wmmsk.stringValue = "W: \(calculation.4)"
    }
    
    @IBAction func calculateMG(_ sender: Any) {
        
    }
    
    @IBAction func calculateMD1(_ sender: Any) {
    }
    
    @IBAction func calculateMEK(_ sender: Any) {
    }
    
    /**
     Crea una notificación para el Notification Center
     - Parameters:
        -title: (String) El titulo de la notificacion
        -subtitle: (String) El subtitulo de la notificacion
        -informativeText: (String) Texto informativo
    */
    func createNotification(_ title:String, _ subtitle:String, _ informativeText:String ){
        // Create the notification and setup information
        let notification = NSUserNotification()
        notification.identifier = UUID().uuidString
        notification.title = title
        notification.subtitle = subtitle
        notification.informativeText = informativeText
        notification.soundName = NSUserNotificationDefaultSoundName
        // Manually display the notification
        let notificationCenter = NSUserNotificationCenter.default
        notificationCenter.deliver(notification)
    }
    
    
}

