//
//  JSTextField.h
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTextField : UITextField

- (void)setCornerRadius:(CGFloat)radius;

- (void)setLeftView:(UIView *)leftView withMode:(UITextFieldViewMode)mode;

- (void)setRightView:(UIView *)rightView withMode:(UITextFieldViewMode)mode;

- (void)setBorderColor:(UIColor *)borderColor andBorderWidth:(CGFloat)borderWidth;

- (instancetype)initWithPlaceHolder:(NSString *)placeHolder backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)alignment;

@end
