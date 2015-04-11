//
//  HHSearchControllerBaseViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/4/7.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHSearchControllerBaseViewController.h"
#import "HHWeatherItemStation.h"

#import "HHDataManager.h"

NSString *const HHSearchControllerBaseViewControllerTableViewCellIdentifier = @"searchResultsCell";

@interface HHSearchControllerBaseViewController ()

@property (copy) NSArray *allResults;
@property (readwrite, copy) NSArray *visibleResults;

@end

@implementation HHSearchControllerBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.allResults = [[HHWeatherItemStation sharedStation] cityList];
    
    self.visibleResults = self.allResults;


}

#pragma mark - Property Override
- (void) setFilterString:(NSString *)filterString {
    
    _filterString = filterString;
    
    if (!filterString || filterString.length <= 0) {
        
        self.visibleResults = self.allResults;
//        self.visibleResults = [[NSArray alloc] initWithArray:@[@""]];
    }
    else {
        
        NSPredicate *filterPredicate = [NSPredicate predicateWithFormat:@"self contains[c] %@", filterString];
        self.visibleResults = [self.allResults filteredArrayUsingPredicate:filterPredicate];
    }
    
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.visibleResults.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    return [tableView dequeueReusableCellWithIdentifier:HHSearchControllerBaseViewControllerTableViewCellIdentifier forIndexPath:indexPath];
    
    static NSString * cellIdentifier = @"cityCell";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.visibleResults[indexPath.row];
    
    return cell;
}

#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"%@ is Selected in the list.", [self.allResults objectAtIndex:indexPath.row]);
    
    // 把 User 选择的城市添加到城市列表中，以此获取天气数据
    NSString *newCity = [[NSString alloc] initWithString:[self.allResults objectAtIndex:indexPath.row]];
    
    // 如果在当前需要请求天气的城市列表中没有用户准备添加的这座城市，则添加并提示
    // 否则提示用户，该城市已经添加，无需重复添加
    
    if ([[HHDataManager sharedDataManager] thereIsTheCity:newCity]) {
        
        NSLog(@"There is this city.");
        [self showAlertViewForRepeat:newCity];
    }
    else {
        
        NSLog(@"There isn't this city. This city will be added to the city list.");
        [[HHDataManager sharedDataManager] addCity:newCity];
        [self showAlertViewForSuccess:newCity];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"StartAnimating" object:self];

    }
    
}

// 用户第一次成功预订某个城市的天气信息时出现的提示消息
- (void) showAlertViewForSuccess:(NSString *)cityName {
    
    NSString *messageString = [NSString stringWithFormat:@"您成功预定了%@的天气讯息 ；）", cityName];
    _alertViewForSuccess = [[UIAlertView alloc] initWithTitle:@"" message:messageString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    
    [_alertViewForSuccess show];
}

// 用户预订已经预订的城市天气信息时出现的提示消息
- (void) showAlertViewForRepeat:(NSString *)cityName {
    
    NSString *messageString = [NSString stringWithFormat:@"您已经预订过了该城市天气 ：）"];
    _alertViewForRepeat = [[UIAlertView alloc] initWithTitle:@"" message:messageString delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    
    [_alertViewForRepeat show];
}



@end
