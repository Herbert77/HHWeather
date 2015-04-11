//
//  HHWeatherGroup.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/19.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherGroup.h"
#import "HHWeatherItem.h"

@interface HHWeatherGroup ()

@end

@implementation HHWeatherGroup

- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        self.weatherItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void) addWeatherItem:(HHWeatherItem *)weatherItem {
    
    [self.weatherItems addObject:weatherItem];
}

- (void) addWeatherItems:(NSArray *) weatherArray {
    
    [self.weatherItems addObjectsFromArray:weatherArray];
}

//- (NSMutableArray *) weatherItems {
//    
//    return self.weatherItems;
//}

@end
