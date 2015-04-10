//
//  CustomMenuCell.m
//  PullDownMenuDemo
//
//  Created by 胡传业 on 15/3/3.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "CustomMenuCell.h"
#import "HHWeatherColor.h"

@implementation CustomMenuCell

// [[UIColor colorWithHexString:@"ffffff"] CGColor]
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:32/255.0 green:150/255.0 blue:229/255.0 alpha:1.0] CGColor]);
    CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 1));
    
    //下分割线
//    CGContextSetStrokeColorWithColor(context, [[UIColor colorWithRed:0.3 green:0.4 blue:0.5 alpha:1.0] CGColor]);
//    CGContextStrokeRect(context, CGRectMake(5, rect.size.height, rect.size.width - 10, 1));
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // Configure the image view
        _customImageView = [[UIImageView alloc] initWithFrame:CGRectMake(45, 13, 25, 25)];
        _customImageView.backgroundColor = [UIColor clearColor];
        _customImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_customImageView];
        
        // Configure the text label
        _customLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 15, 120, 23)];
        _customLabel.textColor = [[HHWeatherColor sharedColorPalette] colorForText];
        _customLabel.font = [UIFont fontWithName:@"AvenirNext" size:16];
        [self addSubview:_customLabel];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
