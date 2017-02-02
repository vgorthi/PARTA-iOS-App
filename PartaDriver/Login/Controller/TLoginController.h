//
//  TLoginController.h
//  Texci
//
//  Created by pavan krishna on 30/07/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TController.h"
#import "TLoginView.h"
#import "TLoginControllerProtocol.h"
#import "UILabel+Extensions.h"
#import "UIButton+Extensions.h"
#import "UITextView+Extensions.h"
#import "UITextField+Extensions.h"
#import "UIImage+CCImage.h"

@interface TLoginController : TController<TLoginControllerProtocol,TLoginViewDataSource,TLoginViewDelgate>

@property (nonatomic, strong) TLoginView *loginView;

@end
