//
//  TCustomerRegistrationControllerProtocol.h
//  Texci
//
//  Created by pavan krishna on 02/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TCustomerRegistrationControllerDataSource <NSObject>

@end

@protocol TCustomerRegistrationControllerDelegate <NSObject>

- (void)moveToMapScreen;
- (void)moveToPreviousScreen;

@end

@protocol TCustomerRegistrationControllerProtocol <NSObject>

@property (nonatomic, assign) id<TCustomerRegistrationControllerDataSource> dataSource;
@property (nonatomic, assign) id<TCustomerRegistrationControllerDelegate> delegate;

@end

@protocol TCustomerRegistrationViewDataSource <NSObject>

@end

@protocol TCustomerRegistrationViewDelgate <NSObject>

- (void)continueToMapScreenButtonPressed;

@end

@protocol TCustomerRegistrationViewProtocol <NSObject>

@property (nonatomic, assign) id<TCustomerRegistrationViewDataSource> dataSource;
@property (nonatomic, assign) id<TCustomerRegistrationViewDelgate> delegate;

@end