////
////  KYCViewController.h
////  Onboard
////
////  Created by Rootmind TechSoft Private Limited on 20/08/15.
////  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
////
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PopoverData.h"
#import "KycData.h"
#import "PathData.h"

@interface KYCViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;

@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSString *menuName;

@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) PopoverData *popoverData;
@property (strong, nonatomic) NSMutableArray *popoverArray;
@property (strong, nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong, nonatomic) KycData *kycData;
@property (strong, nonatomic) NSMutableArray *kycArray;

@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;


//@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic) CommonTextField *txtCustomerName;
@property (strong,nonatomic) CommonTextField *txtUAEResident;
@property (strong,nonatomic) CommonTextField *txtKYCType;
@property (strong,nonatomic) CommonTextField *txtCISNoforexistingrelationship;
@property (strong,nonatomic) CommonTextField *txtPoaGiven;
@property (strong,nonatomic) CommonTextField *txtKYCPreparedon;
@property (strong,nonatomic) CommonTextField *txtNextKYcRiviewDate;
@property (strong,nonatomic) CommonTextField *txtKYcComments;
@property (strong,nonatomic) CommonTextField *txtQA1Exposedperson;
@property (strong,nonatomic) CommonTextField *txtQA2NonResident;
@property (strong,nonatomic) CommonTextField *txtQA3Individuals;
@property (strong,nonatomic) CommonTextField *txtQA4SelectCountries;
@property (strong,nonatomic) CommonTextField *txtQA5CustHRBusiness;
@property (strong,nonatomic) CommonTextField *txtQA6HoldMailCustomer;
@property (strong,nonatomic) CommonTextField *txtQA7ReputationAspects;

@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;
//
@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;
//
@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;

//
//

@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;

@end
