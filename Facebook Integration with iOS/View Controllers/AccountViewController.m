//
//  AccountViewController.m
//  Facebook Integration with iOS
//
//  Created by osxadmin on 1/23/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import "AccountViewController.h"

//Framework
#import <FBSDKCoreKit/FBSDKProfilePictureView.h>
#import <FBSDKCoreKit/FBSDKAccessToken.h>

@interface AccountViewController ()

@end

@implementation AccountViewController
@synthesize profilePicture;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Create UIBarButtonItem
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(shareContent)];
    self.navigationItem.rightBarButtonItem = shareButton;
    self.navigationItem.title = @"My Account";
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getFBProfile];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Helpers

-(void) shareContent {
    
}

-(void) getFBProfile {
    FBSDKProfilePictureView *profilePictureView = [[FBSDKProfilePictureView alloc] init];
    profilePictureView.frame = CGRectMake(45,150,100,100);
    profilePictureView.profileID = [[FBSDKAccessToken currentAccessToken] userID];
    [self.view addSubview:profilePictureView];
}

@end
