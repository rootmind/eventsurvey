//
//  PasswordViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 16/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef PasswordViewController_h
#define PasswordViewController_h


#endif /* PasswordViewController_h */


#import <UIKit/UIKit.h>
#import "PasswordData.h"
#import "UsersData.h"


@interface PasswordViewController : UIViewController < UITextFieldDelegate>

@property (strong, nonatomic) UILabel *lblOldPassword;
@property (strong, nonatomic) UILabel *lblNewPassword;
@property (strong, nonatomic) UILabel *lblRepeatPassword;

@property (strong, nonatomic) UITextField *txtNewPassword;
@property (strong, nonatomic) UITextField *txtOldPassword;
@property (strong, nonatomic) UITextField *txtRepeatPassword;

@property (strong, nonatomic) UIButton *btnChangePassword;



@property (strong, nonatomic) NSString *menuId;


@property (strong, nonatomic) NSDictionary *dataDictionary;



@property (strong, nonatomic) NSMutableArray *passwordArray;
@property (strong, nonatomic) PasswordData *passwordData;


@property (strong, nonatomic) NSMutableArray *userArray;
@property (strong, nonatomic) UsersData *userData;

@end
