//
//  AddressViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 21/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"

#import "AddressData.h"
#import "PathData.h"

@interface AddressViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;


@property (strong, nonatomic) NSMutableArray *addressArray;
@property (strong, nonatomic) AddressData *addressData;


@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;


@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) CommonTextField *txtDepartment;
@property (strong,nonatomic) CommonTextField *txtStreetName;
@property (strong,nonatomic) CommonTextField *txtBuildingName;
@property (strong,nonatomic) CommonTextField *txtNearestLandmark;
@property (strong,nonatomic) CommonTextField *txtFlatNo;
@property (strong,nonatomic) CommonTextField *txtPoBox;
@property (strong,nonatomic) CommonTextField *txtCity;
@property (strong,nonatomic) CommonTextField *txtTelePhone;
@property (strong,nonatomic) CommonTextField *txtExtension;
@property (strong,nonatomic) CommonTextField *txtFax;

@property (strong,nonatomic) CommonTextField *txtResStreetName;
@property (strong,nonatomic) CommonTextField *txtResBuildingName;
@property (strong,nonatomic) CommonTextField *txtResNearestLandmark;
@property (strong,nonatomic) CommonTextField *txtResFlatNo;
@property (strong,nonatomic) CommonTextField *txtResPoBox;
@property (strong,nonatomic) CommonTextField *txtResCity;
@property (strong,nonatomic) CommonTextField *txtResTelePhone;
@property (strong,nonatomic) CommonTextField *txtResidenceType;

@property (strong,nonatomic) CommonTextField *txtCountry;
@property (strong,nonatomic) CommonTextField *txtHCity;

@property (strong,nonatomic) CommonTextField *txtHMobile;
@property (strong,nonatomic) CommonTextField *txtHTelePhone;
@property (strong,nonatomic) CommonTextField *txtAddress1;
@property (strong,nonatomic) CommonTextField *txtAddress2;
@property (strong,nonatomic) CommonTextField *txtAddress3;

@property (strong,nonatomic) NSString *recordStatus;
@property (strong, nonatomic) NSString *accountType;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;

@property (strong, nonatomic) NSString *menuName;


@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;


@end