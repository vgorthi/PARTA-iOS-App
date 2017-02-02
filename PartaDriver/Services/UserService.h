//
//  UserService.h
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "BaseService.h"
#import "BaseService.h"

@class UserRequest;

@interface UserService : BaseService

@property (nonatomic, strong) UserRequest *userRequest;

-(void)addUser:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
-(void)loginUser:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
-(void)postDriverLocation:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
-(void)getDriverLocations:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
@end
