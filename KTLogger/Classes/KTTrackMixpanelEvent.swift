//
//  KTTrackMixpanelEvent.swift
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

import Foundation
import os.log

class KTTrackMixpanelEvent: NSObject {
  let name: String
  let properties: [AnyHashable:Any]?
  
  @objc static func event(name: String, properties: [AnyHashable:Any]? = nil) -> KTTrackMixpanelEvent {
    return KTTrackMixpanelEvent(name: name, properties: properties)
  }
  
  init(name: String, properties: [AnyHashable:Any]? = nil) {
    self.name = name
    self.properties = properties
  }
}

extension KTTrackMixpanelEvent: KTTrackable {
  func log() {
    let staticString = StaticString.init(stringLiteral: "Mixpanel eventName: %@, event: %@")
    
    if #available(iOS 10.0, *) {
      let log: OSLog = OSLog.init(subsystem: "APP", category: "tracker")
      os_log(staticString, log: log, type: .default, name, properties ?? [])
    } else {
      NSLog("Mixpanel eventName: %@, event: %@", name, properties ?? [])
    }
  }
  
  func send() {
    //    Mixpanel.track(name, properties: properties)
  }
}
