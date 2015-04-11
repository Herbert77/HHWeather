//
//  HHSearchBarEmbeddedInNavigationBarViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/4/7.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHSearchBarEmbeddedInNavigationBarViewController.h"
#import "HHSearchResultsViewController.h"

@interface HHSearchBarEmbeddedInNavigationBarViewController ()

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation HHSearchBarEmbeddedInNavigationBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HHSearchResultsViewController *searchResultsController = [[HHSearchResultsViewController alloc] init];
    
    // 创建 searchController 并让其执行结果更新
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    self.searchController.searchResultsUpdater = searchResultsController;
    self.searchController.hidesNavigationBarDuringPresentation = NO;
    
    // 配置 searchController 的 search Bar
    self.searchController.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchController.searchBar.placeholder = NSLocalizedString(@"城市", nil);
//    self.searchController.searchBar.barTintColor = [UIColor whiteColor];
    
        // 配置 placeholder 的颜色
    for (UIView* subview in [[self.searchController.searchBar.subviews lastObject] subviews]) {
        
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *textField = (UITextField*)subview;
            
            [textField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];   //修改placeholder的颜色
        } else if ([subview isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [subview removeFromSuperview];
        }
    }

    
    // 把 search Bar 嵌入 navigation Bar
    self.navigationItem.titleView = self.searchController.searchBar;
    self.definesPresentationContext = YES;
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
