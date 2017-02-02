//
//  TLoginControllerProtocol.h
//  Texci
//
//  Created by pavan krishna on 30/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TLoginControllerDataSource <NSObject>

@end

@protocol TLoginControllerDelegate <NSObject>

- (void)createAccountButtonPressed;
- (void)takeALookButtonPressed;
- (void)forgotPinButtonPressed;
- (void)loginComplete;

@end

@protocol TLoginControllerProtocol <NSObject>

@property (nonatomic, assign) id<TLoginControllerDataSource> dataSource;
@property (nonatomic, assign) id<TLoginControllerDelegate> delegate;

@end

@protocol TLoginViewDataSource <NSObject>

@end

@protocol TLoginViewDelgate <NSObject>

- (void)createAccountButtonPressed;
- (void)takeALookButtonPressed;
- (void)forgotPinButtonPressed;
- (void)loginButtonPressed;

@end

@protocol TLoginViewProtocol <NSObject>

@property (nonatomic, assign) id<TLoginViewDataSource> dataSource;
@property (nonatomic, assign) id<TLoginViewDelgate> delegate;

@end
