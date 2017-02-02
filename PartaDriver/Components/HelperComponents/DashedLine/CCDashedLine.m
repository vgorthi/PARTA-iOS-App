//
//  CCDashedLine.m
//  Camping-Caravan
//
//  Created by Srinivas on 23/06/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#import "CCDashedLine.h"

@implementation CCDashedLine

- (instancetype)init {
    self = [super init];
    
    if (self) {
        // Set Default Values
        _thickness = 1.0f;
        _color = [UIColor whiteColor];
        _dashedGap = 1.0f;
        _dashedLength = 5.0f;
    }
    
    return self;
}

#pragma mark - View Lifecycle

- (void)layoutSubviews {
    // Note, this object draws a straight line. If you wanted the line at an angle you simply need to adjust the start and/or end point here.
    [self updateLineStartingAt:self.bounds.origin andEndPoint:CGPointMake(self.bounds.size.width - self.bounds.origin.x, self.bounds.origin.y)];
}

#pragma mark - Setters

- (void)setThickness:(CGFloat)thickness {
    _thickness = thickness;
    [self setNeedsLayout];
}

- (void)setColor:(UIColor *)color {
    _color = [color copy];
    [self setNeedsLayout];
}

- (void)setDashedGap:(CGFloat)dashedGap {
    _dashedGap = dashedGap;
    [self setNeedsLayout];
}

- (void)setDashedLength:(CGFloat)dashedLength {
    _dashedLength = dashedLength;
    [self setNeedsLayout];
}

#pragma mark - Draw Methods

-(void)updateLineStartingAt:(CGPoint)beginPoint andEndPoint:(CGPoint)endPoint {
    
    // Important, otherwise we will be adding multiple sub layers
    if ([[[self layer] sublayers] objectAtIndex:0]) {
        self.layer.sublayers = nil;
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:self.frame];
    [shapeLayer setPosition:self.center];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    [shapeLayer setStrokeColor:self.color.CGColor];
    [shapeLayer setLineJoin:kCALineJoinRound];
    [shapeLayer setLineCap:kCALineCapRound];
    [shapeLayer setLineDashPattern:@[@(self.dashedLength), @(self.dashedGap)]];
    
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, beginPoint.x, beginPoint.y);
    CGPathAddLineToPoint(path, NULL, endPoint.x, endPoint.y);
    
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [[self layer] addSublayer:shapeLayer];
}
@end
