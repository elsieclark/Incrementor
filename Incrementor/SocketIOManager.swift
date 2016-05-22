//
//  SocketIOManager.swift
//  SocketChat
//
//  Created by Will Clark on 2016-05-19.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class SocketIOManager: NSObject {
    
    static let sharedInstance = SocketIOManager()
    
    override init() {
        super.init()
    }
    
    var socket : SocketIOClient = SocketIOClient(socketURL: NSURL(string: "http://192.168.0.22:3000")!)
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
    
    func sendMessage(message : String) {
        socket.emit("incrementor", message)
    }
    
    
    
}
