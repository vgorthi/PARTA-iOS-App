//
//  BaseService.h
//  NumberLine
//
//  Created by pavan krishna on 02/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ServiceCompletion)(NSError *error, id results);

@interface BaseService : NSObject

@end
