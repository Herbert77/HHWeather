//
//  HHHomeViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHHomeViewController.h"
#import "HHWeatherCell.h"

@interface HHHomeViewController ()

@end

@implementation HHHomeViewController

#pragma mark - View Controller life cycle
- (instancetype) init {
    
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        
        UINavigationItem *navItem = self.navigationItem;
        
        // Title
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:20];
        titleLabel.text = @"  Weather °";
        titleLabel.textColor = [UIColor colorWithRed:236/255.0 green:240/255.0 blue:241/255.0 alpha:1.0];
        
        navItem.titleView = titleLabel;
        
        // Left bar button item
        UIBarButtonItem *menuButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(menuButtonTapped:)];
        
        navItem.leftBarButtonItem = menuButtonItem;
        
        // Right bar button item
        UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(addButtonTapped:)];
        
        navItem.rightBarButtonItem = addButtonItem;
        
        self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BackgroundImage"]];
        
        // remove the separator between the cells
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        // Editing Mode
        
    }
    
    return self;
}

- (instancetype) initWithStyle:(UITableViewStyle)style {
    
    return [self init];
}

#pragma mark - View life cycle
- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    // TODO:search the font
//    for (NSString *familyName in [UIFont familyNames]) {
//
//        NSLog(@"%@", familyName);
//        
//        for (NSString *font in [UIFont fontNamesForFamilyName:familyName]) {
//            
//            NSLog(@"%@", font);
//        }
//    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"HHWeatherCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"HHWeatherCell"];
    
}

#pragma mark - Action
- (void) menuButtonTapped:(id)sender {
    
    // TODO: menuButtonTapped:
}

- (void) addButtonTapped:(id)sender {
    
    // TODO: addButtonTapped:
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // TODO: configure numberOfRows
    return 5;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO: return the cell
    static NSString *identifier = @"weatherCell";
    
    HHWeatherCell *cell = (HHWeatherCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[HHWeatherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.cityNameLabel.text = @"WuHan";
    cell.weatherImageView.image = [UIImage imageNamed:@"Sunny"];
    cell.tempLabel.text = @"7° C";
    cell.backgroundColor = [UIColor colorWithRed:241/255.0 green:196/255.0 blue:15/255.0 alpha:1.0];
    
    return cell;
}

// configure hight of the cell
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 76;
}

- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // TODO: Delete the weather city from the data Modal
        
        // Delete the cells on the basis of indexPath
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
}

@end
