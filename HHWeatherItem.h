//
//  HHWeatherItem.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHWeatherItem : NSObject

@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *weather;
@property (nonatomic, copy) NSString *temperature;
@property (nonatomic, copy) NSString *wind;
@property (nonatomic, copy) NSString *humidity;

// designated initializer
- (instancetype) initWithCityName:(NSString *)cityName weather:(NSString *)weather temperature:(NSString *)temperature wind:(NSString *)wind humidity:(NSString *)humidity;


@end