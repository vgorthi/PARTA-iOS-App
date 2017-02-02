//
//  OUActivityHUD.h
//  OneUpp
//
//  Created by Craig Tweedy on 07/01/2015.
//  Copyright (c) 2015 hedgehog lab. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, OUActivityHUDState) {
    OUActivityHUDStateHidden,
    OUActivityHUDStateLoading,
    OUActivityHUDStateSuccess,
    OUActivityHUDStateFailure
};

typedef NS_ENUM(NSInteger, OUActivityHUDAnimationState){
    OUActivityHUDAnimationStateShowing,
    OUActivityHUDAnimationStateHidden
};

typedef NS_ENUM(NSInteger, OUActivityHUDSuccessState) {
    OUActivityHUDSuccessStateStart,
    OUActivityHUDSuccessStateVisible,
    OUActivityHUDSuccessStateEnd
};

typedef void(^OUActivityAnimationUpdateBlock)(OUActivityHUDAnimationState state);

@interface OUActivityHUD : UIView

-(void)showInWindow:(UIWindow *)window withState:(OUActivityHUDState)state animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
-(void)dismiss:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
-(void)transitionToState:(OUActivityHUDState)state animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
-(void)transitionToState:(OUActivityHUDState)state hideAfter:(NSTimeInterval)timeInterval animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;

@end
