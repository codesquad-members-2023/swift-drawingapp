//
//  Log.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/30.
//

import Foundation
import os.log

class Logger {
    func printLog(of sqaure: Square , order : Int) {
        let log = OSLog(subsystem: "", category: "data")

        os_log("SQUARE%@ , %@", log: log, type: .info, String(order) ,sqaure.description)
    }
}
