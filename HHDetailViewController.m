//
//  HHDetailViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/3/14.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHDetailViewController.h"

#import "HHWeatherButton.h"

@interface HHDetailViewController ()

@property (nonatomic, strong) HHWeatherButton *button_1;
@property (nonatomic, strong) HHWeatherButton *button_2;
@property (nonatomic, strong) HHWeatherButton *button_3;

@property (nonatomic) BOOL firstOpen;
@property (nonatomic) BOOL secondOpen;
@property (nonatomic) BOOL thirdOpen;

@end

@implementation HHDetailViewController

#pragma mark - Controller life cycle
- (instancetype) init {
    
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

#pragma mark - View life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _button_1 = [[HHWeatherButton alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 538)];
    _button_1.backgroundColor = [UIColor colorWithRed:241/255.0 green:196/255.0 blue:15/255.0 alpha:1.0];
    [_button_1 addTarget:self action:@selector(firstButtonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button_1];
    
    _button_2 = [[HHWeatherButton alloc] initWithFrame:CGRectMake(0, 538, self.view.bounds.size.width, 64.5)];
    _button_2.backgroundColor = [UIColor colorWithRed:41/255.0 green:128/255.0 blue:185/255.0 alpha:1.0];
    [_button_2 addTarget:self action:@selector(secondButtonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button_2];
    
    _button_3 = [[HHWeatherButton alloc] initWithFrame:CGRectMake(0, 602.5, self.view.bounds.size.width, 64.5)];
    _button_3.backgroundColor = [UIColor colorWithRed:211/255.0 green:84/255.0 blue:0.0 alpha:1.0];
    [_button_3 addTarget:self action:@selector(thirdButtonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button_3];
    
    // Configure the weather data
    _button_1.dayLabel.text = @"Today";
    _button_1.cityLabel.text = @"WuHan";
    _button_1.weatherImageView.image = [UIImage imageNamed:@"Sunny"];
    _button_1.weatherLabel.text = @"Sunshine";
    _button_1.tempLabel.text = @"16";
    _button_1.windLabel.text = @"Breeze";
    _button_1.humidityLabel.text = @"42%";
    
    
    _button_2.dayLabel.text = @"Tomorrow";
    _button_2.cityLabel.text = @"";
    _button_2.weatherImageView.image = [UIImage imageNamed:@"Rain"];
    _button_2.weatherLabel.text = @"Rain";
    _button_2.tempLabel.text = @"7";
    _button_2.windLabel.text = @"Gale";
    _button_2.humidityLabel.text = @"87%";
    
    _button_3.dayLabel.text = @"The Day After Tomorrow";
    _button_3.cityLabel.text = @"";
    _button_3.weatherImageView.image = [UIImage imageNamed:@"Sizzler"];
    _button_3.weatherLabel.text = @"Sizzler";
    _button_3.tempLabel.text = @"31";
    _button_3.windLabel.text = @"Breeze";
    _button_3.humidityLabel.text = @"21%";
    
    _firstOpen = YES;
    _secondOpen = NO;
    _thirdOpen = NO;
    
    // Back button
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(306, 18, 65, 35)];
    [backButton addTarget:self action:@selector(backButtonIsTapped:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setImage:[UIImage imageNamed:@"downButton"] forState:UIControlStateNormal];
    backButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:backButton];
    
}

#pragma mark - Action
- (void) firstButtonIsTapped:(id)sender {
    
    if (!self.firstOpen) {
        
        self.firstOpen = YES;
        
        // 放大 button_1
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.button_1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 538);
        } completion:NULL];
        
        if (self.secondOpen) {
            
            // 缩小 button_2
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_2.frame = CGRectMake(0, 538, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            self.secondOpen = NO;
            
        } else {
            
            // 向下平移 button_2
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_2.frame = CGRectMake(0, 538, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            // 缩小 button_3
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_3.frame = CGRectMake(0, 538+64.5, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            self.thirdOpen = NO;
        }
    }
}

- (void) secondButtonIsTapped:(id)sender {
    
    if (!self.secondOpen) {
        
        self.secondOpen = YES;
        
        // 放大 button_2
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.button_2.frame = CGRectMake(0, 64.5, self.view.bounds.size.width, 538);
        } completion:NULL];
        
        if (self.firstOpen) {
            
            NSLog(@"3");
            // 缩小 button_1
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            self.firstOpen = NO;
            
        } else {
            
            NSLog(@"4");
            // 缩小 button_3
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_3.frame = CGRectMake(0, 538+64.5, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            self.thirdOpen = NO;
        }
        
        
    }
}

- (void) thirdButtonIsTapped:(id)sender {
    
    if (!self.thirdOpen) {
        
        self.thirdOpen = YES;
        // 放大 button_3
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
            self.button_3.frame = CGRectMake(0, 64.5*2, self.view.bounds.size.width, 538);
        } completion:NULL];
        
        if (self.firstOpen) {
            
            // 缩小 button_1
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_1.frame = CGRectMake(0, 0, self.view.bounds.size.width, 64.5);
            } completion:NULL];
            
            self.firstOpen = NO;
            
            // 向上平移button_2
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_2.frame = CGRectMake(0, 64.5, self.view.bounds.size.width, 64.5*2);
            } completion:NULL];
            
        } else {
            
            // 缩小 button_2
            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:5.0 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                self.button_2.frame = CGRectMake(0, 64.5, self.view.bounds.size.width, 64.5*2);
            } completion:NULL];
            
            self.secondOpen = NO;
        }
    }
}

- (void) backButtonIsTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
