//
//  InterfaceController.swift
//  Basic Calc WatchKit Extension
//
//  Created by Mark Filter on 6/26/17.
//  Copyright © 2017 Mark Filter. All rights reserved.
//

import WatchKit
import Foundation


enum Mode {
    case Not_Set
    case Addition
    case Subtraction
}


class InterfaceController: WKInterfaceController {
    
    
    // MARK: - Outlet
    @IBOutlet var outputLabel: WKInterfaceLabel!
    var outputString: String = "0"
    var currentMode: Mode = .Not_Set
    var savedNumber: Int64 = 0
    var lastButtonTappedWasMode: Bool = false
    
    
    
    // MARK: - View Life Cycle Methods
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        outputLabel.setText(outputString);
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    // MARK: - Actions
    
    @IBAction func addButtonTapped() {
        changeMode(mode: .Addition)
    }
    
    
    @IBAction func subtractButtonTapped() {
        changeMode(mode: .Subtraction)
    }
    
    
    @IBAction func clearButtonTapped() {
        savedNumber = 0
        outputString = "0"
        outputLabel.setText(outputString)
        currentMode = .Not_Set
        lastButtonTappedWasMode = false 
    }
    
    
    @IBAction func equalsButtonTapped() {
        guard let number: Int64 = Int64(outputString) else {
            return
        }
        
        if currentMode == .Not_Set || lastButtonTappedWasMode {
            return
        }
        
        if currentMode == .Addition {
            savedNumber += number
        }
        else if currentMode == .Subtraction {
            savedNumber -= number
        }
        
        currentMode = .Not_Set
        outputString = String(savedNumber)
        updateOutputLabel()
        lastButtonTappedWasMode = true 
        
    }
    
    
    func changeMode(mode: Mode) {
        if savedNumber == 0 {
            return
        }
        currentMode = mode
        lastButtonTappedWasMode = true
    }
    
    
    
    
    func numberTapped(number: Int) {
        
        if lastButtonTappedWasMode {
            lastButtonTappedWasMode = false
            outputString = "0"
        }
        
        outputString.append(String(number))
        updateOutputLabel()
    }
    
    func updateOutputLabel() {
        guard let newValue = Int64(outputString) else {
            outputLabel.setText("Error: Number is too large")
            return
        }
        savedNumber = (currentMode == .Not_Set) ? newValue : savedNumber
        outputLabel.setText(String(newValue))
        
    }
    
    
    
    @IBAction func tapped0() {
        numberTapped(number: 0)
    }
    
    @IBAction func tapped1() {
        numberTapped(number: 1)
    }
    
    @IBAction func tapped2() {
        numberTapped(number: 2)
    }
    
    @IBAction func tapped3() {
        numberTapped(number: 3)
    }
    
    @IBAction func tapped4() {
        numberTapped(number: 4)
    }
    
    @IBAction func tapped5() {
        numberTapped(number: 5)
    }
    
    @IBAction func tapped6() {
        numberTapped(number: 6)
    }
    
    @IBAction func tapped7() {
        numberTapped(number: 7)
    }
    
    @IBAction func tapped8() {
        numberTapped(number: 8)
    }
    
    @IBAction func tapped9() {
        numberTapped(number: 9)
    }

}
