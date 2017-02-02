//
//  TView.m
//  Texci
//
//  Created by Srinivas on 29/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TView.h"

@interface TView()

@property (nonatomic, assign) CGRect screenRect;

@end

@implementation TView

- (instancetype)init;
{
    self = [super init];
    if (self) {
        [self setScreenRect:[[UIScreen mainScreen] bounds]];
    }
    return self;
}

- (void)setupSubViews;
{
    
}

- (CGRect)screenBounds;
{
    return [self screenRect];
}

- (CGFloat)width:(CGFloat)widthPercentage;
{
    return self.screenRect.size.width*widthPercentage/100;
}

- (CGFloat)height:(CGFloat)heightPercentage;
{
    return self.screenRect.size.height*heightPercentage/100;
}

- (CGFloat)width:(CGFloat)widthPercentage baseView:(UIView *)baseView;
{
    return baseView.frame.size.width*widthPercentage/100;
}

- (CGFloat)height:(CGFloat)heightPercentage baseView:(UIView *)baseView;
{
    return baseView.frame.size.height*heightPercentage/100;
}

@end
