//
//  LoginViewController.h
//  Facebook Integration with iOS
//
//  Created by Meet Shah on 1/19/18.
//  Copyright © 2018 Meet Shah. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface LoginViewController : UIViewController<FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet UIView *fbLoginbButtonView;

@end
