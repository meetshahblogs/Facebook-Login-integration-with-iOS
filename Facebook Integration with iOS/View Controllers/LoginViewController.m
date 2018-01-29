//
//  LoginViewController.m
//  Facebook Integration with iOS
//
//  Created by Meet Shah on 1/19/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountViewController.h"

//Framework
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize fbLoginbButtonView;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  //Documentation
  //https://developers.facebook.com/docs/facebook-login/ios/advanced#profile_picture_view
  
  FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
  loginButton.delegate = self;
  loginButton.center = fbLoginbButtonView.center;
  loginButton.readPermissions = @[@"public_profile", @"email"];
  [self.view addSubview:loginButton];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


#pragma mark - FBSDkLoginKitDelegate Methods

- (void)loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
              error:(NSError *)error {
  if (error) {
    NSLog(@"%@", error.localizedDescription);
  }
  if (result.isCancelled) {
    NSLog(@"User cancelled the login action.");
  } else if (result.declinedPermissions.count > 0) {
    NSLog(@"User has declined permission.");
  } else {
    
    //take user to next the view.
    AccountViewController *accountViewController = [[AccountViewController alloc] initWithNibName:@"AccountViewController" bundle:nil];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:accountViewController];
    [self presentViewController:navController animated:YES completion:nil];
  }
}

- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton {
  NSLog(@"User logged out of the application.");
}


@end
