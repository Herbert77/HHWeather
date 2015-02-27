//
//  HHWeatherCell.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherCell.h"

@implementation HHWeatherCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // Configure city label
        _cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 18, 100, 40)];
        _cityNameLabel.textColor = [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
        _cityNameLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:25];
        [self addSubview: _cityNameLabel];
        
        // Configure weather image view
        _weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 14, 51, 47)];
        _weatherImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_weatherImageView];
        
        // Configure temperature label
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(292, 20, 60, 35)];
        _tempLabel.textColor = _cityNameLabel.textColor;
        _tempLabel.font = _cityNameLabel.font;
        [self addSubview:_tempLabel];
        
        [self setHighlighted:YES animated:YES];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
