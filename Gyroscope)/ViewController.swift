//
//  ViewController.swift
//  Gyroscope)
//
//  Created by Quix Creations Singapore iOS 1 on 23/8/15.
//  Copyright (c) 2015 Terry Chia. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    var cuurentMaxAccelX : Double = 0.0
    var currentMaxAccelY : Double = 0.0
    var cuurentMaxAcceZ : Double = 0.0
    var currentMaxRotX : Double = 0.0
    var currentMaxRotY : Double = 0.0
    var currentMaxRotZ : Double = 0.0
    
    var motionManager = CMMotionManager()

    @IBOutlet var accX: UILabel!
    @IBOutlet var accY: UILabel!
    @IBOutlet var accZ: UILabel!
    @IBOutlet var maxAccX: UILabel!
    @IBOutlet var maxAccY: UILabel!
    @IBOutlet var MaxAccZ: UILabel!
    @IBOutlet var rotX: UILabel!
    @IBOutlet var rotY: UILabel!
    @IBOutlet var rotZ: UILabel!
    @IBOutlet var maxRotX: UILabel!
    @IBOutlet var maxRotY: UILabel!
    @IBOutlet var maxRotZ: UILabel!
    
    
    override func viewDidLoad() {
        
        self.resetMaxValues()
        
        //set motion manager properties
        motionManager.accelerometerUpdateInterval = 0.2
        motionManager.gyroUpdateInterval = 0.2
        
        

        //start recording data
//        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler: {
//            (accelerometerData: CMAccelerometerData!,error:NSError!) -> Void in
//            self.outputAccelerationData(accelerometerData.acceleration)
//            if(error != nil) {
//                print("\(error)")
//            }
//        })
        
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: {
                (accelerometerData,error) in
                self.outputAccelerationData(accelerometerData!.acceleration)
                if(error != nil) {
                    print("\(error)")
                }
            })

        
//        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue(), withHandler:
//            { (gyroData: CMGyroData!, error: NSError!) -> Void in
//            self.outputRotationData(gyroData.rotationRate)
//            if(error != nil){
//                print("\(error)")
//            }
//        })
        
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler:
            { (gyroData, error) in
                self.outputRotationData(gyroData!.rotationRate)
                if(error != nil){
                    print("\(error)")
                }
        })
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func outputAccelerationData(acceleration : CMAcceleration){
        
        accX?.text = "\(acceleration.x).2fg"
        
        //checking for the max vaules
        if fabs(acceleration.x) > fabs(cuurentMaxAccelX)
        {
            cuurentMaxAccelX = acceleration.x
        }
        
        accY?.text = "\(acceleration.y).2fg"
        
        if fabs(acceleration.y) > fabs(currentMaxAccelY)
        {
            currentMaxAccelY = acceleration.y
        }
        
        accZ?.text = "\(acceleration.z).2fg"
        
        if fabs(acceleration.z) > fabs(cuurentMaxAcceZ)
        {
            cuurentMaxAcceZ = acceleration.z
        }
        
        maxAccX?.text = "\(cuurentMaxAccelX) .2f"
        maxAccY?.text = "\(currentMaxAccelY) .2f"
        MaxAccZ?.text = "\(cuurentMaxAcceZ) .2f"
        
    }
    
    func outputRotationData(rotation : CMRotationRate){
        
        rotX?.text = "\(rotation.x).2fr/s"
        
        //check for the highest values
        if fabs(rotation.x) > fabs(currentMaxRotX){
            currentMaxRotX = rotation.x
        }
        
        rotY?.text = "\(rotation.y).2fr/s"
        
        if fabs(rotation.y) > fabs(currentMaxRotY){
            currentMaxRotY = rotation.y
        }
        
        rotZ?.text = "\(rotation).2fr/s"
        
        if fabs(rotation.z) > fabs(currentMaxRotZ){
            currentMaxRotZ = rotation.z
        }
        
        maxRotX?.text = "\(currentMaxRotX) .2f"
        maxRotY?.text = "\(currentMaxRotY) .2f"
        maxRotZ?.text = "\(currentMaxRotZ) .2f"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetMaxValues() {
        
        cuurentMaxAccelX = 0
        currentMaxAccelY = 0
        cuurentMaxAcceZ = 0
        
        currentMaxRotX = 0
        currentMaxRotY = 0
        currentMaxRotZ = 0
        
    }

}

