//
//  HHNavigationController.h
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PulldownMenu.h"

#import <MessageUI/MFMailComposeViewController.h>

@interface HHNavigationController : UINavigationController <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain) PulldownMenu *pulldownMenu;

@property (nonatomic) BOOL menuIsOpen;

@end
