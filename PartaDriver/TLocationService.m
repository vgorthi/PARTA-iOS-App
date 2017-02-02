//
//  TLocationService.m
//  TrackMyRoute
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TLocationService.h"
#import "TRegisterForLocationsProtocol.h"

@interface TLocationService()

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSMutableArray *registeredObjects;
@property (nonatomic,strong) CLLocation *location;

@end

@implementation TLocationService

+(TLocationService*)sharedInstance;
{
    static dispatch_once_t pred;
    static id shared = nil;
    
    dispatch_once(&pred, ^{
        shared = [[[self class] alloc] init];
    });
    
    return shared;
}

-(BOOL)shouldStartUpdates;
{
    return [self locationManager]!=nil;
}

-(void)stopUpdates;
{
    if ([self locationManager]==nil) {
        return;
    }
    
    [[self locationManager] stopUpdatingLocation];
}

-(void)startUpdates;
{
    
    if ([self locationManager]==nil) {
        CLLocationManager *locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        [locationManager setDistanceFilter:50.0f];
        
        [self setLocationManager:locationManager];
        [self setRegisteredObjects:[NSMutableArray new]];
    }
    
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedAlways) {
            [[self locationManager] startUpdatingLocation];
        }else{
            [[self locationManager] requestWhenInUseAuthorization];
        }
    } else {
        [[self locationManager] startUpdatingLocation];
    }
}

-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    switch (status) {
        case kCLAuthorizationStatusAuthorizedAlways:
            [manager startUpdatingLocation];
            break;
            
        case kCLAuthorizationStatusDenied:{
            UIAlertView *resetLocationsAlert = [[UIAlertView alloc] initWithTitle:@"Location services disabled" message:@"Please re-enable location services in your settings to book a tecxi." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
            [resetLocationsAlert show];
            [manager stopUpdatingLocation];
            
            break;
        }
            
        case kCLAuthorizationStatusRestricted:
            [manager stopUpdatingLocation];
            
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            [manager startUpdatingLocation];
            break;
            
        default:
            break;
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [self setLocation:[locations lastObject]];
    for (NSObject<TRegisterForLocationsProtocol> *object in self.registeredObjects) {
        [object updateLocation:[locations lastObject]];
    }
}

- (void)registerForLocationUpdates:(id<TRegisterForLocationsProtocol>)object
{
    if ([self shouldStartUpdates]==NO) {
        [self startUpdates];
    }
    
    [object updateLocation:[self location]];
    if (![[self registeredObjects] containsObject:object]){
        [[self registeredObjects] addObject:object];
    }
}

- (void)deregisterFromLocationUpdates:(id<TRegisterForLocationsProtocol>)object
{
    if ([[self registeredObjects] containsObject:object]) {
        [[self registeredObjects] removeObject:object];
    }
}

-(CLLocation*)currentLocation
{
    return [self location];
}
@end
