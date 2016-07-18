//
//  DeviceCommunicator.swift
//  DeviceCommunicator
//
//  Created by Evan Anger on 7/16/16.
//  Copyright © 2016 Mighty Strong Software. All rights reserved.
//

import Foundation
import WatchConnectivity

protocol CommunicatorType {
    func isSupported() -> Bool
}

@objc class DeviceCommunicator:NSObject, WCSessionDelegate, CommunicatorType {
    static let sharedInstance = DeviceCommunicator()
    
    
    var channels = [Channel]()
    let session: WCSession!
    override init() {
        session = WCSession.default()
        session.activate()
        super.init()
        session.delegate = self
    }
    
    func isSupported() -> Bool {
        return WCSession.isSupported()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: NSError?) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        if let result = message["result"] as? Message {
            self.channels.filter { (channel) -> Bool in
                if(result.name == channel.name) {
                    return true
                } else {
                    return false
                }
            }.forEach({ (channel) in
                channel.onReceive(message: result)
            })
        }
    }
    
    func sendMessage(message: Message) {
        session.sendMessage(["result": message.package()], replyHandler: nil, errorHandler: nil)
    }
    
    func register(channel: Channel) {
        self.channels.append(channel)
    }
    
}
