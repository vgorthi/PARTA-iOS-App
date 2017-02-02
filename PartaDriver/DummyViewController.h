//
//  DummyViewController.h
//  TrackMyRoute
//
//  Created by pavan krishna on 01/09/15.
//  Copyright (c) 2015 PK. All rights reserved.
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

@interface DummyViewController : UIViewController<TRegisterForLocationsProtocol>

@end
