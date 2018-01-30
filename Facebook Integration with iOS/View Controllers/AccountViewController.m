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
#import <FBSDKShareKit/FBSDKSharingContent.h>
#import <FBSDKShareKit/FBSDKShareLinkContent.h>
#import <FBSDKShareKit/FBSDKShareButton.h>
#import <FBSDKGraphRequest.h>
#import <FBSDKShareKit/FBSDKShareDialog.h>

@interface AccountViewController () {
  FBSDKProfile *fbsdkProfile;
  FBSDKShareButton *shareButton;
  FBSDKShareLinkContent *content;
}

@end

@implementation AccountViewController
@synthesize profileImageView;
@synthesize shareButtonView;

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.title = @"My Account";
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [FBSDKProfile loadCurrentProfileWithCompletion:
     ^(FBSDKProfile *profile, NSError *error) {
       if (profile) {
         fbsdkProfile = profile;
         
         self.navigationItem.title = [NSString stringWithFormat:@"Welcome, %@", profile.name];
         NSURL *url = [fbsdkProfile imageURLForPictureMode:FBSDKProfilePictureModeSquare size:CGSizeMake(35, 35)];
         UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
         
         UIView *profileView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
         profileView.layer.cornerRadius = profileView.frame.size.width/2;
         profileView.clipsToBounds = YES;
         profileView.userInteractionEnabled = YES;
         UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showActionSheet)];
         [profileView addGestureRecognizer:tapGestureRecognizer];
         UIImageView *profileImageView = [[UIImageView alloc] initWithImage:image];
         [profileView addSubview:profileImageView];
         
         UIBarButtonItem *profileButton = [[UIBarButtonItem alloc] initWithCustomView:profileView];
         self.navigationItem.rightBarButtonItem = profileButton;
       }
     }];
  });

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - Helper Method

-(void)showActionSheet {
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cancel" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
  [alertController addAction:[UIAlertAction actionWithTitle:@"Logout" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    FBSDKLoginManager *loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager logOut];
    
    //Take user back to LoginView
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
    [self presentViewController:loginViewController animated:YES completion:nil];
  }]];
  
  [self presentViewController:alertController animated:YES completion:nil];}


@end
