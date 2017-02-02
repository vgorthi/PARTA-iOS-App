//
//  UITextField+Extensions.h
//  HH-Pulse
//
//  Created by Srinivas Jayanthi on 03/06/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//


#include <UIKit/UIKit.h>

@interface UITextField (Extensions)

+ (UITextField *)textFieldWithPlaceHolder:(NSString *)placeHolder
                                      Font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                              cornerRadius:(CGFloat)cornerRadius
                                  leftView:(UIView *)leftView
                                 rightView:(UIView *)rightView
                             textAlignment:(NSTextAlignment)textAlignment
                                  delegate:(id)delegate;

@end
