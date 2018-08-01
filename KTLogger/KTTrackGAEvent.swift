//
//  KTTrackGAEvent.swift
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

import Foundation
import os.log

class KTTrackGAEvent: NSObject {
  let GAID: String = ""
  let category: String
  let action: String
  let label: String
  let value: NSNumber?
  
  static func event(category: KTTrackCategory, action: KTTrackAction, label: String, value: NSNumber? = nil) -> KTTrackGAEvent {
    return KTTrackGAEvent(category: category, action: action, label: label, value: value)
  }
  
  init(category: KTTrackCategory, action: KTTrackAction, label: String, value: NSNumber? = nil) {
    self.category = category.toString()
    self.action = action.toString()
    self.label = label
    self.value = value
  }
}

extension KTTrackGAEvent: KTTrackable {
  func log() {
    let staticString = StaticString.init(stringLiteral: "GA category: %@, action: %@, label: %@, value: %@")
    
    if #available(iOS 10.0, *) {
      let log: OSLog = OSLog.init(subsystem: "APP", category: "tracker")
      os_log(staticString, log: log, type: OSLogType.default, category, action, label, value ?? "")
    } else {
      NSLog("GA category: %@, action: %@, label: %@, value: %@", category, action, label, value ?? "")
    }
  }
  
  func send() {
    let gaValue: NSNumber = self.value ?? NSNumber.init()
    let eventTracker: [AnyHashable: Any] = [:]
    
    if let eventTracker = GAIDictionaryBuilder.createEvent(withCategory: category, action: action, label: label, value: gaValue).build() {
      for item in eventTracker {
        if let key = item.key as? AnyHashable {
          eventTracker[key] = item.value
        }
      }
    }
    
    GAI.sharedInstance().tracker(withTrackingId: GAID).send(eventTracker)
  }
}
