//
//  CCDashedLine.h
//  Camping-Caravan
//
//  Created by Srinivas on 23/06/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCDashedLine : UIView

/**
 *  Set the line's thickness
 */
@property (nonatomic, assign) CGFloat thickness;

/**
 *  Set the line's color
 */
@property (nonatomic, copy) UIColor *color;

/**
 *  Set the length of the dash
 */
@property (nonatomic, assign) CGFloat dashedLength;

/**
 *  Set the gap between dashes
 */
@property (nonatomic, assign) CGFloat dashedGap;


@end
