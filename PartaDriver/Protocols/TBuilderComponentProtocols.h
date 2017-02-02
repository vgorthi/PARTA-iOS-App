//
//  TBuilderComponentProtocols.h
//  Texci
//
//  Created by Srinivas on 29/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TViewControllerComponentsProtocol <NSObject>

- (id)controllerForSplashScreen;
- (id)controllerForLoginScreen;
- (id)controllerForDriverOrCustomerScreen;
- (id)controllerForMobileVerificationScreen;
- (id)controllerForEnterPinScreen;
- (id)controllerForCustomerRegistrationScreen;
- (id)controllerForDriverRegistrationScreen;

- (id)controllerForCustomerBidsScreen;
- (id)controllerForDriverBidsScreen;
- (id)controllerForMapScreen;
- (id)controllerForSettingsScreen;

- (id)controllerForOffersScreen;
- (id)controllerForJourneyHistoryScreen;
- (id)controllerForShareScreen;
- (id)controllerForCustomerAccountScreen;
- (id)controllerForDriverAccountScreen;
- (id)controllerForCustomizeJourneyScreen;
- (id)controllerForSearchResultsScreen;

@end

@protocol TViewComponentsProtocol <NSObject>

- (id)loginView;
- (id)driverOrCustomerView;
- (id)mobileVerificationView;
- (id)enterPinView;
- (id)customerRegistrationView;
- (id)driverRegistrationView;

- (id)customerBidsView;
- (id)driverBidsView;
- (id)mapView;
- (id)settingsView;

- (id)offersView;
- (id)journeyHistoryView;
- (id)shareView;
- (id)customerAccountView;
- (id)driverAccountView;
- (id)customizeJourneyView;
- (id)searchResultsView;
@end

@protocol TJourneyComponentsProtocol <NSObject>

- (id)journeyForSplashScreen;
- (id)journeyForLoginScreen;
- (id)journeyForDriverOrCustomerScreen;
- (id)journeyForMobileVerificationScreen;
- (id)journeyForEnterPinScreen;
- (id)journeyForCustomerRegistrationScreen;
- (id)journeyForDriverRegistrationScreen;

- (id)journeyForBidsView;
- (id)journeyForMapView;
- (id)journeyForSettingsView;

- (id)journeyForOffersScreen;
- (id)journeyForJourneyHistoryScreen;
- (id)journeyForShareScreen;
- (id)journeyForCustomerAccountScreen;
- (id)journeyForDriverAccountScreen;

- (id)journeyForCustomizeJourneyScreen;
- (id)journeyForSearchResultsScreen;
@end

@protocol TServiceComponentsProtocol <NSObject>

@end

@protocol TUseCaseComponentsProtocol <NSObject>

@end
