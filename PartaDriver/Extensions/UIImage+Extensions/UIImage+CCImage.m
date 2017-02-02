//
//  UIImage+CCImage.m
//  Camping-Caravan
//
//  Created by Srinivas on 23/06/15.
//  Copyright (c) 2015 Srinivas Jayanthi. All rights reserved.
//

#import "UIImage+CCImage.h"

@implementation UIImage (CCImage)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
