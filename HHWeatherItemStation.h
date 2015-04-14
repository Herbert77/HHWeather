//
//  HHWeatherItemStation.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>


@class HHWeatherItem;
@class HHWeatherGroup;

@interface HHWeatherItemStation : NSObject

// Singleton instance
@property (nonatomic, readonly) NSMutableDictionary *allWeatherGroups;

@property (nonatomic, copy) NSArray *cityList;

+ (instancetype) sharedStation;

- (void) addWeatherGroup:(HHWeatherGroup *)weatherGroup forCity:(NSString *)cityName;

- (void) removeWeatherGroupForCity:(NSString *)cityName;

//- (HHWeatherItem *) createdItemForCity:(NSString *)cityName;
//- (void) removeItem:(HHWeatherItem *)weatherItem;

// For test
//- (void) getTempWeatherDataForTest;

- (void) requestAllAvailableCitys;
- (void) loadTheCityListFromPlist;

@end
