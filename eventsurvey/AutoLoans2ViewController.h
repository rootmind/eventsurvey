//
//  AutoLoans2ViewController.h
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




@interface AutoLoans2ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>
//
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
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;



@property (strong,nonatomic) CommonTextField *txtYearOfManufacture;
@property (strong,nonatomic) CommonTextField *txtColor;
@property (strong,nonatomic) CommonTextField *txtEngineNo;
@property (strong,nonatomic) CommonTextField *txtChassisNo;
@property (strong,nonatomic) CommonTextField *txtRegistrationEmirate;

@property (strong,nonatomic) CommonTextField *txtPriceOfVehicle;
@property (strong,nonatomic) CommonTextField *txtVehicleInsurance;
@property (strong,nonatomic) CommonTextField *txtOtherCharges;


@property (strong,nonatomic) CommonTextField *txtTotalCost;
@property (strong,nonatomic) CommonTextField *txtDownPayment;
@property (strong,nonatomic) CommonTextField *txtTradeinValue;
@property (strong,nonatomic) CommonTextField *txtTotalFinancedAmount;
@property (strong,nonatomic) CommonTextField *txtInterestRate;
@property (strong,nonatomic) CommonTextField *txtRepaymentAmount;
@property (strong,nonatomic) CommonTextField *txtProcessingFee;
@property (strong,nonatomic) CommonTextField *txtTenor;
@property (strong,nonatomic) CommonTextField *txtEMI;
@property (strong,nonatomic) CommonTextField *txtInsuranceCompanyName;
@property (strong,nonatomic) CommonTextField *txtDueDate;
@property (strong,nonatomic) CommonTextField *txtRenewalDate;
@property (strong,nonatomic) CommonTextField *txtPolicyNo;


@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;




@end

