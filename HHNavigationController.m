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
        [self sendMailInApp];
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


#pragma mark - Send email in app
- (void) sendMailInApp {
    
    Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
    if (!mailClass) {
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Notice"
                                  message:@"The current version of system doesn't support the email fuction!"
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
        
        return;
    }
    
    if (![mailClass canSendMail]) {
        UIAlertView *alertView_2 = [[UIAlertView alloc]
                                    initWithTitle:@"Notice" message:@"You haven't logged in email account!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView_2 show];
        return;
    }
    
    [self displayMailPicker];
}

// Trigger the window for sending email
- (void) displayMailPicker {
    
    MFMailComposeViewController *mailPicker = [[MFMailComposeViewController alloc] init];
    mailPicker.mailComposeDelegate = self;
    
    [mailPicker setSubject:@"HHWeather feed back"];
    
    NSArray *toRecipients = [NSArray arrayWithObject:@"herbert7789@hotmail.com"];
    [mailPicker setToRecipients:toRecipients];
    
    NSString *emailBody = @"</font>正文";
    [mailPicker setMessageBody:emailBody isHTML:YES];
    [self presentViewController:mailPicker animated:YES completion:nil];
    
}

#pragma mark - MFMailComposeViewController delegate
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSString *message;
    
    switch (result) {
        case MFMailComposeResultCancelled:
            message = @"User cancel to edit the mail.";
            break;
        case MFMailComposeResultSaved:
            message = @"User has succeed in saving mail.";
            break;
        case MFMailComposeResultSent:
            message = @"User has tapped button for sending. The mail is in the queue.";
            break;
        default:
            message = @"";
            break;
    }
    
    NSLog(@"%@", message);
}


@end
