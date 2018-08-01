//
//  KTTrackManager+Private.m
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import <os/log.h>
#import "KTTrackManager+Private.h"
#import "KTLogger.h"

@implementation KTTrackManager (Private)

- (void)_sendEventWithEventName:(NSString *)eventName properties:(NSDictionary *)properties category:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value eventType:(KTEventType)type
{
  NSParameterAssert(eventName);
  NSParameterAssert(category);
  NSParameterAssert(action);
  NSParameterAssert(label);
  
  switch (type) {
    case KTEventTypeMixpanel: {
      [self _sendMixpanel:eventName eventProperties:properties];
      break;
    }
    case KTEventTypeGA: {
      [self _sendGAWithCateogry:category action:action label:label value:value];
      break;
    }
    case KTEventTypeAll: {
      [self _sendMixpanel:eventName eventProperties:properties];
      [self _sendGAWithCateogry:category action:action label:label value:value];
      break;
    }
    default:
      break;
  }
}

- (void)_sendGAWithCateogry:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value
{
  // GA
//  [gaTracker send:[[GAIDictionaryBuilder createEventWithCategory:category action:action label:label value:value] build]];

  NSDictionary *properties = @{
                               @"category": category ?: @"",
                               @"action": action ?: @"",
                               @"label": label ?: @"",
                               @"value": value ?: @""
                               };
  [KTLogger sendLogWithType:KTEventTypeGA params:properties];
}

- (void)_sendMixpanel:(NSString *)eventName eventProperties:(NSDictionary *)eventProperties
{
  if (eventName && ![eventName isEqualToString:@""]) {
    // Mixpanel
//    [Mixpanel track:eventName properties:eventProperties];
    
  [KTLogger sendLogWithType:KTEventTypeMixpanel params:@{@"eventName": eventName ?: @"", @"eventProperties": eventProperties ?: @{}}];
  }
}

@end
