//
//  TECButton.h
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSButton : UIButton

- (void)setCornerRadius:(CGFloat)radius;

- (instancetype)initWithImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor;

- (instancetype)initWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor andFont:(UIFont *)font;

- (void)setShadowColor:(UIColor *)color opacity:(float)opacity radius:(CGFloat)radius offset:(CGSize)offset masksToBounds:(BOOL)shouldMaskToBounds;

@end
