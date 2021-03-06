//
//  HHWeatherCell.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHWeatherCell.h"
#import "HHWeatherColor.h"

@implementation HHWeatherCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // Configure city label
        _cityNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(17, 18, 140, 40)];
        _cityNameLabel.textColor = [[HHWeatherColor sharedColorPalette] colorForText];
        NSLog(@"cityNameLabel's color is %@", [_cityNameLabel textColor]);
        _cityNameLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:22];
        [self addSubview: _cityNameLabel];
        
        // Configure weather image view (51, 47)
        _weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 14, 55, 55)];
        _weatherImageView.backgroundColor = [UIColor clearColor];
        _weatherImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_weatherImageView];
        
        // Configure temperature label
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(272, 20, 100, 35)];
        _tempLabel.textColor = [[HHWeatherColor sharedColorPalette] colorForText];
        _tempLabel.font = [UIFont fontWithName:@"Avenir-Light" size:26];
        [self addSubview:_tempLabel];
        
        [self setHighlighted:YES animated:YES];
        
        _indicatorLine = [[UIView alloc] initWithFrame:CGRectMake(22, 75.1, self.bounds.size.width + 100, 0.9)];
        _indicatorLine.backgroundColor = [UIColor whiteColor];
        _indicatorLine.alpha = 0.35;
        [self addSubview:_indicatorLine];

    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
