//
//  PulldownMenu.m
//
//  Created by Bernard Gatt
//

#import "PulldownMenu.h"
#import "CustomMenuCell.h"

@implementation PulldownMenu

@synthesize menuList,
            handle,
            cellHeight,
            handleHeight,
            animationDuration,
            topMarginLandscape,
            topMarginPortrait,
            cellColor,
            cellFont,
            cellTextColor,
            cellSelectedColor,
            cellSelectionStyle,
            fullyOpen,
            delegate;

- (id)init
{
    self = [super init];
    
    menuItems = [[NSMutableArray alloc] init];
    
    // Setting defaults
    cellHeight = 50.0f;
    handleHeight = 0.0f;
    animationDuration = 0.3f;
    topMarginPortrait = 0;
    topMarginLandscape = 0;
    cellColor = [UIColor colorWithRed:44/255.0 green:111/255.0 blue:154/255.0 alpha:1.0];
    cellSelectedColor = [UIColor colorWithRed:169/255.0 green:204/255.0 blue:219/255.0 alpha:1.0];
    cellFont = [UIFont fontWithName:@"AvenirNext-Utralight" size:19.0f];
    cellTextColor = [UIColor whiteColor];
    cellSelectionStyle = UITableViewCellSelectionStyleDefault;
    
//    cellHeight = 60.0f;
//    handleHeight = 15.0f;
//    animationDuration = 0.3f;
//    topMarginPortrait = 0;
//    topMarginLandscape = 0;
//    cellColor = [UIColor grayColor];
//    cellSelectedColor = [UIColor blackColor];
//    cellFont = [UIFont fontWithName:@"GillSans-Bold" size:19.0f];
//    cellTextColor = [UIColor whiteColor];
//    cellSelectionStyle = UITableViewCellSelectionStyleDefault;

    
    return self;
}

- (id)initWithNavigationController:(UINavigationController *)navigationController
{
    self = [self init];
    
    if (self)
    {
        [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
        [[NSNotificationCenter defaultCenter] addObserver: self
                                                 selector: @selector(deviceOrientationDidChange:)
                                                     name: UIDeviceOrientationDidChangeNotification
                                                   object: nil];
        
        masterNavigationController = navigationController;
        
        navigationDragGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragMenu:)];
        navigationDragGestureRecognizer.minimumNumberOfTouches = 1;
        navigationDragGestureRecognizer.maximumNumberOfTouches = 1;
        
        handleDragGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragMenu:)];
        handleDragGestureRecognizer.minimumNumberOfTouches = 1;
        handleDragGestureRecognizer.maximumNumberOfTouches = 1;
        
        [masterNavigationController.navigationBar addGestureRecognizer:navigationDragGestureRecognizer];
        
        masterView = masterNavigationController.view;
    }
    
    return self;
}

- (id)initWithView:(UIView *)view
{
    self = [self init];
    
    if (self)
    {
        topMargin = 0;
        masterView = view;
    }
    
    return self;
}

- (void)loadMenu
{
    tableHeight = ([menuItems count] * cellHeight);
    
    [self updateValues];
    
    [self setFrame:CGRectMake(0, 0, 0, tableHeight+handleHeight)];
    
    fullyOpen = NO;
    
    menuList = [[UITableView alloc] init];
    [menuList setRowHeight:cellHeight];
    [menuList setDataSource:self];
    [menuList setDelegate:self];
    [self addSubview:menuList];
    
    handle = [[UIView alloc] init];
    [handle setBackgroundColor:[UIColor blackColor]];
    
    [self addSubview:handle];
    
    handleDragGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragMenu:)];
    handleDragGestureRecognizer.minimumNumberOfTouches = 1;
    handleDragGestureRecognizer.maximumNumberOfTouches = 1;
    [handle addGestureRecognizer:handleDragGestureRecognizer];
    
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [handle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [menuList setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self createConstraints];
}

