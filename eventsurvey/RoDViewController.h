//
//  RoDViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 05/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "RoDData.h"




@interface RoDViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
@property (strong, nonatomic) NSString *menuName;
 

@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *roDArray;
@property (strong, nonatomic) RoDData *roDData;


@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;



@property (strong,nonatomic) CommonTextField *txtRodSalaryMultiple;
@property (strong,nonatomic) CommonTextField *txtRodOverdraftAmount;
@property (strong,nonatomic) CommonTextField *txtRodRate;
@property (strong,nonatomic) CommonTextField *txtCisNo;
@property (strong,nonatomic) CommonTextField *txtAccountNo;
@property (strong,nonatomic) CommonTextField *txtSecurityChequeNo;
@property (strong,nonatomic) CommonTextField *txtOffTelephone;
@property (strong,nonatomic) CommonTextField *txtResTelephone;
@property (strong,nonatomic) CommonTextField *txtMobileNo;
@property (strong,nonatomic) CommonTextField *txtCampaignCode;
@property (strong,nonatomic) CommonTextField *txtSalaryMultiple;
@property (strong,nonatomic) CommonTextField *txtOverdraftAmount;
@property (strong,nonatomic) CommonTextField *txtRate;
@property (strong,nonatomic) CommonTextField *txtRefName1;
@property (strong,nonatomic) CommonTextField *txtRefContactNo1;
@property (strong,nonatomic) CommonTextField *txtRefName2;
@property (strong,nonatomic) CommonTextField *txtRefContactNo2;




@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@end

