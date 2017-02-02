//
//  CustomerMapViewController.h
//  PartaApp
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CoreLocation/CoreLocation.h"
#import "TMapViewDelegate.h"
#import "TRegisterForLocationsProtocol.h"
#import "TLocationService.h"
#define MAS_SHORTHAND
#import <QuartzCore/QuartzCore.h>
#import <Masonry.h>
#import "UILabel+Extensions.h"
#import "UIButton+Extensions.h"
#import "UITextView+Extensions.h"
#import "UITextField+Extensions.h"
#import "UIImage+CCImage.h"

@interface CustomerMapViewController : UIViewController<TRegisterForLocationsProtocol>

@end
