//
//  CustomerMapViewController.m
//  PartaApp
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import "CustomerMapViewController.h"
#import "Masonry.h"
#define MAS_SHORTHAND
#import "UserService.h"
#import "ActivityService.h"
#import "User.h"
#define MR_SHORTHAND
#import <MagicalRecord/MagicalRecord.h>
#import <TAlertView/TAlertView.h>
#import "Reachability.h"
#import <TAlertView.h>
#import <RealReachability.h>
#import "GIFProgressHUD.h"

@import GoogleMaps;
@interface CustomerMapViewController ()<GMSMapViewDelegate>
{
    NSTimer *reloadTimer;
}
@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) GMSMapView *tecxiMapView;
@property (nonatomic, assign) BOOL firstLocationUpdate;
@property (nonatomic, strong) MKPolyline *routeOverlay;
@property (nonatomic, strong) MKRoute *currentRoute;
@property (nonatomic, strong) MKLocalSearch *localSearch;
@property (nonatomic, assign) CLLocationCoordinate2D sourceCoordinate;
@property (nonatomic, assign) CLLocationCoordinate2D destinationCoordinate;
@property (nonatomic, assign) MKCoordinateRegion boundingRegion;
@property (nonatomic, strong) NSDictionary *destinationDictionary;
@property (nonatomic, strong) NSDictionary *sourceDictionary;
@property (nonatomic, strong) GMSMutablePath *tracePath;

@property (nonatomic, assign) BOOL selectedIndex;
@property (nonatomic, assign) BOOL isTrackingStarted;


@end

@implementation CustomerMapViewController

- (void)loadView;
{
    [super loadView];
    
    [[TLocationService sharedInstance] stopUpdates];
    [[TLocationService sharedInstance] startUpdates];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self view] addSubview:[self tecxiMapView]];
//    [[self view] addSubview:[self startButton]];
    
//    [[self startButton] mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.mas_bottomLayoutGuide).with.offset(0);
//        make.left.equalTo(@(40));
//        make.right.equalTo(@(-40));
//        make.height.equalTo(@(40));
//    }];
//    
    [[self tecxiMapView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).with.offset(0);
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
//        make.bottom.equalTo(self.startButton.top);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
    }];
    
    // Listen to the myLocation property of GMSMapView.
    [[self tecxiMapView] addObserver:self
                          forKeyPath:@"myLocation"
                             options:NSKeyValueObservingOptionNew
                             context:NULL];
    
    // Ask for My Location data after the map has already been added to the UI.
    dispatch_async(dispatch_get_main_queue(), ^{
        self.tecxiMapView.myLocationEnabled = YES;
    });
    
    [[TLocationService sharedInstance] registerForLocationUpdates:self];
    
    self.tracePath = [GMSMutablePath path];
}

-(void)viewWillAppear:(BOOL)animated;
{
    [super viewWillAppear:animated];
    NSLog(@"Starting timer in 10 seconds");
    [self performSelector:@selector(performTimerAction) withObject:nil afterDelay:3.0];
}

-(void)performTimerAction;
{
    NSLog(@"Performing API call");
    reloadTimer = [NSTimer scheduledTimerWithTimeInterval:10.0
                                                   target:self
                                                 selector:@selector(getDriverLocationsFromServer)
                                                 userInfo:nil
                                                  repeats:YES];
}

-(GMSMapView *)tecxiMapView;
{
    if (_tecxiMapView) {
        return _tecxiMapView;
    }
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[[TLocationService sharedInstance] currentLocation] coordinate].latitude
                                                            longitude:[[[TLocationService sharedInstance] currentLocation] coordinate].longitude
                                                                 zoom:6];
    
    _tecxiMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    [_tecxiMapView setDelegate:self];
    [_tecxiMapView setMapType:kGMSTypeNormal];
    [_tecxiMapView setAccessibilityElementsHidden:NO];
    [_tecxiMapView animateToBearing:0];
    [_tecxiMapView animateToViewingAngle:45];
    [[_tecxiMapView settings] setMyLocationButton:YES];
    [_tecxiMapView setMyLocationEnabled:YES];
    
    return _tecxiMapView;
}

#pragma mark - Action Methods

