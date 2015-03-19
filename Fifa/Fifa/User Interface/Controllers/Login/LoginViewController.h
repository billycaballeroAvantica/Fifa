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

@property (strong, nonatomic) UITapGestureRecognizer * tapRecognizer;
@property (weak, nonatomic) UITextField *activeTextField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginBottomContraint;
@property (nonatomic) CGSize keyboardSize;
@property (weak, nonatomic) IBOutlet UIButton *btnLogin;

@end
