//
//  ContactViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 22/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "ContactData.h"
#import "PathData.h"



@interface ContactViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;
@property (strong, nonatomic) NSString *userGroup;

@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;


@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *contactArray;
@property (strong, nonatomic) ContactData *contactData;

@property (strong, nonatomic) NSString *refNo;
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


@property (strong,nonatomic) CommonTextField *txtMailOption;
@property (strong,nonatomic) CommonTextField *txtDebitCardDelvChnl;
@property (strong,nonatomic) CommonTextField *txtEstatement;
@property (strong,nonatomic) CommonTextField *txtEmailAddress;
@property (strong,nonatomic) CommonTextField *txtEmailAddress2;
@property (strong,nonatomic) CommonTextField *txtMobileNo;
@property (strong,nonatomic) CommonTextField *txtServiceProvider;
@property (strong,nonatomic) CommonTextField *txtMobileNo2;
@property (strong,nonatomic) CommonTextField *txtCourierAdd;

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

