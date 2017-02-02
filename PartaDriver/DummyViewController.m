//
//  DummyViewController.m
//  TrackMyRoute
//
//  Created by pavan krishna on 01/09/15.
//  Copyright (c) 2015 PK. All rights reserved.
//

#import "DummyViewController.h"
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

@interface DummyViewController ()<GMSMapViewDelegate>

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

@implementation DummyViewController

- (void)loadView;
{
    [super loadView];

    [[TLocationService sharedInstance] stopUpdates];
    [[TLocationService sharedInstance] startUpdates];

}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[self view] addSubview:[self tecxiMapView]];
    [[self view] addSubview:[self startButton]];
    
    [[self startButton] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottomLayoutGuide).with.offset(0);
        make.left.equalTo(@(40));
        make.right.equalTo(@(-40));
        make.height.equalTo(@(40));
    }];
    
    [[self tecxiMapView] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).with.offset(0);
        make.left.equalTo(@(0));
        make.right.equalTo(@(0));
        make.bottom.equalTo(self.startButton.top);
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

-(UIButton *)startButton;
{
    if (_startButton) {
        return _startButton;
    }
    
    _startButton = [UIButton buttonWithTitle:@"START TRACKING" backgroundColor:[UIColor colorWithRed:0.99 green:0.66 blue:0.13 alpha:1] textColor:[UIColor whiteColor] andFont:[UIFont boldSystemFontOfSize:15.0f] usingAction:@selector(startTrackingButtonPressed) forTarget:self];
    [[_startButton layer] setCornerRadius:40/2];
    
    return _startButton;
}

-(GMSMapView *)tecxiMapView;
{
    if (_tecxiMapView) {
        return _tecxiMapView;
    }
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[[TLocationService sharedInstance] currentLocation] coordinate].latitude
                                                            longitude:[[[TLocationService sharedInstance] currentLocation] coordinate].longitude
                                                                 zoom:6];
    
    
//    GMSMarker *marker1 = [GMSMarker markerWithPosition:location.coordinate];
//    marker1.icon = [UIImage imageNamed:@"bus_icon"];
//    marker1.title = @"53 Reverse Loop Bus";
//    marker1.snippet = @"53 Reverse Loop Bus";
//    marker1.appearAnimation = kGMSMarkerAnimationPop;
//    marker1.map = self.tecxiMapView;

    
    _tecxiMapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    [_tecxiMapView setDelegate:self];
    [_tecxiMapView setMapType:kGMSTypeNormal];
    [_tecxiMapView setAccessibilityElementsHidden:NO];
    [_tecxiMapView animateToBearing:0];
    [_tecxiMapView animateToViewingAngle:45];
    [[_tecxiMapView settings] setMyLocationButton:YES];
    [_tecxiMapView setMyLocationEnabled:NO];
//    [_tecxiMapView setma]
    
    return _tecxiMapView;
}

#pragma mark - Action Methods

- (void)startTrackingButtonPressed;
{
    if ([self isTrackingStarted]) {
        [self setIsTrackingStarted:NO];
        [[self startButton] setTitle:@"START TRACKING" forState:UIControlStateNormal];
    }
    else
    {
        [self setIsTrackingStarted:YES];
        [[TLocationService sharedInstance] registerForLocationUpdates:self];
        [[self startButton] setTitle:@"STOP TRACKING" forState:UIControlStateNormal];
    }
}

-(void)updateLocation:(CLLocation *)location
{
    [self setSourceCoordinate:location.coordinate];
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
    
    CLLocationDegrees lat = location.coordinate.latitude;

    CLLocationDegrees longg = location.coordinate.longitude;

    [self postDriverLocationToServer:lat andLong:longg];
}

-(void)postDriverLocationToServer:(CLLocationDegrees)lat andLong:(CLLocationDegrees)lon;
{
    UserService *userService = [[UserService alloc] init];
    
    NSMutableDictionary *userDict = [NSMutableDictionary dictionary];
    
    [userDict setObject:[NSNumber numberWithDouble:11] forKey:@"user_id"];
    [userDict setObject:[NSNumber numberWithDouble:55] forKey:@"route_id"];
    [userDict setObject:[NSNumber numberWithDouble:lat] forKey:@"latitude"];
    [userDict setObject:[NSNumber numberWithDouble:lon] forKey:@"longi"];
    
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
            [userService postDriverLocation:userDict withCompletion:^(NSError *error, id results) {
                
                //user already present and playing so pull his scores and show level screen
                NSLog(@"result:%@",[results objectForKey:@"result"]);
                NSLog(@"result:%@",[results objectForKey:@"user_id"]);
            }];
            [hud hideWithAnimation:YES];
        });
    });
}

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
    [[self tecxiMapView] removeObserver:self
                             forKeyPath:@"myLocation"
                                context:NULL];
}
@end
