//
//  TDriverRegistrationControllerProtocol.h
//  Texci
//
//  Created by pavan krishna on 02/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TDriverRegistrationControllerDataSource <NSObject>

@end

@protocol TDriverRegistrationControllerDelegate <NSObject>

- (void)moveToMapScreen;
- (void)moveToPreviousScreen;

@end

@protocol TDriverRegistrationControllerProtocol <NSObject>

@property (nonatomic, assign) id<TDriverRegistrationControllerDataSource> dataSource;
@property (nonatomic, assign) id<TDriverRegistrationControllerDelegate> delegate;

@end

@protocol TDriverRegistrationViewDataSource <NSObject>

@end

@protocol TDriverRegistrationViewDelgate <NSObject>

- (void)continueToMapScreenButtonPressed;

@end

@protocol TDriverRegistrationViewProtocol <NSObject>

@property (nonatomic, assign) id<TDriverRegistrationViewDataSource> dataSource;
@property (nonatomic, assign) id<TDriverRegistrationViewDelgate> delegate;

@end