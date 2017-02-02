//
//  DriverMapViewController.h
//  PartaApp
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCustomerMapControllerDataSource <NSObject>

@end

@protocol TCustomerMapControllerDelegate <NSObject>

-(void)gotoJourneyDetailsScreen;
-(void)gotoSearchResultsScreen:(NSString *)searchText;

@end

@interface DriverMapViewController : UIViewController

@property (nonatomic, assign) id<TCustomerMapControllerDataSource> dataSource;
@property (nonatomic, assign) id<TCustomerMapControllerDelegate> delegate;

@end

