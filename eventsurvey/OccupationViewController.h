//
//  OccupationViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 07/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "OccupationData.h"
#import "PathData.h"



@interface OccupationViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;

@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *occupationArray;
@property (strong, nonatomic) OccupationData *occupationData;


@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) NSString *refNo;

@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

@property (strong,nonatomic) CommonTextField *txtOccupationType;
@property (strong,nonatomic) CommonTextField *txtOccupation;
@property (strong,nonatomic) CommonTextField *txtDesignation;
@property (strong,nonatomic) CommonTextField *txtNameOforganization;
@property (strong,nonatomic) CommonTextField *txtDateOfJoining;
@property (strong,nonatomic) CommonTextField *txtMonthlySalary;
@property (strong,nonatomic) CommonTextField *txtEmployeNo;

@property (strong,nonatomic) NSString *recordStatus;
@property (strong, nonatomic) NSString *accountType;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *menuName;

@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;


@end