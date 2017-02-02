//
//  TLocationService.h
//  TrackMyRoute
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TLocationServiceProtocol.h"
#import <UIKit/UIKit.h>

@interface TLocationService : NSObject<TLocationServiceProtocol,UIAlertViewDelegate>

+(TLocationService*)sharedInstance;

-(CLLocation*)currentLocation;

-(BOOL)shouldStartUpdates;

-(void)stopUpdates;
-(void)startUpdates;

@end
