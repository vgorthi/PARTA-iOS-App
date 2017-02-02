//
//  TMapViewDelegate.m
//  TrackMyRoute
//
//  Created by pavan krishna on 05/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TMapViewDelegate.h"
#import <MapKit/MapKit.h>

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
{
    MKAnnotationView *annotationView;
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
