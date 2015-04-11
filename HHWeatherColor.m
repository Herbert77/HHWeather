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
        UIColor *sunnyColor        = [UIColor colorWithRed:232/255.0 green:191/255.0 blue:25/255.0 alpha:1.0];
        UIColor *thunderStormColor = [UIColor colorWithRed:106/255.0 green:36/255.0 blue:135/255.0 alpha:1.0];
        UIColor *rainColor         = [UIColor colorWithRed:25/255.0 green:119/255.0 blue:182/255.0 alpha:1.0];
        UIColor *snowColor         = [UIColor colorWithRed:149/255.0 green:206/255.0 blue:231/255.0 alpha:1.0];
        UIColor *cloudyColor       = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:231/255.0 alpha:1.0];
        UIColor *hailColor         = [UIColor colorWithRed:169/255.0 green:204/255.0 blue:219/255.0 alpha:1.0];
        UIColor *sizzlerColor      = [UIColor colorWithRed:230/255.0 green:126/255.0 blue:34/255.0 alpha:1.0];
        UIColor *overcastSkyColor  = [UIColor colorWithRed:174/255.0 green:194/255.0 blue:207/255.0 alpha:1.0];
        UIColor *textColor         = [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
        
        // The Acticvity Indicator View's gradual colors
        UIColor *indicatorBlue_1 = [UIColor colorWithRed:110/255.0 green:182/255.0 blue:230/255.0 alpha:0.6];
        UIColor *indicatorBlue_2 = [UIColor colorWithRed:110/255.0 green:182/255.0 blue:230/255.0 alpha:0.7];
        UIColor *indicatorBlue_3 = [UIColor colorWithRed:110/255.0 green:182/255.0 blue:230/255.0 alpha:0.8];
        UIColor *indicatorBlue_4 = [UIColor colorWithRed:110/255.0 green:182/255.0 blue:230/255.0 alpha:0.9];
        UIColor *indicatorBlue_5 = [UIColor colorWithRed:110/255.0 green:182/255.0 blue:230/255.0 alpha:1.0];
        
        self.colorsDic = @{@"sunny":sunnyColor,
                           @"thunderStorm":thunderStormColor,
                           @"rainy":rainColor,
                           @"snow":snowColor,
                           @"cloudy":cloudyColor,
                           @"sizzler":sizzlerColor,
                           @"foggy":cloudyColor,
                           @"hail":hailColor,
                           @"overcastSkyColor":overcastSkyColor,
                           @"Text":textColor,
                           @"1":indicatorBlue_1,
                           @"2":indicatorBlue_2,
                           @"3":indicatorBlue_3,
                           @"4":indicatorBlue_4,
                           @"5":indicatorBlue_5};
    }
    
    return self;
}


- (UIColor *) colorForWeather:(NSString *)weather {
    
    return [self.colorsDic objectForKey:weather];
}

- (UIColor *) colorForText {
    
    return [self.colorsDic objectForKey:@"Text"];
}

- (UIColor *) colorForIndicatorColor:(int)index {
    
    return [self.colorsDic objectForKey:[NSString stringWithFormat:@"%i", index]];
}

@end
