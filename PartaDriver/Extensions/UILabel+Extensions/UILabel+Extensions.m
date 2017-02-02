//
//  UILabel+Extensions.m
//  Katch
//
//  Created by Srinivas Jayanthi on 23/01/15.
//  Copyright (c) 2015 Hedgehoglab. All rights reserved.
//

#import "UILabel+Extensions.h"

#import <QuartzCore/QuartzCore.h>

@implementation UILabel (Extensions)

+ (UILabel *)labelWithText:(NSString *)text
                 usingFont:(UIFont *)font
                 textColor:(UIColor *)textColor
           backGroundColor:(UIColor *)backGroundColor
             withAlignment:(NSInteger)alignment;
{
    UILabel *label = [[UILabel alloc] init];;
    
    [label setText:text];
    [label setFont:font];
    [label setTextColor:textColor];
    [label setBackgroundColor:backGroundColor];
    [label setTextAlignment:alignment];
    
    return label;
}


+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
           backGroundColor:(UIColor *)backGroundColor
             withAlignment:(NSInteger)alignment;
{
    
    UILabel *label = [[UILabel alloc] init];

    [label setFont:font];
    [label setTextColor:textColor];
    [label setBackgroundColor:backGroundColor];
    
    return label;
}

@end
