//
//  DAVenueAnnotation.m
//  DatingApp
//
//  Created by Christian Rubin on 15/07/2014.
//  Copyright (c) 2014 hedgehog lab. All rights reserved.
//

#import "DAVenueAnnotation.h"

@implementation DAVenueAnnotation

@synthesize coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

@end
