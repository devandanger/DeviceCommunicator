//
//  CanaryMessage.swift
//  DeviceCommunicator
//
//  Created by Evan Anger on 7/17/16.
//  Copyright © 2016 Mighty Strong Software. All rights reserved.
//


struct CanaryMessage: Message {
    let status = "I'm alive"
    var name: ChannelType
    var destinationDevice: DeviceType
}
