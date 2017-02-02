//
//  BaseRequest.m
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "BaseRequest.h"
#define MR_SHORTHAND
//#import <CoreData+MagicalRecord.h>
#import <MagicalRecord/MagicalRecord.h>

@interface BaseRequest ()

@property (nonatomic, strong) NSURL *baseURL;
@property (nonatomic, strong) AFHTTPRequestOperationManager *jsonManager;

@end

@implementation BaseRequest

#pragma mark - Utilities

-(NSString *)buildURL:(NSString *)path;
{
    return [[[NSURL URLWithString:@"https://parta.herokuapp.com/tinypulse"] URLByAppendingPathComponent:path] absoluteString];
}

-(NSError *)errorWithStatusCode:(AFHTTPRequestOperation *)operation withBaseError:(NSError *)error;
{
    return [NSError errorWithDomain:error.domain code:operation.response.statusCode userInfo:error.userInfo];
}

#pragma mark - GET

-(void)GET:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    
    [[self jsonManager] GET:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error], nil);
    }];
}

#pragma mark - POST

-(void)POST:(NSString *)url withParams:(NSDictionary *)params  withCompletionBlock:(RequestCompletion)completionBlock;
{
    NSLog(@"params:%@",params);

    [[self jsonManager] POST:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}

-(void)POST:(NSString *)url withParams:(NSDictionary *)params withBody:(void (^)(id <AFMultipartFormData> formData))body withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self jsonManager] POST:[self buildURL:url] parameters:params constructingBodyWithBlock:body success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}

#pragma mark - PUT

-(void)PUT:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self jsonManager] PUT:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}

#pragma mark - PATCH

-(void)PATCH:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self jsonManager] PATCH:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}

#pragma mark - DELETE

-(void)DELETE:(NSString *)url withParams:(NSDictionary *)params withCompletionBlock:(RequestCompletion)completionBlock;
{
    [[self jsonManager] DELETE:[self buildURL:url] parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionBlock(nil,responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        completionBlock([self errorWithStatusCode:operation withBaseError:error],nil);
    }];
}

#pragma mark - Mappings

-(NSArray *)mapUser:(NSArray *)users;
{
    self.mappingProvider = [[NLTMappingProvider alloc] init];
    self.objectContext = [NSManagedObjectContext MR_defaultContext];
    
    return [NLTManagedObjectDeserializer deserializeCollectionExternalRepresentation:users
                                                                       usingMapping:[[self mappingProvider] userItemMapping] context:[self objectContext]];
}


#pragma mark - Lazy Loading

-(AFHTTPRequestOperationManager *)jsonManager;
{
    if (_jsonManager) {
        return _jsonManager;
    }
    
    _jsonManager = [AFHTTPRequestOperationManager manager];
    [_jsonManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
    [_jsonManager setResponseSerializer:[AFJSONResponseSerializer serializer]];
    
    return _jsonManager;
}

-(AFHTTPRequestOperationManager *)httpManager;
{
    if (_httpManager) {
        return _httpManager;
    }
    
    _httpManager = [AFHTTPRequestOperationManager manager];
    AFImageResponseSerializer *serializer = [AFImageResponseSerializer serializer];
    serializer.acceptableContentTypes = [serializer.acceptableContentTypes setByAddingObject:@"binary/octet-stream"];
    [_httpManager setResponseSerializer:serializer];
    return _httpManager;
}

@end
