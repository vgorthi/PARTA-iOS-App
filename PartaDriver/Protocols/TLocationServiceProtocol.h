//
//  TLocationServiceProtocol.h
//  Texci
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/Corelocation.h>
#import "TRegisterForLocationsProtocol.h"

@protocol TLocationServiceProtocol <NSObject,CLLocationManagerDelegate>

-(void)registerForLocationUpdates:(id<TRegisterForLocationsProtocol>)object;
-(void)deregisterFromLocationUpdates:(id<TRegisterForLocationsProtocol>)object;

@end
