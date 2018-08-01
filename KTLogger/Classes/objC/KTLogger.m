//
//  KTLogger.m
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import "KTLogger.h"
#import <os/log.h>

@implementation KTLogger

+ (void)sendLogWithType:(KTEventType)event params:(NSDictionary *)params
{
#ifdef DEBUG
  switch (event) {
    case KTEventTypeGA: {
      NSString *category = params[@"category"] ?: @"";
      NSString *action = params[@"action"] ?: @"";
      NSString *label = params[@"label"] ?: @"";
      NSString *value = params[@"value"] ?: @"";
      
      os_log_t logGA = os_log_create("APP", "tracker");
      NSString *logStr = [NSString stringWithFormat:@"GA category: %@, action: %@, label: %@, value: %@", category, action, label, value ?: @""];
      const char *logCStr = [logStr UTF8String];
      os_log(logGA, "%{public}s", logCStr);
      break;
    }
    case KTEventTypeMixpanel: {
      NSString *eventName = params[@"eventName"] ?: @"";
      NSDictionary *eventProperties = params[@"eventProperties"] ?: @{};
      
      os_log_t logMixpanel = os_log_create("APP", "tracker");
      NSString *paramsStr = [NSString stringWithFormat:@"Mixpanel eventName: %@, event: %@", eventName, eventProperties];
      const char *paramsCStr = [paramsStr UTF8String];
      os_log(logMixpanel, "%{public}s", paramsCStr);
    }
    default:
      break;
  }
#endif
  
}

@end
