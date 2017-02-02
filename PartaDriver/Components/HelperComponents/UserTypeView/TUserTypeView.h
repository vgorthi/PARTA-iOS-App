//
//  TUserTypeView.h
//  Texci
//
//  Created by Srinivas on 03/08/15.
//  Copyright (c) 2015 Texci. All rights reserved.
//

#import "TView.h"
#import <Masonry.h>
#import "UILabel+Extensions.h"
#import "UIButton+Extensions.h"
#import "UITextView+Extensions.h"
#import "UITextField+Extensions.h"
#import "UIImage+CCImage.h"
#import "Parta-Constants.pch"

@interface TUserTypeView : TView

- (void)setUserTypeImageWith:(UIImage *)image;
- (void)setUserTypeDescrition:(NSString *)userTypeDescription;

- (void)updateSelectedState:(TUserTypeSelectionState)state;

@end