-(void)updateLocation:(CLLocation *)location
{
    NSLog(@"cood lat:%f, lon:%f",location.coordinate.latitude,location.coordinate.longitude);
    
    GMSCameraUpdate *move = [GMSCameraUpdate setTarget:[[TLocationService sharedInstance] currentLocation].coordinate];
    
    [self.tecxiMapView animateWithCameraUpdate:move];
    
    if ([self isTrackingStarted]) {
        [self.tracePath addCoordinate:CLLocationCoordinate2DMake([[TLocationService sharedInstance] currentLocation].coordinate.latitude, [[TLocationService sharedInstance] currentLocation].coordinate.longitude)];
        [self.tracePath pathOffsetByLatitude:[[TLocationService sharedInstance] currentLocation].coordinate.latitude longitude:[[TLocationService sharedInstance] currentLocation].coordinate.longitude];
        [self updateSpeed:[[[TLocationService sharedInstance] currentLocation] speed]];
        
        GMSPolyline *singleLine = [GMSPolyline polylineWithPath:self.tracePath];
        singleLine.strokeWidth = 4;
        singleLine.strokeColor = [UIColor blueColor];
        singleLine.map = self.tecxiMapView;
    }
    else
    {
        [[self tracePath] removeAllCoordinates];
    }
}

-(void)getDriverLocationsFromServer;
{
    [self.tecxiMapView clear];

    UserService *userService = [[UserService alloc] init];
    
    NSMutableDictionary *userDict = [NSMutableDictionary dictionary];
    
    GIFProgressHUD *hud = [GIFProgressHUD showHUDWithGIFName:@"newsquares" title:@"Please wait..." detailTitle:@"Posting location" addedToView:self.view animated:YES];
    hud.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    hud.containerColor = [UIColor colorWithRed:0.09 green:0.22 blue:0.28 alpha:1];
    hud.containerCornerRadius = 10;
    hud.scaleFactor = 2.0;
    hud.minimumPadding = 16;
    hud.titleColor = [UIColor whiteColor];
    hud.detailTitleColor = [UIColor whiteColor];
    hud.titleFont = [UIFont fontWithName:@"Lato-Black" size:20];
    hud.detailTitleFont = [UIFont fontWithName:@"Lato-Black" size:16];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [userService getDriverLocations:userDict withCompletion:^(NSError *error, id results) {
                NSLog(@"final results:%@",results);
                NSArray *finalArray = [results objectForKey:@"routes"];
                NSLog(@"finalArray:%@",finalArray);
                NSLog(@"**************************************************");
                for (NSDictionary *dict in finalArray) {
                    CLLocationCoordinate2D position = CLLocationCoordinate2DMake([[dict objectForKey:@"latitude_coord"] doubleValue], [[dict objectForKey:@"longitude_coord"] doubleValue]);
                    GMSMarker *marker = [GMSMarker markerWithPosition:position];
                    marker.title = [dict objectForKey:@"route_id"];
                    marker.snippet = [dict objectForKey:@"route_id"];
                    marker.flat = YES;
                    marker.icon = [UIImage imageNamed:@"Image"];
                    marker.map = self.tecxiMapView;
                }
            }];
            [hud hideWithAnimation:YES];
        });
    });
}

//- (void)removeMyAnnotation:(MyAnnotation*)annotation;
//{
//    [UIView animateWithDuration:1.0f
//                     animations:^(void){
//                         annotation.coordinate = annotation.parentAnnotation.coordinate;
//                     }
//                     completion:^(BOOL finished)completion{
//                         [mapView removeAnnotation:annotation];
//                     }
//}

-(void)updateSpeed:(double)speed;
{
    NSLog(@"speed :%f",speed);
}

#pragma mark - KVO updates

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context;
{
    if (!self.firstLocationUpdate) {
        // If the first location update has not yet been recieved, then jump to that
        // location.
        self.firstLocationUpdate = YES;
        CLLocation *location = [change objectForKey:NSKeyValueChangeNewKey];
        [self setSourceCoordinate:location.coordinate];
        NSLog(@"cood lat:%f, lon:%f",location.coordinate.latitude,location.coordinate.longitude);
        self.tecxiMapView.camera = [GMSCameraPosition cameraWithTarget:location.coordinate
                                                                  zoom:14];
        [self.tecxiMapView animateToLocation:location.coordinate];
        
        // Zoom in one zoom level
        GMSCameraUpdate *zoomCamera = [GMSCameraUpdate zoomIn];
        [self.tecxiMapView animateWithCameraUpdate:zoomCamera];
    }
}

#pragma mark - Dealloc

- (void)dealloc;
{
    [reloadTimer invalidate];
    [[self tecxiMapView] removeObserver:self
                             forKeyPath:@"myLocation"
                                context:NULL];
}
@end
