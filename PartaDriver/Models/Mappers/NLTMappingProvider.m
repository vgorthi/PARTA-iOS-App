//
//  NLTMappingProvider.m
//  NumberLine
//
//  Created by pavan krishna on 04/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "NLTMappingProvider.h"

@implementation NLTMappingProvider

- (FEMManagedObjectMapping *)userItemMapping;{
    
    return [FEMManagedObjectMapping mappingForEntityName:@"User" configuration:^(FEMManagedObjectMapping *mapping) {
        [mapping setPrimaryKey:@"user_id"];  // object uniquing
        
        [mapping addAttributesFromArray:@[@"user_id",@"first_name",@"last_name",@"email"]];
    }];
}

@end
