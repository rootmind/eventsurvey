//
//  SidebarViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 14/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PersonalData.h"



@interface SideBarViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *personalArray;
@property (strong, nonatomic) PersonalData *personalData;


@property (strong, nonatomic) NSMutableArray *labelArray;
@property (strong, nonatomic) NSMutableArray *labelNameArray;
@property (strong, nonatomic) NSMutableArray *label2Array;
@property (strong, nonatomic) NSMutableArray *labelName2Array;

@property (strong, nonatomic) NSMutableArray *componentsArray;
@property (strong, nonatomic) NSMutableArray *componentsNameArray;
@property (strong, nonatomic) NSMutableArray *components2Array;
@property (strong, nonatomic) NSMutableArray *componentsName2Array;

@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *accountType;
@property (strong,nonatomic) CommonTextField *txtRefNo;
@property (strong,nonatomic) UISwitch *txtExistingCustomer;
@property (strong,nonatomic) CommonTextField *txtExtRelation;
@property (strong,nonatomic) CommonTextField *txtExtRelationNo;
@property (strong,nonatomic) CommonTextField *txtCustomerName;

@property (strong,nonatomic) CommonTextField *txtTitle;
@property (strong,nonatomic) CommonTextField *txtCategoryType;
@property (strong,nonatomic) CommonTextField *txtBranch;
@property (strong,nonatomic) CommonTextField *txtJointOwn;
@property (strong,nonatomic) CommonTextField *txtNatureOfRelation;
@property (strong,nonatomic) CommonTextField *txtResidenceStatus;
@property (strong,nonatomic) CommonTextField *txtNationality;
@property (strong,nonatomic) CommonTextField *txtDateOfBirth;
@property (strong,nonatomic) CommonTextField *txtEducation;
@property (strong,nonatomic) CommonTextField *txtMaritalStatus;
@property (strong,nonatomic) CommonTextField *txtGender;
@property (strong,nonatomic) CommonTextField *txtPreferredLang;
@property (strong,nonatomic) CommonTextField *txtFamilyUAE;
@property (strong,nonatomic) CommonTextField *txtFamilySize;
@property (strong,nonatomic) CommonTextField *txtCarOwnership;
@property (strong,nonatomic) CommonTextField *txtCarYear;
@property (strong,nonatomic) CommonTextField *txtMedia;
@property (strong,nonatomic) CommonTextField *txtFavCity;



@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *switchFlag;


@end