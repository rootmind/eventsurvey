//
//  PersonalLoanViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 04/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PersonalLoanData.h"




@interface PersonalLoanViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>

//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
@property (strong, nonatomic) NSString *menuName;



@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *personalLoanArray;
@property (strong, nonatomic) PersonalLoanData *personalLoanData;


@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;


//@property (strong,nonatomic) CommonTextField *txtSalesOfficerName;



@property (strong,nonatomic) CommonTextField *txtAccountNo;
@property (strong,nonatomic) CommonTextField *txtFinanceAccountNo;
@property (strong,nonatomic) CommonTextField *txtCampaignCode;
@property (strong,nonatomic) CommonTextField *txtWifeOrHusbandEmployed;
@property (strong,nonatomic) CommonTextField *txtNoOfChildren;
@property (strong,nonatomic) CommonTextField *txtEducation;
@property (strong,nonatomic) CommonTextField *txtIWantApplyFor;
@property (strong,nonatomic) CommonTextField *txtPurposeOfLoan;
@property (strong,nonatomic) CommonTextField *txtPersonalRName;
@property (strong,nonatomic) CommonTextField *txtPersonalRTelephone;
@property (strong,nonatomic) CommonTextField *txtHealthQA1;
@property (strong,nonatomic) CommonTextField *txtHealthQA2;
@property (strong,nonatomic) CommonTextField *txtHealthQB1;
@property (strong,nonatomic) CommonTextField *txtHealthQB2;
@property (strong,nonatomic) CommonTextField *txtHealthAddress;
@property (strong,nonatomic) CommonTextField *txtNameBeneficiary1;
@property (strong,nonatomic) CommonTextField *txtNameBeneficiary2;




@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@end

