//
//  CalculatorController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/14/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "CalculatorData.h"
#import "ErrorData.h"



@interface CalculatorViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UIPopoverPresentationControllerDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *viewMode;

@property (strong, nonatomic) NSString *menuId;

@property (strong, nonatomic) NSDictionary *dataDictionary;
//@property (strong, nonatomic) NSMutableArray *personalArray;
@property (strong, nonatomic) CalculatorData *calculatorData;

@property (strong, nonatomic) NSMutableArray *errorArray;
@property (strong, nonatomic) ErrorData *errorData;




@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;

@property (strong,nonatomic) UITextField *txtRefNo;
@property (strong,nonatomic) UITextField *txtCustomerName;
@property (strong,nonatomic) UITextField *txtDateOfBirth;

@property (strong,nonatomic) UITextField *txtNationality;
@property (strong,nonatomic) UITextField *txtEmployer;
@property (strong,nonatomic) UITextField *txtDesignation;
@property (strong,nonatomic) UITextField *txtResidenceStatus;


@property (strong,nonatomic) UITextField *txtSalary;
@property (strong,nonatomic) UITextField *txtLoanOutstanding;
@property (strong,nonatomic) UITextField *txtCreditCardLimit;
@property (strong,nonatomic) UITextField *txtAmountRequest;
@property (strong,nonatomic) UITextField *txtApprovedStatus;
@property (strong,nonatomic) UITextField *txtPassportNo;
@property (strong,nonatomic) UITextField *txtEmiratesID;


@property (strong,nonatomic) UILabel *lblApprovedStatus;



@property (strong,nonatomic) UIButton *btnCalculate;


@property (strong,nonatomic) UISwitch *swtSalaryTransfer;

@property (strong,nonatomic) NSString *recordStatus;


@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *switchFlag;



@end


