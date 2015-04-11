//
//  HHWeatherCell.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHWeatherCell : UITableViewCell

@property (nonatomic, strong)  UILabel *cityNameLabel;
@property (nonatomic, strong)  UIImageView *weatherImageView;
@property (nonatomic, strong)  UILabel *tempLabel;

@property (nonatomic, strong) UIView *indicatorLine;

@end
