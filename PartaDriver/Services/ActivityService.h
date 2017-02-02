//
//  ActivityService.h
//  NumberLine
//
//  Created by pavan krishna on 22/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OUActivityHUD.h"

@interface ActivityService : NSObject

+(id)sharedInstance;

#pragma mark - Activity + Indicators

-(void)showLoadingIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
-(void)hideLoadingIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;

-(void)showSuccessIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
-(void)showFailureIndicator:(NSTimeInterval)hideAfter withAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;

@end
