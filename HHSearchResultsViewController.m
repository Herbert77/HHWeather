//
//  HHSearchResultsViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/4/7.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHSearchResultsViewController.h"
#import "HHDataManager.h"

@interface HHSearchResultsViewController ()

@end

@implementation HHSearchResultsViewController

#pragma mark - UISearchResultsUpdating

- (void) updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    if (!searchController.active) {
        
        return;
    }
    
    self.filterString = searchController.searchBar.text;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    NSLog(@"%@ is Selected in the list.", [self.visibleResults objectAtIndex:indexPath.row]);
    
    // 把 User 选择的城市添加到城市列表中，以此获取天气数据
    NSString *newCity = [[NSString alloc] initWithString:[self.visibleResults objectAtIndex:indexPath.row]];
    
    
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

    // 对城市列表进行数据存储
//    [[HHDataManager sharedDataManager] saveCitysData];
    

    
    
}

@end
