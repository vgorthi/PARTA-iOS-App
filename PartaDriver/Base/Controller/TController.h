//
//  TController.h
//  Texci
//
//  Created by Srinivas on 29/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TController : UIViewController

- (UIBarButtonItem *)barButtonItemWithImagePath:(NSString *)imagePath action:(SEL)selector andTarget:(id)target;
- (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title action:(SEL)selector andTarget:(id)target;

@end
