//
//  PersonalLoan2ViewController.h
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




@interface PersonalLoan2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>

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





@property (strong,nonatomic) CommonTextField *txtTotalFinance;
@property (strong,nonatomic) CommonTextField *txtInterestRate;
@property (strong,nonatomic) CommonTextField *txtTenor;
@property (strong,nonatomic) CommonTextField *txtInstallmentAmount;
@property (strong,nonatomic) CommonTextField *txtStartingDate;
@property (strong,nonatomic) CommonTextField *txtLastInstallmentAmount;
@property (strong,nonatomic) CommonTextField *txtNoOfInstallments;
@property (strong,nonatomic) CommonTextField *txtProcessingFee;
@property (strong,nonatomic) CommonTextField *txtInsuranceAmount;
@property (strong,nonatomic) CommonTextField *txtSettlementOwnResoures;
@property (strong,nonatomic) CommonTextField *txtSettlementRepeatLoan;
@property (strong,nonatomic) CommonTextField *txtSettlementOtherBank;
@property (strong,nonatomic) CommonTextField *txtOtherFees;





@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@end
