//
//  OUActivityHUD.m
//  OneUpp
//
//  Created by Craig Tweedy on 07/01/2015.
//  Copyright (c) 2015 hedgehog lab. All rights reserved.
//

#import "OUActivityHUD.h"
#import "Masonry.h"

@interface OUActivityHUD ()

@property (nonatomic, assign) OUActivityHUDSuccessState successState;

@property (nonatomic, assign) OUActivityHUDState hudState;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIActivityIndicatorView *loadingIndicator;
@property (nonatomic, strong) UIImageView *failureIndicator;
@property (nonatomic, strong) UIImageView *successIndicator;

@end

@implementation OUActivityHUD

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setHudState:OUActivityHUDStateHidden];
    }
    return self;
}

-(void)showInWindow:(UIWindow *)window withState:(OUActivityHUDState)state animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [window addSubview:self];
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [self layoutIfNeeded];
    
    [self transitionToState:state animated:animated withUpdateBlock:updateBlock];
}

-(void)dismiss:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    if ([self superview] == nil) {
        return;
    }
    
    [self transitionToState:OUActivityHUDStateHidden animated:YES withUpdateBlock:updateBlock];
}

-(void)transitionToState:(OUActivityHUDState)state animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [self setHudState:state];
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    float duration = 0;
    float springDamping = 1;
    float springVelocity = 1.5;
    if (animated) {
        if (state == OUActivityHUDStateLoading) {
            duration = 0.25;
            springDamping = 0.7;
            springVelocity = 0.1;
        }else {
            duration = 0.5;
        }
        
    }
    
    [[self contentView] setAlpha:1];
    
    if (state==OUActivityHUDStateSuccess) {
        [[self loadingIndicator] setAlpha:0];
    }
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:springDamping initialSpringVelocity:springVelocity options:UIViewAnimationOptionAllowAnimatedContent animations:^{
        [self showHideLayers:state];
        [self configureTheme:state];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self completion:state updateBlock:updateBlock];
    }];
}

-(void)completion:(OUActivityHUDState)state updateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    if (updateBlock != nil) {
        
        if ([self hudState] == OUActivityHUDStateHidden) {
            updateBlock(OUActivityHUDAnimationStateHidden);
        } else {
            updateBlock(OUActivityHUDAnimationStateShowing);
        }
    }
    
    if (state==OUActivityHUDStateSuccess) {
        //More animations
        
        [self setSuccessState:OUActivityHUDSuccessStateVisible];
        
        // tell constraints they need updating
        [self setNeedsUpdateConstraints];
        
        // update constraints now so we can animate the change
        [self updateConstraintsIfNeeded];
        
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            [self layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self setSuccessState:OUActivityHUDSuccessStateEnd];
            
            // tell constraints they need updating
            [self setNeedsUpdateConstraints];
            
            // update constraints now so we can animate the change
            [self updateConstraintsIfNeeded];
            
            [UIView animateWithDuration:0.2 delay:0.3 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
            }];
        }];
        return;
    }
    
    [self setSuccessState:OUActivityHUDSuccessStateStart];
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [self layoutIfNeeded];
    
    
}

-(void)transitionToState:(OUActivityHUDState)state hideAfter:(NSTimeInterval)timeInterval animated:(BOOL)animated withUpdateBlock:(OUActivityAnimationUpdateBlock)updateBlock;
{
    [self transitionToState:state animated:YES withUpdateBlock:updateBlock];
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, timeInterval * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [weakSelf dismiss:animated withUpdateBlock:updateBlock];
    });
}

