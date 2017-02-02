//
//  DriverMapView.h
//  PartaApp
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCustomerMapViewDataSource <NSObject>

@end

@protocol TCustomerMapViewDelgate <NSObject>

-(void)gotoJourneyDetailsScreen;
-(void)gotoSearchResultsScreen:(NSString *)searchText;
@end

@interface DriverMapView : UIView

@property (nonatomic, assign) id<TCustomerMapViewDataSource> dataSource;
@property (nonatomic, assign) id<TCustomerMapViewDelgate> delegate;

@end
