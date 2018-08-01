//
//  KTTrackManager.h
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import "KTEventHeader.h"
#import <Foundation/Foundation.h>

@interface KTTrackManager : NSObject

+ (KTTrackManager *)sharedManager;

/**
 send Mixpanel and GA tracker event
 @param eventName Mixpanel event name
 @param category GA category name
 @param action GA action name
 @param label GA label name
 @param value GA value name
 @param type determine which event should send
 */
- (void)sendEventWithEventName:(NSString *)eventName
                      category:(NSString *)category
                        action:(NSString *)action
                         label:(NSString *)label
                         value:(NSNumber *)value
                     eventType:(KTEventType)type;


/**
 send Mixpanel with properties and GA tracker event
 @param eventName Mixpanel event name
 @param properties Mixpanel properties
 @param category GA category name
 @param action GA action name
 @param label GA label name
 @param value GA value name
 @param type determine which event should send
 */
- (void)sendEventWithEventName:(NSString *)eventName
                    properties:(NSDictionary *)properties
                      category:(NSString *)category
                        action:(NSString *)action
                         label:(NSString *)label
                         value:(NSNumber *)value
                     eventType:(KTEventType)type;
@end
