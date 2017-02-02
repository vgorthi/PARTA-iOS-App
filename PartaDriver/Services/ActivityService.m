//
//  ActivityService.m
//  NumberLine
//
//  Created by pavan krishna on 22/07/16.
//  Copyright © 2016 NumberLine. All rights reserved.
//

#import "ActivityService.h"
#import "OUActivityHUD.h"

@interface ActivityService ()

@property (nonatomic, strong) OUActivityHUD *loadingIndicator;

@end

static ActivityService *sharedInstance = nil;

@implementation ActivityService

//static func displayIndicator(maskType: SVProgressHUDMaskType = .Clear) {
//    
//    SVProgressHUD.setBackgroundColor(UIColor.appNavBarColor())
//    SVProgressHUD.setForegroundColor(UIColor.appCardFillColor())
//    SVProgressHUD.showWithMaskType(maskType)
//}
//
//static func dismissIndicator() {
//    SVProgressHUD.dismiss()
//}

-(void)initializeSharedInstance;
{

}

+(id)sharedInstance;
{
    static ActivityService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ActivityService alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}


#pragma mark - Activity + Loading Indicators

-(void)showLoadingIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [[self loadingIndicator] showInWindow:[UIApplication sharedApplication].keyWindow withState:OUActivityHUDStateLoading animated:YES withUpdateBlock:updateBlock];
}

-(void)hideLoadingIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [[self loadingIndicator] dismiss:YES withUpdateBlock:updateBlock];
}

-(void)showSuccessIndicatorWithAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [[self loadingIndicator] transitionToState:OUActivityHUDStateSuccess hideAfter:1.6 animated:YES withUpdateBlock:updateBlock];
}

-(void)showFailureIndicator:(NSTimeInterval)hideAfter withAnimationUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [[self loadingIndicator] transitionToState:OUActivityHUDStateFailure hideAfter:hideAfter animated:YES withUpdateBlock:updateBlock];
}

-(OUActivityHUD *)loadingIndicator;
{
    if (_loadingIndicator) {
        return _loadingIndicator;
    }
    
    _loadingIndicator = [OUActivityHUD new];
    
    return _loadingIndicator;
}
@end
