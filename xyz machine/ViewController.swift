//
//  ViewController.swift
//  xyz machine
//
//  Created by Özgün Yildiz on 26.03.21.
//

import UIKit
// Step 1: Implement the framework
import CoreMotion

class ViewController: UIViewController {
    
    // Step 2: Implement the outlets
    @IBOutlet weak var xLabel: UILabel!
    
    @IBOutlet weak var yLabel: UILabel!
    
    @IBOutlet weak var zLabel: UILabel!
    
    // Step 3: Create a CMMotionManager
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 4: Create an instance of the CMMotionManager
        motionManager = CMMotionManager()
        // Step5: Use "startAcceleromterUpdates" on your instance of CMMotionManager
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    // Step 6: Create a function that takes CMAccelerometerData and an error as parameters. Use a numberFormatter to format x,y,z so that it has less digits. Pass It into step 5
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        // Step 7: use guard let for the data becomes it comes as optional
        guard let accelerometerData = data else { return }
        // Step 8: Use NumberFormatter to have a max of 1 digit
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximum = 1

        // Step 9: Create the constants you want displayed on your view. Then, With the CMAccelerometerData you got in your function, grab x,y,z, put them in the formatter you created, and assign them to new constants.
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!

        // Step 10: Use string interpolation to create what you want to be displayed on the view
        
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
    }
    
    
    
}


