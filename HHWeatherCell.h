//
//  HHWeatherCell.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHWeatherCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *cityNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *weatherImageView;
@property (nonatomic, weak) IBOutlet UILabel *tempLabel;

@end
