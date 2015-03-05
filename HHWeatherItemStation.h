//
//  HHWeatherItemStation.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class HHWeatherItem;

@interface HHWeatherItemStation : NSObject

// Singleton instance
@property (nonatomic, readonly) NSArray *allWeatherItems;

+ (instancetype) sharedStation;

- (HHWeatherItem *) createdItemForCity:(NSString *)cityName;
- (void) removeItem:(HHWeatherItem *)weatherItem;

// For test
- (void) getTempWeatherDataForTest;
@end
