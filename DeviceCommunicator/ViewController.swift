//
//  ViewController.swift
//  DeviceCommunicator
//
//  Created by Evan Anger on 7/16/16.
//  Copyright © 2016 Mighty Strong Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Channel {
    
    let deviceCommunicator = DeviceCommunicator.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
        self.deviceCommunicator.sendMessage(message: CanaryMessage(name: .diagnostics, destinationDevice: .watch))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var name = ChannelType.diagnostics
    var device = DeviceType.phone

    func onReceive(message: Message) {
        
    }
    
    func onError(message: Message) {
        
    }

}

