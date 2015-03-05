//
//  HHWeatherItemStation.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/27.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherItemStation.h"
#import "HHWeatherItem.h"

@interface HHWeatherItemStation ()

@property (nonatomic) NSMutableArray *allPrivateWeatherItems;

@end

@implementation HHWeatherItemStation

+ (instancetype) sharedStation {
    
    static HHWeatherItemStation *station = nil;
    
    if (!station) {
        
        station = [[self alloc] initWithPrivate];
    }
    
    return station;
}

// Deal with the possible situation
- (instancetype) init {
    
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use +(instance) sharedStation " userInfo:nil];
    
    return nil;
}

// Real initializer method
- (instancetype) initWithPrivate {
    
    self = [super init];
    
    if (self) {
        
        _allPrivateWeatherItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *) allWeatherItems {
    
    return self.allPrivateWeatherItems;
}

- (HHWeatherItem *) createdItemForCity:(NSString *)cityName {
    
    HHWeatherItem *item = [[HHWeatherItem alloc] initWithCityName:cityName weather:@"Snow" temperature:@"-3°" wind:@"gale" humidity:@"65%"];
    
    [self.allPrivateWeatherItems addObject:item];
    
    return item;
}

- (void) removeItem:(HHWeatherItem *)weatherItem {
    
    [self.allPrivateWeatherItems removeObject:weatherItem];
}

// Provides the temp weather info data
- (void) getTempWeatherDataForTest {
    
    HHWeatherItem *item_1 = [[HHWeatherItem alloc] initWithCityName:@"WuHan" weather:@"Sunny" temperature:@"25°" wind:@"Breeze" humidity:@"37%"];
    HHWeatherItem *item_2 = [[HHWeatherItem alloc] initWithCityName:@"ShangHai" weather:@"Rain" temperature:@"11°" wind:@"gale" humidity:@"87%"];
    HHWeatherItem *item_3 = [[HHWeatherItem alloc] initWithCityName:@"ChongQing" weather:@"Sizzler" temperature:@"38°" wind:@"windless" humidity:@"13%"];
    
    [self.allPrivateWeatherItems addObjectsFromArray:@[item_1, item_2, item_3]];
    
}


@end
