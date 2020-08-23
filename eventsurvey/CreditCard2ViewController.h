//
//  CreditCard2ViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 13/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "CreditCardData.h"
//#import "PathData.h"



@interface CreditCard2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UIPopoverPresentationControllerDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;



@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *creditCardArray;
@property (strong, nonatomic) CreditCardData *creditCardData;



@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) CommonTextField *txtProduct;
@property (strong,nonatomic) CommonTextField *txtNameOfBank;
@property (strong,nonatomic) CommonTextField *txtAccountCCNo ;
@property (strong,nonatomic) CommonTextField *txtCreditLmtMonthPayments;
@property (strong,nonatomic) CommonTextField *txtCreditShield;
@property (strong,nonatomic) CommonTextField *txtAccidentCare;
@property (strong,nonatomic) CommonTextField *txtOsaName1;
@property (strong,nonatomic) CommonTextField *txtOsaTelephone;
@property (strong,nonatomic) CommonTextField *txtOsaName2;
@property (strong,nonatomic) CommonTextField *txtOsaGSM;
@property (strong,nonatomic) CommonTextField *txtOsaName3;
@property (strong,nonatomic) CommonTextField *txtOsaAlShamil;

@property (strong,nonatomic) CommonTextField *txtWaselName;
@property (strong,nonatomic) CommonTextField *txtWaselAccountNumber;
@property (strong,nonatomic) CommonTextField *txtWaselAmount;
@property (strong,nonatomic) CommonTextField *txtWaselWeeklyDay;
@property (strong,nonatomic) CommonTextField *txtWaselMonthlyAmount;
@property (strong,nonatomic) CommonTextField *txtWaselMonthlyDate;
@property (strong,nonatomic) CommonTextField *txtRenewalOption;




@property (strong,nonatomic) NSString *recordStatus;
@property (strong,nonatomic) NSString *accountType;




@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *menuName;

//@property (strong, nonatomic) NSMutableArray *pathArray;
//@property (strong, nonatomic) PathData *pathData;

@end
