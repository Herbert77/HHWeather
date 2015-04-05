//
//  HHResultTableViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/28.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHResultTableViewController.h"

@interface HHResultTableViewController ()

@end

@implementation HHResultTableViewController

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    // -updateSearchResultsForSearchController: is called when the controller is being dismissed to allow those who are using the controller they are search as the results controller a chance to reset their state. No need to update anything if we're being dismissed.
    if (!searchController.active) {
        return;
    }
    
//    self.filterString = searchController.searchBar.text;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
