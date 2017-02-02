//
//  DAVenueMapAnnotationView.h
//  DatingApp
//
//  Created by Christian Rubin on 15/07/2014.
//  Copyright (c) 2014 hedgehog lab. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface DAVenueMapAnnotationView : MKAnnotationView

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier count:(NSInteger)count;

@end
