//
//  IdentificationViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/30/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "IdentificationData.h"
#import "PathData.h"



@interface IdentificationViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

//
//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *viewMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *identificationArray;

@property (strong, nonatomic) IdentificationData *identificationData;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;


//@property (strong, nonatomic) NSMutableArray *labelArray;
//@property (strong, nonatomic) NSMutableArray *labelNameArray;
//@property (strong, nonatomic) NSMutableArray *label2Array;
//@property (strong, nonatomic) NSMutableArray *labelName2Array;
//
//@property (strong, nonatomic) NSMutableArray *componentsArray;
//@property (strong, nonatomic) NSMutableArray *componentsNameArray;
//@property (strong, nonatomic) NSMutableArray *components2Array;
//@property (strong, nonatomic) NSMutableArray *componentsName2Array;

@property (strong, nonatomic) NSMutableArray *dataArray;


//@property (strong,nonatomic) CommonTextField *txtPassportNo;
//@property (strong,nonatomic) CommonTextField *txtPassportExpDate;
//@property (strong,nonatomic) CommonTextField *txtPassportIssueDate;
//@property (strong,nonatomic) CommonTextField *txtPassportIssuePlace;
//@property (strong,nonatomic) CommonTextField *txtPassportIssueCountry;
//@property (strong,nonatomic) CommonTextField *txtEmiratesId;
//@property (strong,nonatomic) CommonTextField *txtEmiratesIdExpDate;

@property (strong,nonatomic) CommonTextField *txtMotherMaidenName;
@property (strong,nonatomic) CommonTextField *txtSegment;
@property (strong,nonatomic) CommonTextField *txtPreferredLang;
@property (strong,nonatomic) CommonTextField *txtFamilyUAE;
@property (strong,nonatomic) CommonTextField *txtFamilySize;
@property (strong,nonatomic) CommonTextField *txtCarOwnership;
@property (strong,nonatomic) CommonTextField *txtCarYear;
@property (strong,nonatomic) CommonTextField *txtMedia;
@property (strong,nonatomic) CommonTextField *txtFavCity;
@property (strong,nonatomic) CommonTextField *txtDomicile;

@property (strong,nonatomic) CommonTextField *txtVisaIssuePlace;

@property (strong,nonatomic) CommonTextField *txtImmigrationFile;
@property (strong,nonatomic) CommonTextField *txtVisaIssueDate;
@property (strong,nonatomic) CommonTextField *txtVisaExpDate;

@property (strong,nonatomic) CommonTextField *txtDrivingLicenseNo;
@property (strong,nonatomic) CommonTextField *txtDrivingExpDate;
@property (strong,nonatomic) CommonTextField *txtLabourCardNo;
@property (strong,nonatomic) CommonTextField *txtLabourCardExpDate;



@property (strong, nonatomic) NSString *recordStatus;
@property (strong, nonatomic) NSString *accountType;

@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;


@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
//@property (strong, nonatomic) NSString *switchFlag;

@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;

@end
