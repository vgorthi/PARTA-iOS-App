//
//  TUserTypeView.m
//  Texci
//
//  Created by Srinivas on 03/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TUserTypeView.h"
#import "Parta-Constants.pch"
#import <UIKit/UIKit.h>
#define MAS_SHORTHAND
#import <Masonry.h>
#import "UILabel+Extensions.h"
#import "UIButton+Extensions.h"
#import "UITextView+Extensions.h"
#import "UITextField+Extensions.h"
#import "UIImage+CCImage.h"

@interface TUserTypeView()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TUserTypeView

#pragma mark - InitMethods

- (instancetype)init;
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setupSubViews;
{
    [self addSubview:[self label]];
    [self addSubview:[self imageView]];
    
    [self setNeedsUpdateConstraints];
}


#pragma mark - constraints

- (void)updateConstraints;
{
    UIImage *image = [[self imageView] image];
    
    [super updateConstraints];
    
    [[self label] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).offset(-20);
    }];
    
    [[self imageView] mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.label.mas_top).offset(-15);
        make.width.equalTo(@(image.size.width));
        make.height.equalTo(@(image.size.height));
    }];
}


#pragma mark - LazyLoading

- (UILabel *)label;
{
    if (_label == nil) {
        
        _label = [UILabel labelWithFont:[UIFont italicSystemFontOfSize:12]
                              textColor:[UIColor whiteColor]
                        backGroundColor:[UIColor clearColor]
                          withAlignment:NSTextAlignmentCenter];
        
    }
    return _label;
}

- (UIImageView *)imageView;
{
    if (_imageView == nil) {
        
        _imageView = [UIImageView new];
    }
    return _imageView;
}


#pragma mark - InterfaceMethods

- (void)setUserTypeImageWith:(UIImage *)image;
{
    
    [[self imageView] setImage:image];
    [self setNeedsUpdateConstraints];
}

- (void)setUserTypeDescrition:(NSString *)userTypeDescription;
{
    [[self label] setText:userTypeDescription];
    [self setNeedsUpdateConstraints];
}

- (void)updateSelectedState:(TUserTypeSelectionState)state;
{
    if (state == TUserTypeSelectionStateSelected) {
        
        [[self imageView] setTintColor:[UIColor blackColor]];
    } else {
        [[self imageView] setTintColor:[UIColor whiteColor]];
    }
}

@end
