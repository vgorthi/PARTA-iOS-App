//
//  DAVenueAnnotation.h
//  DatingApp
//
//  Created by Christian Rubin on 15/07/2014.
//  Copyright (c) 2014 hedgehog lab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface DAVenueAnnotation : MKPointAnnotation <MKAnnotation>

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

@end
