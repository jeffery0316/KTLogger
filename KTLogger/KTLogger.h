//
//  KTLogger.h
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KTEventHeader.h"

@interface KTLogger : NSObject
+ (void)sendLogWithType:(KTEventType)event params:(NSDictionary *)params;
@end
