//
//  KTLogger.swift
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

import Foundation
import os.log

extension KTTrackCategory {
  func toString() -> String {
    switch self {
    case .none:
      return "None"
    }
  }
}

extension KTTrackAction {
  func toString() -> String {
    switch self {
    case .none:
      return "None"
    }
  }
}

protocol KTLoggable {
  func log()
}

protocol KTTrackable: KTLoggable {
  func send()
}


struct KTTrackManager {
  func sendEvent(event: KTTrackable) {
    event.send()
    event.log()
  }
}
