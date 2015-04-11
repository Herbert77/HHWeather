//
//  HHWeatherGroup.h
//  HHWeather
//
//  Created by 胡传业 on 15/3/19.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HHWeatherItem;

@interface HHWeatherGroup : NSObject

@property (nonatomic) NSMutableArray *weatherItems;

- (void) addWeatherItem:(HHWeatherItem *)weatherItem;

- (void) addWeatherItems:(NSArray *) weatherArray;

//- (NSMutableArray *) weatherItems;

@end
