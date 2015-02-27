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

@property (nonatomic) NSMutableArray *allWeatherItems;

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
        
        _allWeatherItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}




@end
