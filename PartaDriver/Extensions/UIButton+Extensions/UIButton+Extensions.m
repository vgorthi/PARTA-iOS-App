//
//  UIButton+Extensions.m
//  Katch
//
//  Created by Srinivas Jayanthi on 23/01/15.
//  Copyright (c) 2015 Hedgehoglab. All rights reserved.
//

#import "UIButton+Extensions.h"

@implementation UIButton (Extensions)

+ (UIButton *)buttonWithTitle:(NSString *)title
              backgroundColor:(UIColor *)backgroundColor
                    textColor:(UIColor *)textColor
                      andFont:(UIFont *)font
                  usingAction:(SEL)action
                    forTarget:(id)target;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [[button titleLabel] setFont:font];
    [button setBackgroundColor:backgroundColor];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[button titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    button.layer.shadowColor = [UIColor blackColor].CGColor;
    button.layer.shadowOpacity = 0.5;
    button.layer.shadowRadius = 0.5;
    button.layer.shadowOffset = CGSizeMake(0, 1.0f);
    
    return button;
}

+ (UIButton *)buttonWithImage:(UIImage *)image
                  backgroundColor:(UIColor *)backgroundColor
                      usingAction:(SEL)action
                        forTarget:(id)target;
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setBackgroundColor:backgroundColor];
    [button setImage:image forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    return button;
}

@end
