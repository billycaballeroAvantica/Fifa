//
//  LoginViewController.h
//  FifaProject
//
//  Created by Billy.Caballero on 3/12/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVTBaseViewController.h"

@interface LoginViewController : AVTBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
- (IBAction)goSignIn:(id)sender;

@property UITapGestureRecognizer * tapRecognizer;
@property UITextField *activeTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBottomContraint;
@property CGSize keyboardSize;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end
