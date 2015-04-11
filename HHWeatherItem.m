//
//  HHWeatherItem.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherItem.h"

@implementation HHWeatherItem

- (instancetype) initWithCityName:(NSString *)cityName weather:(NSString *)weather temperature:(NSString *)temperature currentTemp:(NSString *)currentTemp wind:(NSString *)wind humidity:(NSString *)humidity pmValue:(NSString *)pmValue {
    
    self = [super init];
    
    if (self) {
        
        _cityName = cityName;
        _weather = weather;
        _temperature = temperature;
        _currentTemp = currentTemp;
        _wind = wind;
        _humidity = humidity;
        _pmValue = pmValue;
    }
    
    return self;
}

- (NSString *)description {
    
    NSString *descritionString = [NSString stringWithFormat:@"%@: %@ %@ %@ %@ %@ %@", self.cityName, self.weather, self.temperature, self.currentTemp, self.wind, self.humidity, self.pmValue];
    
    return descritionString;
}

@end