- (void)insertButton:(NSString *)title
{
    [menuItems addObject:title];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate menuItemSelected:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [menuItems count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    CustomMenuCell *cell = (CustomMenuCell *)[tableView dequeueReusableCellWithIdentifier:@"menuListCell"];
    
    if (cell == nil) {
        cell = [[CustomMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"menuListCell"];
    }
    
    cell.backgroundColor = cellColor;
     
    UIView *cellSelectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cellSelectedBackgroundView.backgroundColor = cellSelectedColor;
    cell.selectedBackgroundView = cellSelectedBackgroundView;
    cell.selectionStyle = cellSelectionStyle;
    
//    [cell.textLabel setTextColor:cellTextColor];
//    cell.textLabel.font = cellFont;
//    [cell.textLabel setText:[menuItems objectAtIndex:indexPath.item]];
    
    NSArray *imageNamesArray = @[@"setting_icon",
                                 @"AboutMe_icon",
                                 @"feedBack_icon"];
//    NSArray *textArray = @[@"Settings",
//                           @"Profile",
//                           @"Feed back"];
    
    NSArray *textArray = @[@"设置",
                           @"关于我",
                           @"意见反馈"];
    
    [cell.customImageView setImage:[UIImage imageNamed:[imageNamesArray objectAtIndex:indexPath.row]]];
    cell.customLabel.text = [textArray objectAtIndex:indexPath.row];
 
    return cell;
}

- (void)dragMenu:(UIPanGestureRecognizer *)sender
{
    if ([sender state] == UIGestureRecognizerStateChanged)
    {
        CGPoint gesturePosition = [sender translationInView:masterNavigationController.navigationBar];
        CGPoint newPosition = gesturePosition;
        
        newPosition.x = self.frame.size.width / 2;
        
        if (fullyOpen)
        {
            if (newPosition.y < 0)
            {
                newPosition.y += ((self.frame.size.height / 2) + topMargin);
                
                [self setCenter:newPosition];
            }
        }
        else
        {
            newPosition.y += -((self.frame.size.height / 2) - topMargin);
            
            if (newPosition.y <= ((self.frame.size.height / 2) + topMargin))
            {
                [self setCenter:newPosition];
            }
        }
    }
    else if ([sender state] == UIGestureRecognizerStateEnded)
    {
        [self animateDropDown];
    }
}

- (void)animateDropDown
{
    
    [UIView animateWithDuration: animationDuration
                          delay: 0.0
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         if (fullyOpen)
                         {
                             
                             self.center = CGPointMake(self.frame.size.width / 2, -((self.frame.size.height / 2) + topMargin));
                             fullyOpen = NO;
                         }
                         else
                         {
                             self.center = CGPointMake(self.frame.size.width / 2, ((self.frame.size.height / 2) + topMargin));
                             fullyOpen = YES;
                         }
                     }
                     completion:^(BOOL finished){
                         [delegate pullDownAnimated:fullyOpen];
                     }];
}

- (void)createConstraints
{
    
    NSLayoutConstraint *pullDownTopPositionConstraint = [NSLayoutConstraint
                                                         constraintWithItem:self
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                         toItem:masterView
                                                         attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                         constant:-self.frame.size.height];
    
    NSLayoutConstraint *pullDownCenterXPositionConstraint = [NSLayoutConstraint
                                                             constraintWithItem:self
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:masterView
                                                             attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.0
                                                             constant:0];
    
    NSLayoutConstraint *pullDownWidthConstraint = [NSLayoutConstraint
                                                   constraintWithItem:self
                                                   attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:masterView
                                                   attribute:NSLayoutAttributeWidth
                                                   multiplier:1.0
                                                   constant:0];
    
    NSLayoutConstraint *pullDownHeightMaxConstraint = [NSLayoutConstraint
                                                       constraintWithItem:self
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationLessThanOrEqual
                                                       toItem:masterView
                                                       attribute:NSLayoutAttributeHeight
                                                       multiplier:0.5
                                                       constant:0];
    
    pullDownHeightMaxConstraint.priority = 1000;
    
    NSLayoutConstraint *pullDownHeightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:self
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:0
                                                    toItem:nil
                                                    attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0
                                                    constant:tableHeight+handleHeight];
    
    pullDownHeightConstraint.priority = 900;
    
    NSLayoutConstraint *pullHandleWidthConstraint = [NSLayoutConstraint
                                                     constraintWithItem:handle
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                     toItem:masterView
                                                     attribute:NSLayoutAttributeWidth
                                                     multiplier:1.0
                                                     constant:0];
    
    NSLayoutConstraint *pullHandleHeightConstraint = [NSLayoutConstraint
                                                      constraintWithItem:handle
                                                      attribute:NSLayoutAttributeHeight
                                                      relatedBy:0
                                                      toItem:nil
                                                      attribute:NSLayoutAttributeNotAnAttribute
                                                      multiplier:1.0
                                                      constant:handleHeight];
    
    NSLayoutConstraint *pullHandleBottomPositionConstraint = [NSLayoutConstraint
                                                              constraintWithItem:handle
                                                              attribute:NSLayoutAttributeBottom
                                                              relatedBy:NSLayoutRelationEqual
                                                              toItem:self
                                                              attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                              constant:0];
    
    NSLayoutConstraint *pullHandleCenterPositionConstraint = [NSLayoutConstraint
                                                              constraintWithItem:handle
                                                              attribute:NSLayoutAttributeCenterX
                                                              relatedBy:0
                                                              toItem:self
                                                              attribute:NSLayoutAttributeCenterX
                                                              multiplier:1.0
                                                              constant:0];
    
    NSLayoutConstraint *menuListHeightMaxConstraint = [NSLayoutConstraint
                                                       constraintWithItem:menuList
                                                       attribute:NSLayoutAttributeHeight
                                                       relatedBy:NSLayoutRelationLessThanOrEqual
                                                       toItem:masterView
                                                       attribute:NSLayoutAttributeHeight
                                                       multiplier:1.0
                                                       constant:-topMargin];
    
    NSLayoutConstraint *menuListHeightConstraint = [NSLayoutConstraint
                                                    constraintWithItem:menuList
                                                    attribute:NSLayoutAttributeHeight
                                                    relatedBy:NSLayoutRelationEqual
                                                    toItem:self
                                                    attribute:NSLayoutAttributeHeight
                                                    multiplier:1.0
                                                    constant:-handleHeight];
    
    NSLayoutConstraint *menuListWidthConstraint = [NSLayoutConstraint
                                                   constraintWithItem:menuList
                                                   attribute:NSLayoutAttributeWidth
                                                   relatedBy:NSLayoutRelationEqual
                                                   toItem:self
                                                   attribute:NSLayoutAttributeWidth
                                                   multiplier:1.0
                                                   constant:0];
    
    NSLayoutConstraint *menuListCenterXPositionConstraint = [NSLayoutConstraint
                                                             constraintWithItem:menuList
                                                             attribute:NSLayoutAttributeCenterX
                                                             relatedBy:NSLayoutRelationEqual
                                                             toItem:self
                                                             attribute:NSLayoutAttributeCenterX
                                                             multiplier:1.0
                                                             constant:0];
    
    NSLayoutConstraint *menuListTopPositionConstraint = [NSLayoutConstraint
                                                         constraintWithItem:menuList
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                         toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                         constant:0];
    
    [masterView addConstraint: pullDownTopPositionConstraint];
    [masterView addConstraint: pullDownCenterXPositionConstraint];
    [masterView addConstraint: pullDownWidthConstraint];
    [masterView addConstraint: pullDownHeightConstraint];
    [masterView addConstraint: pullDownHeightMaxConstraint];
    
    [masterView addConstraint: pullHandleHeightConstraint];
    [masterView addConstraint: pullHandleWidthConstraint];
    [masterView addConstraint: pullHandleBottomPositionConstraint];
    [masterView addConstraint: pullHandleCenterPositionConstraint];
    
    [masterView addConstraint: menuListHeightMaxConstraint];
    [masterView addConstraint: menuListHeightConstraint];
    [masterView addConstraint: menuListWidthConstraint];
    [masterView addConstraint: menuListCenterXPositionConstraint];
    [masterView addConstraint: menuListTopPositionConstraint];
    
}

