//
//  LoginViewController.m
//  Facebook Integration with iOS
//
//  Created by Meet Shah on 1/19/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
  // Optional: Place the button in the center of your view.
  loginButton.center = self.view.center;
  [self.view addSubview:loginButton];
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

@end
