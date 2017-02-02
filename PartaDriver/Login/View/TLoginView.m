//
//  TLoginView.m
//  Texci
//
//  Created by pavan krishna on 30/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TLoginView.h"
#import <Masonry/Masonry.h>

@interface TLoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *categoryIcon;
@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *pinTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *forgotPinButton;
@property (nonatomic, strong) UILabel *touchIdTitle;
@property (nonatomic, strong) UIButton *createAccountButton;
@property (nonatomic, strong) UIButton *takeALookButton;

@end

@implementation TLoginView

@synthesize dataSource;
@synthesize delegate;

- (instancetype)init;
{
    self = [super init];
    if (self) {
        [self setFrame:[[UIScreen mainScreen] bounds]];
        [self setBackgroundColor:[UIColor colorWithRed:0.99 green:0.81 blue:0.23 alpha:1]];
        
        [self setupSubViews];

        // tell constraints they need updating
        [self setNeedsUpdateConstraints];
        
        // update constraints now so we can animate the change
        [self updateConstraintsIfNeeded];
    }
    return self;
}

-(void)setupSubViews;
{
    [self addSubview:[self categoryIcon]];
    [self addSubview:[self nameTextField]];
    [self addSubview:[self pinTextField]];
    [self addSubview:[self loginButton]];
    [self addSubview:[self forgotPinButton]];
    [self addSubview:[self touchIdTitle]];
    [self addSubview:[self createAccountButton]];
    [self addSubview:[self takeALookButton]];
}

-(void)updateConstraints;
{
    UIImage *img = [UIImage imageNamed:@"logo"];
    
    [[self categoryIcon] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset([super height:10]);
        make.centerX.equalTo(self);
        make.height.equalTo(@(img.size.height));
    }];
    
    [[self nameTextField] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self categoryIcon].mas_bottom).with.offset([super height:3]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [[self pinTextField] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self nameTextField].mas_bottom).with.offset([super height:2]);
        make.height.equalTo(@([super height:8]));
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
    }];
    
    [[self loginButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self pinTextField].mas_bottom).with.offset([super height:3]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [[self forgotPinButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self loginButton].mas_bottom).with.offset([super height:2]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [[self touchIdTitle] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self forgotPinButton].mas_bottom).with.offset([super height:1]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [[self createAccountButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self touchIdTitle].mas_bottom).with.offset([super height:3]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [[self takeALookButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo([self createAccountButton].mas_bottom).with.offset([super height:3]);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@([super height:8]));
    }];
    
    [super updateConstraints];
}

#pragma mark - Lazy loading

-(UIImageView *)categoryIcon;
{
    if (_categoryIcon) {
        return _categoryIcon;
    }
    
    _categoryIcon = [UIImageView new];
    [_categoryIcon setImage:[UIImage imageNamed:@"logo"]];
    [_categoryIcon setContentMode:UIViewContentModeScaleAspectFit];
    
    return _categoryIcon;
}

-(UITextField *)nameTextField;
{
    if (_nameTextField) {
        return _nameTextField;
    }
    
    _nameTextField = [UITextField textFieldWithPlaceHolder:@"Name" Font:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor] cornerRadius:2.0f leftView:nil rightView:nil textAlignment:NSTextAlignmentCenter delegate:self];
    [_nameTextField setBackgroundColor:[UIColor colorWithRed:1 green:0.85 blue:0.43 alpha:1]];
    [[_nameTextField layer] setMasksToBounds:YES];
    [[_nameTextField layer] setBorderColor:[UIColor clearColor].CGColor];
    [_nameTextField setKeyboardType:UIKeyboardTypeAlphabet];
    [_nameTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_nameTextField setAutocorrectionType:UITextAutocorrectionTypeNo];

    return _nameTextField;
}

