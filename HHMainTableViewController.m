//
//  HHMainTableViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/28.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHMainTableViewController.h"
#import "HHResultTableViewController.h"

#import "HHWeatherColor.h"

@interface HHMainTableViewController () < UISearchBarDelegate, UISearchControllerDelegate>

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UISearchController *searchController;

//@property (nonatomic, strong) HHResultTableViewController *resultTableViewController;

@end

@implementation HHMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _dataArray = @[@"hello", @"OBJ", @"Jack", @"Bin"];
    
//    _resultTableViewController = [[HHResultTableViewController alloc] init];
    HHResultTableViewController *_resultTableViewController = [[HHResultTableViewController alloc] init];
    _searchController = [[UISearchController alloc] initWithSearchResultsController:_resultTableViewController];
    
    // This class will be responsible for the search result updating
//    self.searchController.searchResultsUpdater = self;
    self.searchController.searchResultsUpdater = _resultTableViewController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchBar.placeholder = NSLocalizedString(@"城市", nil);
//    [self.searchController.searchBar sizeToFit];
//    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
    self.navigationItem.titleView = self.searchController.searchBar;
    
//    self.resultTableViewController.tableView.delegate = self;
//    self.searchController.delegate = self;
//    self.searchController.searchBar.delegate = self;
    
    self.definesPresentationContext = YES;
    
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    UITableViewCell *cell = (UITableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:KCellIndentifier forIndexPath:indexPath];
//    
//    [self configureCell:cell forCityName:@"WuHan"];
//    
//    return cell;
//}

#pragma mark - Search controller delegate
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [searchBar resignFirstResponder];
}

#pragma mark - Search results updating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    
}


@end
