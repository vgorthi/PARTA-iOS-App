//
//  UserService.m
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "UserService.h"
#import "UserRequest.h"

@implementation UserService

-(void)addUser:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
{
    UserRequest *request = [[UserRequest alloc] init];
    NSLog(@"dict:%@",dict);
    [request addUser:dict withCompletion:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, results);
        }
    }];
}


-(void)loginUser:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
{
    UserRequest *request = [[UserRequest alloc] init];
    NSLog(@"dict:%@",dict);
    [request loginUser:dict withCompletion:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, results);
        }
    }];
}

-(void)postDriverLocation:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
{
    //route_id
    //user_id
    //latitude
    //longi
    
    UserRequest *request = [[UserRequest alloc] init];
    NSLog(@"dict:%@",dict);
    
    [request postDriverLocation:dict withCompletion:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, results);
        }
    }];
}


-(void)getDriverLocations:(NSDictionary *)dict withCompletion:(ServiceCompletion)completionBlock;
{
    //route_id
    //user_id
    //latitude
    //longi
    
    UserRequest *request = [[UserRequest alloc] init];
    NSLog(@"dict:%@",dict);
    
    [request getDriverLocations:dict withCompletion:^(NSError *error, id results) {
        if (error) {
            completionBlock(error, nil);
        } else {
            completionBlock(nil, results);
        }
    }];
}
@end
