//
//  DAVenueMapAnnotationView.m
//  DatingApp
//
//  Created by Christian Rubin on 15/07/2014.
//  Copyright (c) 2014 hedgehog lab. All rights reserved.
//

#import "DAVenueMapAnnotationView.h"
//#import "DALabel.h"
//#import "DAServiceLocator.h"

@interface DAVenueMapAnnotationView()
{
    NSInteger usersForAnnotationView;
}

@end

@implementation DAVenueMapAnnotationView

-(id)initWithAnnotation:(id<MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier count:(NSInteger)count;
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        usersForAnnotationView = count;
        UILabel *numberLabel = [[UILabel alloc] init];
        [numberLabel setText:[NSString stringWithFormat:@"%ld",(long)usersForAnnotationView]];
        if (usersForAnnotationView >= 1) {
            [numberLabel setFrame:CGRectMake(0, 0, 19, 19)];
            [[numberLabel layer] setCornerRadius:9.5f];
        } else if (usersForAnnotationView >= 10) {
            [numberLabel setFrame:CGRectMake(0, 0, 28, 28)];
            [[numberLabel layer] setCornerRadius:14.0f];
        } else if (usersForAnnotationView >= 100) {
            [numberLabel setFrame:CGRectMake(0, 0, 37, 37)];
            [[numberLabel layer] setCornerRadius:17.7f];
        }
        [[numberLabel layer] setMasksToBounds:YES];
        [numberLabel setTextAlignment:NSTextAlignmentCenter];
//        [numberLabel setBackgroundColor:[[[DAServiceLocator sharedInstance] themeService]highlightColor]];
        [numberLabel setTextColor:[UIColor whiteColor]];
        

        
        [self addSubview:numberLabel];
    }
    return self;
}

@end
