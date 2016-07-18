//
//  Message.swift
//  DeviceCommunicator
//
//  Created by Evan Anger on 7/16/16.
//  Copyright © 2016 Mighty Strong Software. All rights reserved.
//

import Foundation

enum DeviceType {
    case watch
    case phone
}
extension Message {
    func package() -> AnyObject {
        return self as! AnyObject
    }
}

protocol Message {
    var name: ChannelType { get }
    var destinationDevice: DeviceType { get }
    func package() -> AnyObject
}
