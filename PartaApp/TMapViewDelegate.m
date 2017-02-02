//
//  TMapViewDelegate.m
//  Texci
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TMapViewDelegate.h"
#import <MapKit/MapKit.h>
#import "DAVenueAnnotation.h"
#import "DAVenueMapAnnotationView.h"

@implementation TMapViewDelegate

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation;
{
    CLLocationCoordinate2D usersCoordinate = mapView.userLocation.location.coordinate;
    
    if ((usersCoordinate.latitude != 0) && (usersCoordinate.longitude != 0)) {
        [[self dataSource] updateTextFieldWithUserLocation:usersCoordinate andTitle:[userLocation title]];
    }

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(usersCoordinate, 3300.0, 3300.0);
    
    [mapView setRegion:region animated:YES];
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation;
//{
//    MKAnnotationView *annotationView;
//    return annotationView;
//    
////    static NSString *kMovingAnnotationViewId = @"HGMovingAnnotationView";
////    
////    HGMovingAnnotationView *annotationView = (HGMovingAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:kMovingAnnotationViewId];
////    if (!annotationView) {
////        annotationView = [[HGMovingAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kMovingAnnotationViewId];
////    }
////    
////    //configure the annotation view
////    annotationView.image = [UIImage imageNamed:@"Image"];
////    annotationView.bounds = CGRectMake(0, 0, 20, 20); //initial bounds (default)
////    annotationView.mapView = mapView;
////    
////    return annotationView;
//}
{
    MKAnnotationView *annotationView;
    
//    if([annotation isKindOfClass:[MKUserLocation class]])
//    {
//        
//        NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES);
//        NSString *documentsDirectory = [pathArray objectAtIndex:0];
//        
//        DAUser *localUser = [DAUser MR_findFirstByAttribute:@"local_account" withValue:@YES];
//        
//        UIImage *userProfilePicImage = [UIImage imageWithContentsOfFile:[documentsDirectory stringByAppendingPathComponent:[localUser profile_picture]]];
//        
//        DAUserAnnotationView *userAnnotation = [[DAUserAnnotationView alloc] initWithFrame:CGRectMake(0, 0, 30.0f, 30.0f) usingImage:userProfilePicImage];
//        [userAnnotation setAnnotation:annotation];
//        
//        annotationView = userAnnotation;
//    }
//    else
    if ([annotation isKindOfClass:[DAVenueAnnotation class]])
    {
        DAVenueMapAnnotationView *venueAnnotationView = [[DAVenueMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ClusterView" count:1];
        
        annotationView = venueAnnotationView;
    }
//    else if ([annotation isKindOfClass:[OCAnnotation class]])
//    {
//        OCAnnotation *clusterAnnotation = (OCAnnotation*)annotation;
//        
//        DAVenueMapAnnotationView *venueAnnotationView = [[DAVenueMapAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ClusterView" count:[[clusterAnnotation annotationsInCluster] count]];
//        
//        annotationView = venueAnnotationView;
//    }
    return annotationView;
}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    for (MKAnnotationView *view in views)
    {
        if ([[view annotation] isKindOfClass:[MKUserLocation class]])
        {
            [[view superview] sendSubviewToBack:view];
        }
        else
        {
            [[view superview] bringSubviewToFront:view];
        }
    }
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{

}

-(void)mapViewWillStartRenderingMap:(MKMapView *)mapView
{
    
}

-(void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
}

-(void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered
{
    
}

-(void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{

}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay;
{
    MKPolylineRenderer *renderer = [[MKPolylineRenderer alloc] initWithPolyline:overlay];
    renderer.strokeColor = [UIColor blueColor];
    renderer.lineWidth = 4.0;
    return  renderer;
}

@end
