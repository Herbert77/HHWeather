//
//  HHHomeViewController.m
//  HHWeather
//
//  Created by 胡传业 on 15/2/25.
//  Copyright (c) 2015年 NewThread. All rights reserved.
//

#import "HHHomeViewController.h"
#import "HHWeatherCell.h"
#import "HHMainTableViewController.h"
#import "HHNavigationController.h"

#import "HHWeatherItem.h"
#import "HHWeatherGroup.h"
#import "HHWeatherItemStation.h"

#import "HHWeatherColor.h"

#import "HHDetailViewController.h"

#import "HHDataManager.h"

#import "MONActivityIndicatorView.h"



@interface HHHomeViewController () <MONActivityIndicatorViewDelegate, UIAlertViewDelegate>

@property (nonatomic) MONActivityIndicatorView *indicatorView;

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
//        titleLabel.text = @" MiniWeather °";
        titleLabel.text = @" 迷你天气";
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
    
    // TODO:Check the network status
    
    //WithFrame:CGRectMake(250, 350, 100, 50)
    _indicatorView = [[MONActivityIndicatorView alloc] init];
    _indicatorView.delegate = self;
    _indicatorView.numberOfCircles = 5;
    _indicatorView.radius = 10;
    _indicatorView.internalSpacing = 3;
    _indicatorView.duration = 0.7;
    _indicatorView.delay = 0.10;
    _indicatorView.center = self.view.center;
    [self.view addSubview:_indicatorView];
    [_indicatorView startAnimating];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopAnimating) name:@"DataLoaded" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showAlertView) name:@"OffLine" object:nil];
      
    NSLog(@"self.netWorkAvailable %id", self.netWorkAvailable);
    
//    if (!self.netWorkAvailable) {
//        
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Notice" message:@"The netWork is not available." delegate:self cancelButtonTitle:@"done" otherButtonTitles: nil];
//        
//        [alertView show];
//    }
    
    [HHDataManager sharedDataManager].tableView = self.tableView;
    
    [[HHDataManager sharedDataManager] setCitys:[NSMutableArray arrayWithArray:@[@"武汉", @"北京", @"上海", @"广州"]]];
    

    NSMutableArray *citys = [[HHDataManager sharedDataManager] citys];
    
    [[HHDataManager sharedDataManager] requestWeatherDataForCity:citys[0]];
//    [self performSelector:@selector(requestData:) withObject:citys[0] afterDelay:0.1];
    [self performSelector:@selector(requestData:) withObject:citys[1] afterDelay:0.5];
    [self performSelector:@selector(requestData:) withObject:citys[2] afterDelay:0.9];
    [self performSelector:@selector(requestData:) withObject:citys[3] afterDelay:1.3];
    
    NSLog(@"%@", [[[HHDataManager sharedDataManager] citys] objectAtIndex:3]);
    

    
//    [self.tableView reloadData];
}

- (void)requestData:(NSString *)cityName {
    
    [[HHDataManager sharedDataManager] requestWeatherDataForCity:cityName];
}

- (void) viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    // Turn off the menu
    if (((HHNavigationController *)self.navigationController).menuIsOpen == YES) {
        
        [((HHNavigationController *)self.navigationController).pulldownMenu  animateDropDown];

    }
}



#pragma mark - Action
- (void) menuButtonTapped:(id)sender {
    
    // TODO: menuButtonTapped:
    [((HHNavigationController *)self.navigationController).pulldownMenu  animateDropDown];
}

- (void) addButtonTapped:(id)sender {
    
    // TODO: addButtonTapped:
//    HHMainTableViewController *mainTableViewController = [[HHMainTableViewController alloc] initWithStyle:UITableViewStylePlain];
    HHMainTableViewController *mainTableViewController = [[HHMainTableViewController alloc] init];
    [self.navigationController pushViewController:mainTableViewController animated:YES];
}

#pragma mark - Table view data source
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // TODO: configure numberOfRows
    return [[[HHWeatherItemStation sharedStation] allWeatherGroups] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO: return the cell
    static NSString *identifier = @"weatherCell";
    
    HHWeatherCell *cell = (HHWeatherCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        
        cell = [[HHWeatherCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    // TODO: Configure the content of the cell
    HHWeatherGroup *weatherGroup = [[[HHWeatherItemStation sharedStation] allWeatherGroups] objectForKey:[[[HHDataManager sharedDataManager] citys] objectAtIndex:indexPath.row]];
    
    NSMutableArray *weatherItems = [weatherGroup weatherItems];
    HHWeatherItem *displayedItem = [weatherItems objectAtIndex:0];
    
    NSLog(@"tableView ~~~~~~~~~~");

    // City name
    cell.cityNameLabel.text = displayedItem.cityName;
//    // Weather Image
////    cell.
    // Current temperature
    cell.tempLabel.text = displayedItem.currentTemp;
    
//    // Weather image
//    NSString *imageName = [NSString stringWithFormat:@"%@", item.weather];
    NSString *weatherType = [[HHDataManager sharedDataManager] typeForWeather:[displayedItem weather]];
    cell.weatherImageView.image = [UIImage imageNamed:weatherType];
    
    NSLog(@"%@", [[HHDataManager sharedDataManager] typeForWeather:[displayedItem weather]]);

    // Get the color pallete, then configure the backgroundColor of cells in accordance with weather
    HHWeatherColor *colorPallete = [HHWeatherColor sharedColorPalette];
    cell.backgroundColor = [colorPallete colorForWeather:weatherType];
    

    
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

#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HHDetailViewController *detailViewController = [[HHDetailViewController alloc] init];
    
    // TODO: Deliver the data for detail view
    detailViewController.cityName = [[[HHDataManager sharedDataManager] citys] objectAtIndex:indexPath.row];
    NSLog(@"detailViewController.cityName: %@", detailViewController.cityName);
    
    [self.navigationController presentViewController:detailViewController animated:YES completion:NULL];
    
   
    
}

#pragma mark - MONActivityIndicatorViewDelegate
- (UIColor *)activityIndicatorView:(MONActivityIndicatorView *)activityIndicatorView
      circleBackgroundColorAtIndex:(NSUInteger)index {
    
//    CGFloat red   = (arc4random() % 256)/255.0;
//    CGFloat green = (arc4random() % 256)/255.0;
//    CGFloat blue  = (arc4random() % 256)/255.0;
//    CGFloat alpha = 1.0f;
    UIColor *color = [[HHWeatherColor sharedColorPalette] colorForIndicatorColor:(int)(index+1)];
    
    return color;
}

#pragma mark - Stop Animating
- (void) stopAnimating {
    
    [self.indicatorView stopAnimating];
}

#pragma mark - OffLine
- (void) showAlertView {
    
    UIAlertView *alertView  = [[UIAlertView alloc] initWithTitle:@"警告" message:@"您的网络未连接，前检查蜂窝网络状况！" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil];
    
    [alertView show];
}



- (void) dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
