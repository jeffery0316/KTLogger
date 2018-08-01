//
//  KTTrackManager+Private.h
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTTrackManager.h"

@interface KTTrackManager (Private)
- (void)_sendEventWithEventName:(NSString * _Nullable)eventName
                     properties:(NSDictionary * _Nullable)properties
                       category:(NSString * _Nullable)category
                         action:(NSString * _Nullable)action
                          label:(NSString * _Nullable)label
                          value:(NSNumber * _Nullable)value
                      eventType:(KTEventType)type;

- (void)_sendGAWithCateogry:(NSString * _Nonnull)category
                     action:(NSString * _Nonnull)action
                      label:(NSString * _Nonnull)label
                      value:(NSNumber * _Nullable)value;

- (void)_sendMixpanel:(NSString * _Nonnull)eventName
   eventProperties:(NSDictionary * _Nullable)eventProperties;
@end
