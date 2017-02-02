//
//  JSTextField.m
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "JSTextField.h"

@implementation JSTextField

- (void)setCornerRadius:(CGFloat)radius;
{
    self.layer.cornerRadius = radius;
}

- (void)setLeftView:(UIView *)leftView withMode:(UITextFieldViewMode)mode;
{
    self.leftView = leftView;
    self.leftViewMode = mode;
}

- (void)setRightView:(UIView *)rightView withMode:(UITextFieldViewMode)mode;
{
    self.rightView = rightView;
    self.rightViewMode = mode;
}

- (void)setBorderColor:(UIColor *)borderColor andBorderWidth:(CGFloat)borderWidth;
{
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)alignment;
{
    self = [super init];
    
    if (self) {
        [self setTextColor:textColor];
        [self setTextAlignment:alignment];
        [self setPlaceholder:placeHolder];
        [self setBackgroundColor:backgroundColor];
    }
    return self;
}

@end
