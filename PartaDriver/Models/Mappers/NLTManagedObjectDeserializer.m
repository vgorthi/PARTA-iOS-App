//
//  NLTManagedObjectDeserializer.m
//  NumberLine
//
//  Created by pavan krishna on 04/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "NLTManagedObjectDeserializer.h"
#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>

@implementation NLTManagedObjectDeserializer

+(id)deserializeObjectExternalRepresentation:(NSDictionary *)externalRepresentation
                                usingMapping:(FEMManagedObjectMapping *)mapping
                                     context:(NSManagedObjectContext *)context;
{
    id returnObject = [super deserializeObjectExternalRepresentation:externalRepresentation usingMapping:mapping context:context];
    
    [context MR_saveToPersistentStoreWithCompletion:nil];
    
    return returnObject;
}

+(NSArray *)deserializeCollectionExternalRepresentation:(NSArray *)externalRepresentation
                                           usingMapping:(FEMManagedObjectMapping *)mapping
                                                context:(NSManagedObjectContext *)context;
{
    NSArray *returnArray = [super deserializeCollectionExternalRepresentation:externalRepresentation usingMapping:mapping context:context];
    
    [context MR_saveToPersistentStoreWithCompletion:nil];
    
    return returnArray;
}

@end
