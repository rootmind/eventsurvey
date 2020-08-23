//
//  AutoLoans3ViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 30/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AutoLoansData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"




@interface AutoLoans3ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>

//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSString *menuName;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *autoLoansArray;
@property (strong, nonatomic) AutoLoansData *autoLoansData;


@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
//@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;




@property (strong,nonatomic) CommonTextField *txtGuarantorName;
@property (strong,nonatomic) CommonTextField *txtGuarantorAddress;
@property (strong,nonatomic) CommonTextField *txtGuarantorTelephone;
@property (strong,nonatomic) CommonTextField *txtGuarantorMonthlyIncome;
@property (strong,nonatomic) CommonTextField *txtGuarantorBankName;
@property (strong,nonatomic) CommonTextField *txtGuarantorAccountNo;
@property (strong,nonatomic) CommonTextField *txtPersonalRefName1;
@property (strong,nonatomic) CommonTextField *txtPersonalRefAddress1;
@property (strong,nonatomic) CommonTextField *txtPersonalRefTelephone1;
@property (strong,nonatomic) CommonTextField *txtPersonalRefName2;
@property (strong,nonatomic) CommonTextField *txtPersonalRefAddress2;
@property (strong,nonatomic) CommonTextField *txtPersonalRefTelephone2;
@property (strong,nonatomic) CommonTextField *txtCaseOutcome;

@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;



@end

