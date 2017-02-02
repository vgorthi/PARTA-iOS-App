//
//  UserRequest.h
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "BaseRequest.h"

@interface UserRequest : BaseRequest

@property (nonatomic, strong) NSMutableArray *existingUsers;

-(void)addUser:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
-(void)loginUser:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;

-(void)postDriverLocation:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
-(void)getDriverLocations:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
@end
