//
//  CreditCardViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "CreditCardData.h"
#import "PathData.h"



@interface CreditCardViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UIPopoverPresentationControllerDelegate>

//
//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;
@property (strong, nonatomic) NSString *menuName;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *creditCardArray;
@property (strong, nonatomic) CreditCardData *creditCardData;



@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) CommonTextField *txtCardType;
@property (strong,nonatomic) CommonTextField *txtBpmSubProduct;
@property (strong,nonatomic) CommonTextField *txtDeliveryOption;
@property (strong,nonatomic) CommonTextField *txtYearsInUAE;
@property (strong,nonatomic) CommonTextField *txtPerRefHomeCountryName;
@property (strong,nonatomic) CommonTextField *txtPerRefHomeCountryTelephone;
@property (strong,nonatomic) CommonTextField *txtPerRefUAEName1;
@property (strong,nonatomic) CommonTextField *txtPerRefUAETelephone1;
@property (strong,nonatomic) CommonTextField *txtPerRefUAEName2;
@property (strong,nonatomic) CommonTextField *txtPerRefUAETelephone2;
@property (strong,nonatomic) CommonTextField *txtSuppTitle;
@property (strong,nonatomic) CommonTextField *txtSuppName;
@property (strong,nonatomic) CommonTextField *txtSuppRelationship;
@property (strong,nonatomic) CommonTextField *txtSuppDOB;
@property (strong,nonatomic) CommonTextField *txtAccountNumber;
@property (strong,nonatomic) CommonTextField *txtAccDtlsAccountType;
@property (strong,nonatomic) CommonTextField *txtAutoPaymentAmount;

@property (strong,nonatomic) NSString *recordStatus;
@property (strong,nonatomic) NSString *accountType;



@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;

@end

