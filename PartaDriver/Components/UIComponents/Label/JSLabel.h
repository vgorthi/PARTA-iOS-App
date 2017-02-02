//
//  JSLabel.h
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSLabel : UILabel

- (void)setNumberOfLines:(NSInteger)numberOfLines andPreferredWidth:(CGFloat)width;

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)alignment;

@end