-(UITextField *)pinTextField;
{
    if (_pinTextField) {
        return _pinTextField;
    }
    _pinTextField = [UITextField textFieldWithPlaceHolder:@"Pin" Font:[UIFont systemFontOfSize:15.0f] textColor:[UIColor blackColor] cornerRadius:2.0f leftView:nil rightView:nil textAlignment:NSTextAlignmentCenter delegate:self];
    [_pinTextField setBackgroundColor:[UIColor colorWithRed:1 green:0.85 blue:0.43 alpha:1]];
    [[_pinTextField layer] setMasksToBounds:YES];
    [[_pinTextField layer] setBorderColor:[UIColor clearColor].CGColor];
    [_pinTextField setKeyboardType:UIKeyboardTypeNumberPad];
    [_pinTextField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_pinTextField setAutocorrectionType:UITextAutocorrectionTypeNo];
    
    return _pinTextField;
}

-(UILabel *)touchIdTitle;
{
    if (_touchIdTitle) {
        return _touchIdTitle;
    }
    
    _touchIdTitle = [UILabel labelWithText:@"Alternatively sign in with your finger print" usingFont:[UIFont systemFontOfSize:13.0f] textColor:[UIColor whiteColor] backGroundColor:[UIColor clearColor] withAlignment:NSTextAlignmentCenter];
    [_touchIdTitle setNumberOfLines:2];
    
    return _touchIdTitle;
}

-(UIButton *)loginButton;
{
    if (_loginButton) {
        return _loginButton;
    }
    
    _loginButton = [UIButton buttonWithTitle:@"SIGN IN" backgroundColor:[UIColor colorWithRed:0.99 green:0.66 blue:0.13 alpha:1] textColor:[UIColor whiteColor] andFont:[UIFont boldSystemFontOfSize:15.0f] usingAction:@selector(loginButtonPressed) forTarget:self];
    [[_loginButton layer] setCornerRadius:[super height:8]/2];
    
    return _loginButton;
}

-(UIButton *)forgotPinButton;
{
    if (_forgotPinButton) {
        return _forgotPinButton;
    }
    
    _forgotPinButton = [UIButton buttonWithTitle:@"FORGOT PIN" backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] andFont:[UIFont boldSystemFontOfSize:13.0f] usingAction:@selector(forgotPinButtonPressed) forTarget:self];
    _forgotPinButton.layer.shadowColor = [UIColor blackColor].CGColor;
    _forgotPinButton.layer.shadowOpacity = 0.0;
    _forgotPinButton.layer.shadowRadius = 0.0;
    _forgotPinButton.layer.shadowOffset = CGSizeMake(0, 0);
    
    return _forgotPinButton;
}

-(UIButton *)createAccountButton;
{
    if (_createAccountButton) {
        return _createAccountButton;
    }
    
    _createAccountButton = [UIButton buttonWithTitle:@"CREATE ACCOUNT" backgroundColor:[UIColor whiteColor] textColor:[UIColor colorWithRed:0.99 green:0.81 blue:0.23 alpha:1] andFont:[UIFont boldSystemFontOfSize:15.0f] usingAction:@selector(createAccountButtonPressed) forTarget:self];
    [[_createAccountButton layer] setCornerRadius:[super height:8]/2];
    
    return _createAccountButton;
}

-(UIButton *)takeALookButton;
{
    if (_takeALookButton) {
        return _takeALookButton;
    }
    
    _takeALookButton = [UIButton buttonWithTitle:@"Take a look" backgroundColor:[UIColor clearColor] textColor:[UIColor whiteColor] andFont:[UIFont boldSystemFontOfSize:13.0f] usingAction:@selector(takeALookButtonPressed) forTarget:self];
    _takeALookButton.layer.shadowColor = [UIColor blackColor].CGColor;
    _takeALookButton.layer.shadowOpacity = 0.0;
    _takeALookButton.layer.shadowRadius = 0.0;
    _takeALookButton.layer.shadowOffset = CGSizeMake(0, 0);
    
    return _takeALookButton;
}

#pragma mark - ActionMethods

-(void)createAccountButtonPressed;
{
    [[self delegate] createAccountButtonPressed];
}

-(void)takeALookButtonPressed;
{
    [[self delegate] takeALookButtonPressed];
}

-(void)forgotPinButtonPressed;
{
    [[self delegate] forgotPinButtonPressed];
}

- (void)loginButtonPressed;
{
    [[self delegate] loginButtonPressed];
}
@end
