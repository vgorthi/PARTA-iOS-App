//
//  UITextView+Extensions.m
//  HH-Pulse
//
//  Created by Srinivas Jayanthi on 13/05/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#import "UITextView+Extensions.h"

@implementation UITextView (Extensions)

+ (UITextView *)textViewUsingFont:(UIFont *)font
                        textColor:(UIColor *)textcolor
                  backgroundColor:(UIColor *)backgroundColor
                    textAlignment:(NSTextAlignment)textAlignment
                     cornerRadius:(CGFloat)radius
                           insets:(UIEdgeInsets)insets
                        tintColor:(UIColor *)tintColor
                      andDelegate:(id<UITextViewDelegate>)delegate;
{
    UITextView *textView = [[UITextView alloc] init];
    
    [textView setFont:font];
    [textView setTextColor:textcolor];
    [textView setBackgroundColor:backgroundColor];
    [textView setTextAlignment:textAlignment];
    [[textView layer] setCornerRadius:radius];
    [textView setTextContainerInset:insets];
    [textView setDelegate:delegate];
    
    return textView;
}




@end
