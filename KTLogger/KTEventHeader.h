//
//  KTEventHeader.h
//  KTLogger
//
//  Created by jeffery_kao on 2018/8/1.
//  Copyright © 2018年 com.kt. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KTEventType) {
  KTEventTypeNone,
  KTEventTypeGA,
  KTEventTypeMixpanel,
  KTEventTypeAll
};

typedef NS_ENUM(NSUInteger, KTTrackAction) {
  KTTrackActionNone
};

typedef NS_ENUM(NSUInteger, KTTrackCategory) {
  KTTrackCategoryNone
};
