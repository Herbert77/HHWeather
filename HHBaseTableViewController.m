//
//  HHBaseTableViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/28.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHBaseTableViewController.h"

NSString *const KCellIndentifier = @"MyCell";
NSString *const KTableCellNibName = @"TableCell";

@interface HHBaseTableViewController ()

@end

@implementation HHBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:KTableCellNibName bundle:nil] forCellReuseIdentifier:KCellIndentifier];
}

- (void)configureCell:(UITableViewCell *)cell forCityName:(NSString *)cityName {
    
    cell.textLabel.text = cityName;
    
}

@end