-(void)showHideLayers:(OUActivityHUDState)state;
{
    switch (state) {
        case OUActivityHUDStateHidden:{
            [[self loadingIndicator] setAlpha:0];
            [[self failureIndicator] setAlpha:0];
            [[self successIndicator] setAlpha:0];
            
            if ([self successState] == OUActivityHUDSuccessStateEnd) {
                [[self contentView] setAlpha:0];
            }
        }
            break;
        case OUActivityHUDStateLoading:
        {
            [[self loadingIndicator] setAlpha:1];
            [[self failureIndicator] setAlpha:0];
            [[self successIndicator] setAlpha:0];
        }
            break;
        case OUActivityHUDStateFailure:
        {
            [[self loadingIndicator] setAlpha:0];
            [[self failureIndicator] setAlpha:1];
            [[self successIndicator] setAlpha:0];
        }
            break;
        case OUActivityHUDStateSuccess:
        {
            [[self loadingIndicator] setAlpha:0];
            [[self failureIndicator] setAlpha:0];
            [[self successIndicator] setAlpha:1];
        }
            break;
            
        default:
            break;
    }
    
    if ([self hudState] == OUActivityHUDStateHidden) {
        if ([[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] endIgnoringInteractionEvents];
        }
    } else {
        if (![[UIApplication sharedApplication] isIgnoringInteractionEvents]) {
            [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
        }
    }
}

-(void)configureTheme:(OUActivityHUDState)state;
{
    switch (state) {
        case OUActivityHUDStateHidden:{
            
        }
            break;
        case OUActivityHUDStateLoading:
        {
            [[self contentView] setBackgroundColor:[UIColor orangeColor]];
        }
            break;
        case OUActivityHUDStateFailure:
        {
            [[self contentView] setBackgroundColor:[UIColor redColor]];
        }
            break;
        case OUActivityHUDStateSuccess:
        {
            [[self contentView] setBackgroundColor:[UIColor greenColor]];
        }
            break;
            
        default:
            break;
    }
}

-(void)updateConstraints;
{
    UIView *superview = [self superview];
        
    [[self contentView] mas_remakeConstraints:^(MASConstraintMaker *make) {
        MASViewAttribute *top = nil;
        int offset = 0;
        if ([self hudState] == OUActivityHUDStateHidden) {
            if ([self successState]==OUActivityHUDSuccessStateEnd) {
                top = superview.mas_top;
            }else{
                top = superview.mas_bottom;
            }
        }
        
        if ([self hudState] == OUActivityHUDStateFailure || [self hudState] == OUActivityHUDStateSuccess || [self hudState] == OUActivityHUDStateLoading) {
            top = superview.mas_top;
        }
        
        if ([self hudState] == OUActivityHUDStateLoading) {
            CGRect screenSize = [[UIScreen mainScreen] bounds];
            offset = screenSize.size.height * 0.8;
        }
        
        make.top.equalTo(top).with.offset(offset);
        make.left.and.right.and.bottom.equalTo(superview);

    }];
    
    [[self loadingIndicator] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo([self contentView]);
    }];
    
    [[self successIndicator] mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo([self contentView]);
        
        switch ([self successState]) {
            case OUActivityHUDSuccessStateStart:
            case OUActivityHUDSuccessStateEnd:
                make.width.equalTo(@0);
                make.height.equalTo(@0);
                break;
            case OUActivityHUDSuccessStateVisible:
                make.width.equalTo(@91);
                make.height.equalTo(@91);
                break;
            default:
                break;
        }
    }];
    
    [[self failureIndicator] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo([self contentView]);
    }];
    
    [super updateConstraints];
}

#pragma mark - Lazy loading

-(UIActivityIndicatorView *)loadingIndicator;
{
    if (_loadingIndicator) {
        return _loadingIndicator;
    }
    
    _loadingIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [_loadingIndicator startAnimating];
    [[self contentView] addSubview:_loadingIndicator];
    
    return _loadingIndicator;
}

-(UIImageView *)failureIndicator;
{
    if (_failureIndicator) {
        return _failureIndicator;
    }
    
    _failureIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_cross"]];
    [[self contentView] addSubview:_failureIndicator];
    
    return _failureIndicator;
}

-(UIImageView *)successIndicator;
{
    if (_successIndicator) {
        return _successIndicator;
    }
    
    _successIndicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_success_animation_tick"]];
    [[self contentView] addSubview:_successIndicator];
    
    return _successIndicator;
}

-(UIView *)contentView;
{
    if (_contentView) {
        return _contentView;
    }
    
    _contentView = [UIView new];
    [self addSubview:_contentView];
    [self bringSubviewToFront:_contentView];
    
    return _contentView;
}

@end
