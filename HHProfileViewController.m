//
//  HHProfileViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/3.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHProfileViewController.h"

@interface HHProfileViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation HHProfileViewController

- (instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
