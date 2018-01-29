//
//  AccountViewController.m
//  Facebook Integration with iOS
//
//  Created by Meet Shah on 1/28/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "AccountViewController.h"
#import "LoginViewController.h"

//Framework
#import <FBSDKCoreKit/FBSDKProfile.h>
#import <FBSDKLoginKit/FBSDKLoginManager.h>

@interface AccountViewController () {
  FBSDKProfile *fbsdkProfile;
}

@end

@implementation AccountViewController
@synthesize fbProfileDisplayName;
@synthesize fbProfilePicture;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.title = @"My Account";
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Log Out" style:UIBarButtonItemStylePlain target:self action:@selector(logOutUser)];
  
  [FBSDKProfile loadCurrentProfileWithCompletion:
   ^(FBSDKProfile *profile, NSError *error) {
     if (profile) {
       fbsdkProfile = profile;
       //set display name
       [fbProfileDisplayName setText:profile.name];
       NSURL *url = [fbsdkProfile imageURLForPictureMode:FBSDKProfilePictureModeSquare size:CGSizeMake(100, 100)];
       UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
       [fbProfilePicture setImage:image];
     }
   }];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Helper Method
-(void) logOutUser {
  FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
  [loginManager logOut];
  
  //Take user back to LoginView
  LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
  [self presentViewController:loginViewController animated:YES completion:nil];
}

@end
