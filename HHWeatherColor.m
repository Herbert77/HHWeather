//
//  HHWeatherColor.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/1.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherColor.h"

@implementation HHWeatherColor

+ (instancetype) sharedColorPalette {
    
    static HHWeatherColor *colorPaletter = nil;
    
    if (!colorPaletter) {
        
        colorPaletter = [[self alloc] initWithPrivate];
    }
    
    return colorPaletter;
}

- (instancetype) initWithPrivate {
    
    self = [super init];
    
    if (self) {
        
        // Create colors we needed
        UIColor *sunnyColor = [UIColor colorWithRed:241/255.0 green:196/255.0 blue:15/255.0 alpha:1.0];
        UIColor *thunderStormColor = [UIColor colorWithRed:103/255.0 green:31/255.0 blue:134/255.0 alpha:1.0];
        UIColor *rainColor = [UIColor colorWithRed:41/255.0 green:128/255.0 blue:185/255.0 alpha:1.0];
        UIColor *snowColor = [UIColor colorWithRed:175/255.0 green:205/255.0 blue:217/255.0 alpha:1.0];
        UIColor *sizzlerColor = [UIColor colorWithRed:211/255.0 green:84/255.0 blue:0.0 alpha:1.0];
        UIColor *textColor = [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
        
        self.colorsDic = @{@"Sunny":sunnyColor,
                           @"ThunderStorm":thunderStormColor,
                           @"Rain":rainColor,
                           @"Snow":snowColor,
                           @"Sizzler":sizzlerColor,
                           @"Text":textColor};
            
    }
    
    return self;
}


- (UIColor *) colorForWeather:(NSString *)weather {
    
    return [self.colorsDic objectForKey:weather];
}

- (UIColor *) colorForText {
    
    return [self.colorsDic objectForKey:@"Text"];
}

@end
