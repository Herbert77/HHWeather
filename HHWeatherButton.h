//
//  HHWeatherButton.h
//  HHWeather
//
//  Created by 胡传业 on 15/3/14.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHWeatherButton : UIButton

@property (nonatomic, strong) UILabel     *dayLabel;
@property (nonatomic, strong) UILabel     *cityLabel;
@property (nonatomic, strong) UIImageView *weatherImageView;
@property (nonatomic, strong) UILabel     *weatherLabel;
@property (nonatomic, strong) UILabel     *tempLabel;
@property (nonatomic, strong) UILabel     *windLabel;
@property (nonatomic, strong) UILabel     *humidityLabel;

@end
