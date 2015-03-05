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
        
        // Configure weather image view
        _weatherImageView = [[UIImageView alloc] initWithFrame:CGRectMake(195, 14, 51, 47)];
        _weatherImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_weatherImageView];
        
        // Configure temperature label
        _tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(292, 20, 60, 35)];
        _tempLabel.textColor = [[HHWeatherColor sharedColorPalette] colorForText];
        _tempLabel.font = [UIFont fontWithName:@"Avenir-Light" size:26];
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
