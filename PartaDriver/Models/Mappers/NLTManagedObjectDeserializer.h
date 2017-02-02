//
//  NLTManagedObjectDeserializer.h
//  NumberLine
//
//  Created by pavan krishna on 04/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import <FastEasyMapping/FastEasyMapping.h>

@interface NLTManagedObjectDeserializer : FEMManagedObjectDeserializer

+ (id)deserializeObjectExternalRepresentation:(NSDictionary *)externalRepresentation
                                 usingMapping:(FEMManagedObjectMapping *)mapping
                                      context:(NSManagedObjectContext *)context;

+ (NSArray *)deserializeCollectionExternalRepresentation:(NSArray *)externalRepresentation
                                            usingMapping:(FEMManagedObjectMapping *)mapping
                                                 context:(NSManagedObjectContext *)context;

@end
