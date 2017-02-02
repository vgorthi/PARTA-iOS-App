//
//  UILabel+Extensions.h
//  Katch
//
//  Created by Srinivas Jayanthi on 23/01/15.
//  Copyright (c) 2015 Hedgehoglab. All rights reserved.
//


#include <UIKit/UIKit.h>

@interface UILabel (Extensions)

+ (UILabel *)labelWithText:(NSString *)text
                 usingFont:(UIFont *)font
                 textColor:(UIColor *)textColor
           backGroundColor:(UIColor *)backGroundColor
             withAlignment:(NSInteger)alignment;

+ (UILabel *)labelWithFont:(UIFont *)font
                 textColor:(UIColor *)textColor
           backGroundColor:(UIColor *)backGroundColor
             withAlignment:(NSInteger)alignment;

@end
