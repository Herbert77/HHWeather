//
//  HHSearchControllerBaseViewController.h
//  HHWeather
//
//  Created by 胡传业 on 15/4/7.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHSearchControllerBaseViewController : UITableViewController

@property (nonatomic, copy) NSString *filterString;
@property (readonly, copy) NSArray *visibleResults;

@property (nonatomic, strong) UIAlertView *alertViewForSuccess;
@property (nonatomic, strong) UIAlertView *alertViewForRepeat;

- (void) showAlertViewForSuccess:(NSString *)cityName;
- (void) showAlertViewForRepeat:(NSString *)cityName;

@end
