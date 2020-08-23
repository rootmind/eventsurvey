//
//  SearchViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 18/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//
//
//  ViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/1/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "SearchData.h"
#import "OTPData.h"




@interface SearchViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *lastLoginDate;
@property (strong, nonatomic) NSString *actionMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *searchArray;
@property (strong, nonatomic) SearchData *searchData;
@property (strong, nonatomic) UIButton *btnSearch;

@property (strong, nonatomic) UITableView *tableView;


@property (strong, nonatomic) NSMutableArray *otpArray;
@property (strong, nonatomic) OTPData *otpData;


//@property (strong, nonatomic) UITextField *txtCIFNumber;
//@property (strong, nonatomic) UITextField *txtAccountNo;
//@property (strong, nonatomic) UITextField *txtCreditCardNo;
//@property (strong, nonatomic) UITextField *txtCustomerName;


//@property (strong, nonatomic) NSString  *cIFNumber;
//@property (strong, nonatomic) NSString  *accountNo;
//@property (strong, nonatomic) NSString  *creditCardNo;
//@property (strong, nonatomic) NSString  *customerName;

@property (strong, nonatomic)  UILabel *lblCIFNumber;
@property (strong, nonatomic)  UILabel *lblAccountNo;
@property (strong, nonatomic)  UILabel *lblCreditCardNo;
@property (strong, nonatomic)  UILabel *lblCustomerName;


@property (strong, nonatomic)  UITextField *txtCIFNumber;
@property (strong, nonatomic)  UITextField *txtAccountNo;
@property (strong, nonatomic)  UITextField *txtCreditCardNo;
@property (strong, nonatomic)  UITextField *txtCustomerName;

@property (strong, nonatomic)  UITextField *txtOTP;

//@property (strong, nonatomic) NSMutableArray *labelArray;
//@property (strong, nonatomic) NSMutableArray *labelNameArray;
//@property (strong, nonatomic) NSMutableArray *label2Array;
//@property (strong, nonatomic) NSMutableArray *labelName2Array;
//
//@property (strong, nonatomic) NSMutableArray *componentsArray;
//@property (strong, nonatomic) NSMutableArray *componentsNameArray;
//@property (strong, nonatomic) NSMutableArray *components2Array;
//@property (strong, nonatomic) NSMutableArray *componentsName2Array;

//@property (strong, nonatomic) NSMutableArray *dataArray;





@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;



@end