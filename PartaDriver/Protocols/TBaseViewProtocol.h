//
//  TBaseViewProtocol.h
//  Texci
//
//  Created by Srinivas on 29/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TBaseViewProtocol <NSObject>

- (void)setupSubViews;
- (CGRect)screenBounds;
- (CGFloat)width:(CGFloat)widthPercentage;
- (CGFloat)height:(CGFloat)heightPercentage;
- (CGFloat)width:(CGFloat)widthPercentage baseView:(UIView *)baseView;
- (CGFloat)height:(CGFloat)heightPercentage baseView:(UIView *)baseView;

@end
