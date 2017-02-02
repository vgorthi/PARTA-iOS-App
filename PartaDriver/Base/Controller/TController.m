//
//  TController.m
//  Texci
//
//  Created by Srinivas on 29/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TController.h"
#import "UILabel+Extensions.h"
#import "UIButton+Extensions.h"
#import "UITextView+Extensions.h"
#import "UITextField+Extensions.h"
#import "UIImage+CCImage.h"

@implementation TController

- (UIBarButtonItem *)barButtonItemWithImagePath:(NSString *)imagePath action:(SEL)selector andTarget:(id)target;
{
    UIButton *button = [UIButton buttonWithImage:[UIImage imageNamed:imagePath]
                                 backgroundColor:[UIColor clearColor]
                                     usingAction:selector
                                       forTarget:target];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title action:(SEL)selector andTarget:(id)target;
{
    UIButton *button = [UIButton buttonWithTitle:title
                                 backgroundColor:[UIColor clearColor]
                                       textColor:[UIColor whiteColor]
                                         andFont:[UIFont systemFontOfSize:12]
                                     usingAction:selector
                                       forTarget:target];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
