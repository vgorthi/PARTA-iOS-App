//
//  UserRequest.m
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "UserRequest.h"
#import "User.h"
#define MR_SHORTHAND
#import <MagicalRecord/MagicalRecord.h>

@implementation UserRequest

-(void)addUser:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
{
    NSLog(@"dict:%@",dict);

    [self POST:@"/register_an_account/" withParams:dict withBody:^(id<AFMultipartFormData> formData) {
        
    } withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            NSLog(@"Error:%@",error.description);
            completionBlock(error, nil);
        } else {
            NSLog(@"result suceesee:%@",results);
            completionBlock(nil, results);
        }
    }];
}

-(void)loginUser:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
{
    NSLog(@"dict:%@",dict);
    
    [self POST:@"/login_check.php" withParams:dict withBody:^(id<AFMultipartFormData> formData) {
        
    } withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            NSLog(@"Error:%@",error.description);
            completionBlock(error, nil);
        } else {
            NSLog(@"result suceesee:%@",results);
            completionBlock(nil, results);
        }
    }];
}

-(void)postDriverLocation:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
{
    //level_id
    //user_id
    //latitude
    //longi
    
    NSLog(@"dict:%@",dict);
    
    [self POST:@"/post_drivers_coordinates/" withParams:dict withBody:^(id<AFMultipartFormData> formData) {
        
    } withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            NSLog(@"Error:%@",error.description);
            completionBlock(error, nil);
        } else {
            NSLog(@"result suceesee:%@",results);
            completionBlock(nil, results);
        }
    }];
}

-(void)getDriverLocations:(NSDictionary *)dict withCompletion:(RequestCompletion)completionBlock;
{
    //level_id
    //user_id
    //latitude
    //longi
    
    [self GET:@"/get_driver_routes/" withParams:dict withCompletionBlock:^(NSError *error, id results) {
        if (error) {
            NSLog(@"Error:%@",error.description);
            completionBlock(error, nil);
        } else {
            NSLog(@"result suceesee:%@",results);
            completionBlock(nil, results);
        }
    }];
}
@end
