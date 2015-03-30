//
//  HHWeatherSecButton.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/28.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherSecButton.h"


#define TEXTCOLOR [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0]

@interface HHWeatherSecButton ()

@property (nonatomic, readonly, strong) UIImageView *tempSymbolLabel;
@property (nonatomic, readonly, strong) UIImageView *windSymbolLabel;
@property (nonatomic, readonly, strong) UIImageView *humiditySymbolLabel;

@end

@implementation HHWeatherSecButton

- (instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Public property
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 24, 250, 24)];
        _dayLabel.font = [UIFont fontWithName:@"AvenirNext-Light" size:16.0];
        _dayLabel.textAlignment = NSTextAlignmentLeft;
        _dayLabel.textColor = TEXTCOLOR;
        [self addSubview:_dayLabel];
        
        
        _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(107, 14, 160, 30)];
        _cityLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:23];
        _cityLabel.textAlignment = NSTextAlignmentCenter;
        _cityLabel.textColor = TEXTCOLOR;
        [self addSubview:_cityLabel];
        
        _weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(147, 108, 75, 75)];
        _weatherImageView.backgroundColor = [UIColor clearColor];
        _weatherImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_weatherImageView];
        
        _weatherLabel = [[UILabel alloc] initWithFrame:CGRectMake(107, 211, 160, 40)];
        _weatherLabel.font = [UIFont fontWithName:@"AvenirNext-MediumItalic" size:25];
        //        [_weatherLabel.font fontWithSize:25];
        _weatherLabel.textAlignment = NSTextAlignmentCenter;
        _weatherLabel.textColor = TEXTCOLOR;
        [self addSubview:_weatherLabel];
        
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 285, 205, 69)];
        _tempLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:35];
        _tempLabel.textAlignment = NSTextAlignmentCenter;
        _tempLabel.textColor = TEXTCOLOR;
        [self addSubview:_tempLabel];
        
        _windLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 387, 160, 30)];
        _windLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:20];
        _windLabel.textAlignment = NSTextAlignmentCenter;
        _windLabel.textColor = TEXTCOLOR;
        [self addSubview:_windLabel];
        
//        _humidityLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 469, 160, 30)];
//        _humidityLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:20];
//        _humidityLabel.textAlignment = NSTextAlignmentCenter;
//        _humidityLabel.textColor = TEXTCOLOR;
//        [self addSubview:_humidityLabel];
        
        // Private property
//        _tempSymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(230, 310, 31, 28)];
//        _tempSymbolLabel.backgroundColor = [UIColor clearColor];
//        _tempSymbolLabel.contentMode = UIViewContentModeScaleAspectFill;
//        [self addSubview:_tempSymbolLabel];
        
        _windSymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(94, 389, 67, 25)];
        _windSymbolLabel.backgroundColor = [UIColor clearColor];
        _tempSymbolLabel.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_windSymbolLabel];
        
        _humiditySymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(120, 474, 14, 19)];
        _humiditySymbolLabel.backgroundColor = [UIColor clearColor];
        _humiditySymbolLabel.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_humiditySymbolLabel];
        
        // Configure the constant value for private property
//        _tempSymbolLabel.image = [UIImage imageNamed:@"tempSymbol"];
        _windSymbolLabel.image = [UIImage imageNamed:@"windSymbol"];
//        _humiditySymbolLabel.image = [UIImage imageNamed:@"humiditySymbol"];
    }
    
    return self;
}


@end
