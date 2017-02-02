//
//  TLoginController.m
//  Texci
//
//  Created by pavan krishna on 30/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TLoginController.h"

@interface TLoginController ()

@end

@implementation TLoginController

@synthesize dataSource;
@synthesize delegate;

- (void)loadView;
{
    [super loadView];
    
    [[self loginView] setDataSource:self];
    [[self loginView] setDelegate:self];
    [self setView:[self loginView]];
}

- (void)viewDidLoad {
    [super viewDidLoad];

   // [[self navigationController] setNavigationBarHidden:YES animated:NO];
    
    [[self loginView] setupSubViews];
}

#pragma mark -  Delegate methods;

- (void)createAccountButtonPressed;
{
    [[self delegate] createAccountButtonPressed];
}

- (void)takeALookButtonPressed;
{
    [[self delegate] takeALookButtonPressed];
}

- (void)forgotPinButtonPressed;
{
    [[self delegate] forgotPinButtonPressed];
}

- (void)loginButtonPressed;
{
    [[self delegate] loginComplete];
}

@end
