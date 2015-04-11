//
//  HHWeatherButton.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/14.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherButton.h"

#define TEXTCOLOR [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0]

@interface HHWeatherButton ()

@property (nonatomic, readonly, strong) UIImageView *tempSymbolLabel;
@property (nonatomic, readonly, strong) UIImageView *windSymbolLabel;
@property (nonatomic, readonly, strong) UIImageView *humiditySymbolLabel;
@property (nonatomic, readonly, strong) UILabel *pmValueSymbolLabel;

@end

@implementation HHWeatherButton

- (instancetype) initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        // Public property
        _dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 24, 250, 24)];
        _dayLabel.font = [UIFont fontWithName:@"AvenirNext-Light" size:16.0];
        _dayLabel.textAlignment = NSTextAlignmentLeft;
        _dayLabel.textColor = TEXTCOLOR;
        [self addSubview:_dayLabel];
        
        
        _cityLabel = [[UILabel alloc] initWithFrame:CGRectMake(107, 24, 160, 30)];
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
        
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 270, 135, 69)];
        _tempLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:55];
        _tempLabel.textAlignment = NSTextAlignmentCenter;
        _tempLabel.textColor = TEXTCOLOR;
        [self addSubview:_tempLabel];
        
        _windLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 387+35, 160, 30)];
        _windLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:20];
        _windLabel.textAlignment = NSTextAlignmentCenter;
        _windLabel.textColor = TEXTCOLOR;
        [self addSubview:_windLabel];
        
        _humidityLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 469 + 15, 160, 30)];
        _humidityLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:20];
        _humidityLabel.textAlignment = NSTextAlignmentCenter;
        _humidityLabel.textColor = TEXTCOLOR;
        [self addSubview:_humidityLabel];
        
        
        // Additional instance of property
        _tempRangeLabel = [[UILabel alloc] initWithFrame:CGRectMake(95, 362, 184, 45)];
        _tempRangeLabel.font = [UIFont fontWithName:@"Avenir-Light" size:27];
        _tempRangeLabel.textAlignment = NSTextAlignmentCenter;
        _tempRangeLabel.textColor = TEXTCOLOR;
        [self addSubview:_tempRangeLabel];
        
        _pmValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 92, 68, 30)];
        _pmValueLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:18];
        _pmValueLabel.textAlignment = NSTextAlignmentCenter;
        _pmValueLabel.textColor = TEXTCOLOR;
        [self addSubview:_pmValueLabel];
        
        // Private property
//        _tempSymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(230, 310, 31, 28)];
//        _tempSymbolLabel.backgroundColor = [UIColor clearColor];
//        _tempSymbolLabel.contentMode = UIViewContentModeScaleAspectFill;
//        [self addSubview:_tempSymbolLabel];
        
        _windSymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(94, 389+28, 55, 40)];
        _windSymbolLabel.backgroundColor = [UIColor clearColor];
        _tempSymbolLabel.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_windSymbolLabel];
        
        _humiditySymbolLabel = [[UIImageView alloc] initWithFrame:CGRectMake(120, 474 + 15, 14, 19)];
        _humiditySymbolLabel.backgroundColor = [UIColor clearColor];
        _humiditySymbolLabel.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_humiditySymbolLabel];
        
        _pmValueSymbolLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 63, 68, 30)];
        _pmValueSymbolLabel.text = @"PM2.5";
        _pmValueSymbolLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:18];
        _pmValueSymbolLabel.textAlignment = NSTextAlignmentCenter;
        _pmValueSymbolLabel.textColor = TEXTCOLOR;
        [self addSubview:_pmValueSymbolLabel];
        
        // Configure the constant value for private property
//        _tempSymbolLabel.image = [UIImage imageNamed:@"tempSymbol"];
        _windSymbolLabel.image = [UIImage imageNamed:@"windy"];
        _humiditySymbolLabel.image = [UIImage imageNamed:@"humiditySymbol"];
        
    }
    
    return self;
}


@end
