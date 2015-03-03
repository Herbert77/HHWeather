//
//  HHWeatherColor.h
//  HHWeather
//
//  Created by 胡传业 on 15/3/1.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HHWeatherColor : NSObject

@property (nonatomic, strong) NSDictionary *colorsDic;

+ (instancetype) sharedColorPalette;

- (UIColor *) colorForWeather:(NSString *)weather;

- (UIColor *) colorForText;

@end
