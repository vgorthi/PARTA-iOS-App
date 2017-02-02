//
//  UITextField+Extensions.m
//  HH-Pulse
//
//  Created by Srinivas Jayanthi on 03/06/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#import "UITextField+Extensions.h"

@implementation UITextField (Extensions)


+ (UITextField *)textFieldWithPlaceHolder:(NSString *)placeHolder
                                      Font:(UIFont *)font
                                 textColor:(UIColor *)textColor
                              cornerRadius:(CGFloat)cornerRadius
                                  leftView:(UIView *)leftView
                                 rightView:(UIView *)rightView
                             textAlignment:(NSTextAlignment)textAlignment
                                  delegate:(id)delegate;
{
    
    UITextField *textField = [UITextField new];
    
    [textField setPlaceholder:placeHolder];
    [textField setFont:font];
    [textField setTextColor:textColor];
    [[textField layer] setCornerRadius:cornerRadius];
    [textField setLeftView:leftView];
    [textField setRightView:rightView];
    [textField setTextAlignment:textAlignment];
    [textField setDelegate:delegate];
    [[textField layer] setBorderWidth:1.0f];
    
    return textField;
    
}

@end
