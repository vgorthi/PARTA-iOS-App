//
//  TMapViewDelegate.h
//  TrackMyRoute
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@protocol TMapViewDelegateProtocol <NSObject>

-(void)updateTextFieldWithUserLocation:(CLLocationCoordinate2D)usersCoordinate andTitle:(NSString *)locationTitle;

@end

@interface TMapViewDelegate : NSObject<MKMapViewDelegate>

@property (nonatomic, assign) id<TMapViewDelegateProtocol> dataSource;

@end
