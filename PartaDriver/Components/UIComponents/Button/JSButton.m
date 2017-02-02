//
//  TECButton.m
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "JSButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation JSButton

- (instancetype)initWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor andFont:(UIFont *)font;
{
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
        [self setTitleColor:textColor forState:UIControlStateNormal];
        [[self titleLabel] setFont:font];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor;
{
    self = [super init];
    if (self) {
        
        [self setImage:image forState:UIControlStateNormal];
        [self setBackgroundColor:backgroundColor];
    }
    return self;
}

- (void)setCornerRadius:(CGFloat)radius;
{
    self.layer.cornerRadius = radius;
}

- (void)setShadowColor:(UIColor *)color opacity:(float)opacity radius:(CGFloat)radius offset:(CGSize)offset masksToBounds:(BOOL)shouldMaskToBounds;
{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = radius;
    self.layer.shadowOpacity = opacity;
    self.layer.masksToBounds = shouldMaskToBounds;
}


@end
