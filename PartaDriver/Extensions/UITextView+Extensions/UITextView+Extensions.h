//
//  UITextView+Extensions.h
//  HH-Pulse
//
//  Created by Srinivas Jayanthi on 13/05/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#include <UIKit/UIKit.h>

@interface UITextView (Extensions)

+ (UITextView *)textViewUsingFont:(UIFont *)font
                        textColor:(UIColor *)textcolor
                  backgroundColor:(UIColor *)backgroundColor
                    textAlignment:(NSTextAlignment)textAlignment
                     cornerRadius:(CGFloat)radius
                           insets:(UIEdgeInsets)insets
                        tintColor:(UIColor *)tintColor
                      andDelegate:(id<UITextViewDelegate>)delegate;

@end
