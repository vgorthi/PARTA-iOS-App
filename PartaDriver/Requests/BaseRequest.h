//
//  BaseRequest.h
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <CoreData/CoreData.h>

#import "NLTMappingProvider.h"
#import "NLTManagedObjectDeserializer.h"

typedef void(^RequestCompletion)(NSError *error, id results);

@interface BaseRequest : NSObject

@property (nonatomic, strong) NSManagedObjectContext *objectContext;
@property (nonatomic, strong) NLTMappingProvider *mappingProvider;

@property (nonatomic, strong) AFHTTPRequestOperationManager *httpManager;
@property (nonatomic, strong) AFHTTPRequestOperationManager *s3Manager;

-(AFHTTPRequestOperationManager *)jsonManager;

-(NSString *)buildURL:(NSString *)path;
-(NSError *)errorWithStatusCode:(AFHTTPRequestOperation *)operation withBaseError:(NSError *)error;

-(void)GET:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)POST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)POST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
-(void)PUT:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)PATCH:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
-(void)DELETE:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;

#pragma mark - Mappings

-(NSArray *)mapUser:(NSArray *)foodItems;

@end
