//
//  ViewController.swift
//  DemoTimer
//
//  Created by Mukundraj on 24/09/19.
//  Copyright © 2019 Mukundraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func btnStart(_ sender: Any) {
    
        self.bgTimer()
    }
    func bgTimer(){
        BackgroundTask.run(application: UIApplication.shared) { (task) in
            myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(callAPI), userInfo: nil, repeats: true)
            RunLoop.init().add(myTimer, forMode: .tracking)
        }
    }
    
    @objc func callAPI(){
        //todo check app state
        //if app terminated mode invalidate timer
        print("going to print....")
    }
    

}

class BackgroundTask {
    
    var applications = UIApplication.shared
    var identifier: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid
    
    init(application: UIApplication) {
        applications = application
    }
    
    class func run(application: UIApplication, handler: (BackgroundTask) -> ()) {
        let backgroundTask = BackgroundTask(application: application)
        backgroundTask.begin()
        handler(backgroundTask)
    }
    
    func begin() {
        identifier = applications.beginBackgroundTask(expirationHandler: {
        })
    }
    
}
