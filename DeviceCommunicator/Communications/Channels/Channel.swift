//
//  ChannelType.swift
//  DeviceCommunicator
//
//  Created by Evan Anger on 7/16/16.
//  Copyright © 2016 Mighty Strong Software. All rights reserved.
//

import Foundation

enum ChannelType: String {
    case diagnostics = "diagnostics"
}

protocol Channel {
    var name: ChannelType { get }
    var device: DeviceType { get }
    
    func onReceive(message: Message)
    func onError(message: Message)
}
