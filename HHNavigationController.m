//
//  HHNavigationController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHNavigationController.h"

#import "HHProfileViewController.h"
#import "HHSettingsTableController.h"

@interface HHNavigationController () <PulldownMenuDelegate>

@end

@implementation HHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pulldownMenu = [[PulldownMenu alloc] initWithNavigationController:self];
    [self.view insertSubview:_pulldownMenu belowSubview:self.navigationBar];
    
    [_pulldownMenu insertButton:@"Settings"];
    [_pulldownMenu insertButton:@"Profile"];
    [_pulldownMenu insertButton:@"Feed back"];
    
    _pulldownMenu.delegate = self;
    
    [_pulldownMenu loadMenu];
    
}

#pragma mark - Pull down menu delegate
- (void)menuItemSelected:(NSIndexPath *)indexPath {
    
    NSLog(@"%ld", (long)indexPath.item);
    
    if (indexPath.item == 0) {
        
        // TODO: Setting VC
        HHSettingsTableController *settingsTableController = [[HHSettingsTableController alloc] init];
        [self presentViewController:settingsTableController animated:YES completion:nil];
    }
    else if (indexPath.item == 1) {

        HHProfileViewController *profileViewController = [[HHProfileViewController alloc] init];
        [self presentViewController:profileViewController animated:YES completion:nil];

    }
    else {
        
        // TODO: Feed bck VC
        
    }
    
}

- (void)pullDownAnimated:(BOOL)open {
    
    self.menuIsOpen = open;
    
    if (open) {
        
        NSLog(@"Pull down menu open ~");
    }
    else {
        
        NSLog(@"Pull down menu closed ~");
    }
}


@end
