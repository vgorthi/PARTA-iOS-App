//
//  TCustomNavigationController.m
//  Texci
//
//  Created by pavan krishna on 03/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TNavigationController.h"

@implementation TNavigationController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureBar];
    }
    return self;
}

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController;
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self configureBar];
    }
    return self;
}

-(void)configureBar;
{
    [[self navigationBar] setTranslucent:NO];
    
    [[self navigationBar] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[self navigationBar] setShadowImage:[[UIImage alloc] init]];
    [[self navigationBar] setTintColor:[UIColor colorWithRed:0.99 green:0.81 blue:0.23 alpha:1]];
    [[self navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    [[self navigationBar] setBarTintColor:[UIColor colorWithRed:0.99 green:0.81 blue:0.23 alpha:1]];
}

@end
