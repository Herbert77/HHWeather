//
//  HHBaseTableViewController.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/28.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const KCellIndentifier;

@interface HHBaseTableViewController : UITableViewController

- (void)configureCell:(UITableViewCell *)cell forCityName:(NSString *)cityName;

@end
