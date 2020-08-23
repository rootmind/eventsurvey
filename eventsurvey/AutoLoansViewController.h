//
//  AutoLoansViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AutoLoansData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"




@interface AutoLoansViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>
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


@property (strong,nonatomic) CommonTextField *txtSalesOfficerName;
@property (strong,nonatomic) CommonTextField *txtCode;
@property (strong,nonatomic) CommonTextField *txtCISNo;
@property (strong,nonatomic) CommonTextField *txtNoYearsUAE;
@property (strong,nonatomic) CommonTextField *txtNameOfSponsor;
@property (strong,nonatomic) CommonTextField *txtAccountNumber;
@property (strong,nonatomic) CommonTextField *txtYCISNo;
@property (strong,nonatomic) CommonTextField *txtBankName;
@property (strong,nonatomic) CommonTextField *txtBranch;
@property (strong,nonatomic) CommonTextField *txtSalaryTransfer;
@property (strong,nonatomic) CommonTextField *txtMonthlyPayments;
@property (strong,nonatomic) CommonTextField *txtDealerOrsellerName;
@property (strong,nonatomic) CommonTextField *txtTelephone;
@property (strong,nonatomic) CommonTextField *txtFax;
@property (strong,nonatomic) CommonTextField *txtMakeOrModel;
@property (strong,nonatomic) CommonTextField *txtMileage;
@property (strong,nonatomic) CommonTextField *txtNused;
@property (strong,nonatomic) CommonTextField *txtNormalOrAlloy;
@property (strong,nonatomic) CommonTextField *txtTransmission;
@property (strong,nonatomic) CommonTextField *txtSunroof;
@property (strong,nonatomic) CommonTextField *txtDealerSalesRepName;



@property (strong,nonatomic) NSString *accountType;


@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@end
