//
//  DriverRegisterViewController.m
//  PartaApp
//
//  Created by pavan krishna on 29/11/16.
//  Copyright © 2016 Pavan. All rights reserved.
//

#import "DriverRegisterViewController.h"
#import "UserService.h"
#import "ActivityService.h"
#import "User.h"
#define MR_SHORTHAND
#import <MagicalRecord/MagicalRecord.h>
#import <TAlertView/TAlertView.h>
#import "Reachability.h"
#import <TAlertView.h>
#import <RealReachability.h>
#import "GIFProgressHUD.h"

@interface DriverRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation DriverRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)signUpButtonPressed:(id)sender {
    
    [self saveUserToServer];
}

-(void)saveUserToServer;
{
    UserService *userService = [[UserService alloc] init];
    
    NSMutableDictionary *userDict = [NSMutableDictionary dictionary];
    
    [userDict setObject:[[self firstNameTextField] text] forKey:@"first_name"];
    [userDict setObject:[[self lastNameTextField] text] forKey:@"last_name"];
    [userDict setObject:[[self emailTextField] text] forKey:@"email"];
    [userDict setObject:[[self passwordTextField] text] forKey:@"password"];
    
    GIFProgressHUD *hud = [GIFProgressHUD showHUDWithGIFName:@"newsquares" title:@"Please wait..." detailTitle:@"Creating Account" addedToView:self.view animated:YES];
    hud.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    hud.containerColor = [UIColor colorWithRed:0.09 green:0.22 blue:0.28 alpha:1];
    hud.containerCornerRadius = 10;
    hud.scaleFactor = 2.0;
    hud.minimumPadding = 16;
    hud.titleColor = [UIColor whiteColor];
    hud.detailTitleColor = [UIColor whiteColor];
    hud.titleFont = [UIFont fontWithName:@"Lato-Black" size:20];
    hud.detailTitleFont = [UIFont fontWithName:@"Lato-Black" size:16];
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [userService addUser:userDict withCompletion:^(NSError *error, id results) {
                
                [self performSegueWithIdentifier:@"goToMapScreenFromRegister" sender:nil];

                //user already present and playing so pull his scores and show level screen
                NSLog(@"result:%@",[results objectForKey:@"result"]);
                NSLog(@"result:%@",[results objectForKey:@"user_id"]);
            }];
            [hud hideWithAnimation:YES];
        });
    });
}


@end
