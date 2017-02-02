//
//  UIButton+Extensions.h
//  Katch
//
//  Created by Srinivas Jayanthi on 23/01/15.
//  Copyright (c) 2015 Hedgehoglab. All rights reserved.
//


#include <UIKit/UIKit.h>

@interface UIButton (Extensions)

+ (UIButton *)buttonWithTitle:(NSString *)title
              backgroundColor:(UIColor *)backgroundColor
                    textColor:(UIColor *)textColor
                      andFont:(UIFont *)font
                  usingAction:(SEL)action
                    forTarget:(id)target;

+ (UIButton *)buttonWithImage:(UIImage *)image
                  backgroundColor:(UIColor *)backgroundColor
                      usingAction:(SEL)action
                        forTarget:(id)target;

@end
