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
    @IBOutlet weak var lambdamg1: NSTextField!
    @IBOutlet weak var miumg1: NSTextField!
    @IBOutlet weak var estdvmg1: NSTextField!
    
    /** M/D/1 fields */
    @IBOutlet weak var lambdamd1: NSTextField!
    @IBOutlet weak var miumd1: NSTextField!
    
    /** M/Ek/1 fields */
    @IBOutlet weak var lambdamek1: NSTextField!
    @IBOutlet weak var miumek1: NSTextField!
    @IBOutlet weak var kmek1: NSTextField!
    
    /** M/M/1 Answer Fields */
    @IBOutlet weak var romm1: NSTextField!
    @IBOutlet weak var lqmm1: NSTextField!
    @IBOutlet weak var lmm1: NSTextField!
    @IBOutlet weak var wqmm1: NSTextField!
    @IBOutlet weak var wmm1: NSTextField!
    @IBOutlet weak var costomm1: NSTextField!
    
    /** M/M/s Answer fields */
    @IBOutlet weak var romms: NSTextField!
    @IBOutlet weak var lqmms: NSTextField!
    @IBOutlet weak var lmms: NSTextField!
    @IBOutlet weak var wqmms: NSTextField!
    @IBOutlet weak var wmms: NSTextField!
    @IBOutlet weak var costomms: NSTextField!
    
     /** M/M/s/K Answer fields */
    @IBOutlet weak var rommsk: NSTextField!
    @IBOutlet weak var lqmmsk: NSTextField!
    @IBOutlet weak var lmmsk: NSTextField!
    @IBOutlet weak var wqmmsk: NSTextField!
    @IBOutlet weak var wmmsk: NSTextField!
    @IBOutlet weak var costommsk: NSTextField!
    
    /** M/G/1 Answer fields */
    @IBOutlet weak var romg1: NSTextField!
    @IBOutlet weak var lqmg1: NSTextField!
    @IBOutlet weak var lmg1: NSTextField!
    @IBOutlet weak var wqmg1: NSTextField!
    @IBOutlet weak var wmg1: NSTextField!
    @IBOutlet weak var costomg1: NSTextField!
    
    /** M/D/1 Answer fields */
    @IBOutlet weak var romd1: NSTextField!
    @IBOutlet weak var lqmd1: NSTextField!
    @IBOutlet weak var lmd1: NSTextField!
    @IBOutlet weak var wqmd1: NSTextField!
    @IBOutlet weak var wmd1: NSTextField!
    @IBOutlet weak var costomd1: NSTextField!
    
    /** M/Ek/1 Answer fields */
    @IBOutlet weak var romek1: NSTextField!
    @IBOutlet weak var lqmek1: NSTextField!
    @IBOutlet weak var lmek1: NSTextField!
    @IBOutlet weak var wqmek1: NSTextField!
    @IBOutlet weak var wmek1: NSTextField!
    @IBOutlet weak var costomek1: NSTextField!
    
    /** Cs Cw*/
    @IBOutlet weak var cwLabel: NSTextField!
    @IBOutlet weak var csLabel: NSTextField!
    
    /** Warning messages */
    let messages:[String] = [
        "El valor de λ debe ser mayor a cero",
        "El valor de µ debe ser mayor a cero",
        "El valor de s debe ser mayor a cero",
        "El valor de k debe ser mayor a cero"
    ]
    
    
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
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdamm1.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidad", messages[1]) {
                miumm1.stringValue = ""
                return
            }
        }
        
        let calculation = StackCalculator.mm1(lambda, miu)
        
        romm1.stringValue =  "𝜌: \(calculation.0)"
        lqmm1.stringValue = "Lq: \(calculation.1)"
        lmm1.stringValue = "L: \(calculation.2)"
        wqmm1.stringValue = "Wq: \(calculation.3)"
        wmm1.stringValue = "W: \(calculation.4)"
        costomm1.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, 1))"
    }
    
    @IBAction func calculateMMS(_ sender: Any) {
        let lambda = lambdamms.doubleValue
        let miu = miumms.doubleValue
        let s = smms.integerValue
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdamms.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidado", messages[1]) {
                miumms.stringValue = ""
                return
            }
        }
        
        if s <= 0 {
            if dialogOK("Cuidado", messages[2]){
                smms.stringValue = ""
                return
            }
        }
        
        
        let calculation = StackCalculator.mms(lambda,miu,s)
        
        romms.stringValue =  "𝜌: \(calculation.0)"
        lqmms.stringValue = "Lq: \(calculation.1)"
        lmms.stringValue = "L: \(calculation.2)"
        wqmms.stringValue = "Wq: \(calculation.3)"
        wmms.stringValue = "W: \(calculation.4)"
        costomms.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, Double(s)))"
    }
    
    @IBAction func calculateMMSK(_ sender: Any) {
        let lambda = lambdammsk.doubleValue
        let miu = miummsk.doubleValue
        let s = smmsk.integerValue
        let k = kmmsk.integerValue
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdammsk.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidado", messages[1]) {
                miummsk.stringValue = ""
                return
            }
        }
        
        if s <= 0 {
            if dialogOK("Cuidado", messages[2]){
                smmsk.stringValue = ""
                return
            }
        }
        
        if k <= 0 {
            if dialogOK("Cuidado", messages[3]) {
                kmmsk.stringValue = ""
            }
        }
        
        let calculation = StackCalculator.mmsk(lambda,miu,s,k)
        
        rommsk.stringValue =  "𝜌: \(calculation.0)"
        lqmmsk.stringValue = "Lq: \(calculation.1)"
        lmmsk.stringValue = "L: \(calculation.2)"
        wqmmsk.stringValue = "Wq: \(calculation.3)"
        wmmsk.stringValue = "W: \(calculation.4)"
        costommsk.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, Double(s)))"
    }
    
    @IBAction func calculateMG(_ sender: Any) {
        let lambda = lambdamg1.doubleValue
        let miu =  miumg1.doubleValue
        let estd =  estdvmg1.doubleValue
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdamg1.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidado", messages[1]) {
                miumg1.stringValue = ""
                return
            }
        }
        
        if estd <= 0 {
            if dialogOK("Cuidado", "El valor de la desviación estandar debe ser mayor a cero") {
                estdvmg1.stringValue = ""
                return
            }
        }
        
        let calculation = StackCalculator.mg1(lambda, miu, estd)
        
        romg1.stringValue =  "𝜌: \(calculation.0)"
        lqmg1.stringValue = "Lq: \(calculation.1)"
        lmg1.stringValue = "L: \(calculation.2)"
        wqmg1.stringValue = "Wq: \(calculation.3)"
        wmg1.stringValue = "W: \(calculation.4)"
        costomg1.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, 1))"
    }
    
    @IBAction func calculateMD1(_ sender: Any) {
        let lambda = lambdamd1.doubleValue
        let miu = miumd1.doubleValue
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdamd1.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidado", messages[1]) {
                miumd1.stringValue = ""
                return
            }
        }
        
        let calculation = StackCalculator.md1(lambda, miu)
        
        romd1.stringValue =  "𝜌: \(calculation.0)"
        lqmd1.stringValue = "Lq: \(calculation.1)"
        lmd1.stringValue = "L: \(calculation.2)"
        wqmd1.stringValue = "Wq: \(calculation.3)"
        wmd1.stringValue = "W: \(calculation.4)"
        costomd1.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, 1))"
    }
    
    @IBAction func calculateMEK(_ sender: Any) {
        let lambda = lambdamek1.doubleValue
        let miu = miumek1.doubleValue
        let k = kmek1.doubleValue
        
        if lambda <= 0 {
            if dialogOK("Cuidado", messages[0]) {
                lambdamek1.stringValue = ""
                return
            }
        }
        
        if miu <= 0 {
            if dialogOK("Cuidado", messages[1]) {
                miumek1.stringValue = ""
                return
            }
        }
        
        if lambda >= miu {
            if dialogOK("Cuidado", "El valor de µ debe ser mayor al valor de λ") {
                miumek1.stringValue = ""
                lambdamek1.stringValue = ""
            }
        }
        
        if k <= 0 {
            if dialogOK("Cuidado", messages[3]) {
                kmek1.stringValue = ""
            }
        }
        
        let calculation = StackCalculator.mek1(lambda, miu, k)
        
        romek1.stringValue =  "𝜌: \(calculation.0)"
        lqmek1.stringValue = "Lq: \(calculation.1)"
        lmek1.stringValue = "L: \(calculation.2)"
        wqmek1.stringValue = "Wq: \(calculation.3)"
        wmek1.stringValue = "W: \(calculation.4)"
        costomek1.stringValue = "Costo Total: \(calculateTotalCost(calculation.1, 1))"
    }
    
    /**
     Crea un dialogo normal
    */
    func dialogOK(_ question: String,_ text: String) -> Bool {
        let alert = NSAlert()
        alert.messageText = question
        alert.informativeText = text
        alert.alertStyle = .warning
        alert.addButton(withTitle: "OK")
        return alert.runModal() == .alertFirstButtonReturn
    }
    
    /**
     Crea una notificación para el Notification Center
     - Parameters:
            - title: (String) El titulo de la notificacion
            - subtitle: (String) El subtitulo de la notificacion
            - informativeText: (String) Texto informativo
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
    
    /**
     Calcula el costo total
    */
    func calculateTotalCost(_ lq:Double, _ s:Double) -> Double{
        if cwLabel.doubleValue < 0 || csLabel.doubleValue < 0{
            if dialogOK("Cuidado", "Los valores del costo no pueden ser menores a cero") {
                cwLabel.stringValue = ""
                csLabel.stringValue = ""
                return 0.0
            }
        }
        return lq*cwLabel.doubleValue + s*csLabel.doubleValue
    }
    
    
}

