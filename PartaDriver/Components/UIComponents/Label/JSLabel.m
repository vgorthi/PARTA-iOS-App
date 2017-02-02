//
//  JSLabel.m
//  Texci
//
//  Created by Srinivas on 07/09/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "JSLabel.h"

@implementation JSLabel

- (instancetype)initWithText:(NSString *)text textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroundColor textAlignment:(NSTextAlignment)alignment;
{
    self = [super init];
    if (self) {
        
        [self setText:text];
        [self setTextColor:textColor];
        [self setTextAlignment:alignment];
        [self setBackgroundColor:backgroundColor];
    }
    return self;
}

- (void)setNumberOfLines:(NSInteger)numberOfLines andPreferredWidth:(CGFloat)width;
{
    [self setNumberOfLines:numberOfLines];
    [self setPreferredMaxLayoutWidth:width];
}

@end
