//
//  TRegisterForLocationsProtocol.h
//  TrackMyRoute
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol TRegisterForLocationsProtocol <NSObject>

-(void)updateLocation:(CLLocation *)location;

@end
