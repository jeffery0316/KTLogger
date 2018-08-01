//
//  KTTrackManager.m
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import "KTTrackManager.h"
#import "KTTrackManager+Private.h"

@implementation KTTrackManager
+ (KTTrackManager *)sharedManager
{
  static KTTrackManager *sharedManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedManager = [[KTTrackManager alloc] init];
  });
  return sharedManager;
}

#pragma mark - Public methods
- (void)sendEventWithEventName:(NSString *)eventName category:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value eventType:(KTEventType)type {
  [self _sendEventWithEventName:eventName properties:nil category:category action:action label:label value:value eventType:type];
}

- (void)sendEventWithEventName:(NSString *)eventName properties:(NSDictionary *)properties category:(NSString *)category action:(NSString *)action label:(NSString *)label value:(NSNumber *)value eventType:(KTEventType)type {
  [self _sendEventWithEventName:eventName properties:properties category:category action:action label:label value:value eventType:type];
}
@end