- (void)deviceOrientationDidChange:(NSNotification *)notification
{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    
    if (orientation == UIDeviceOrientationFaceUp || orientation == UIDeviceOrientationFaceDown || orientation == UIDeviceOrientationUnknown || currentOrientation == orientation) {
        return;
    }
    
    currentOrientation = orientation;
    
    [self performSelector:@selector(orientationChanged) withObject:nil afterDelay:0];
}

- (void)orientationChanged
{
    [self updateValues];
    
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if ((UIDeviceOrientationIsPortrait(currentOrientation) && UIDeviceOrientationIsPortrait(orientation)) ||
        (UIDeviceOrientationIsLandscape(currentOrientation) && UIDeviceOrientationIsLandscape(orientation))) {
        
        currentOrientation = orientation;
        
        if (fullyOpen)
        {
            [self animateDropDown];
        }
        
        return;
    }
}

- (void)updateValues
{
    topMargin = 0;
    
    BOOL isStatusBarShowing = ![[UIApplication sharedApplication] isStatusBarHidden];
    
    if (UIInterfaceOrientationIsLandscape(self.window.rootViewController.interfaceOrientation)) {
        if (isStatusBarShowing) { topMargin = [UIApplication.sharedApplication statusBarFrame].size.width; }
        topMargin += topMarginLandscape;
    }
    else
    {
        if (isStatusBarShowing) { topMargin = [UIApplication.sharedApplication statusBarFrame].size.height; }
        topMargin += topMarginPortrait;
    }
    
    if (masterNavigationController != nil)
    {
        topMargin += masterNavigationController.navigationBar.frame.size.height;
    }
}

@end
