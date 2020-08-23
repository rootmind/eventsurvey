//
//  KYCEDDViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 23/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PopoverData.h"
#import "KycData.h"
#import "PathData.h"

@interface KYCEDDViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) PopoverData *popoverData;
@property (strong, nonatomic) NSMutableArray *popoverArray;
@property (strong, nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong, nonatomic) KycData *kycData;
@property (strong, nonatomic) NSMutableArray *kycArray;

@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

//
//@property (strong, nonatomic) NSMutableArray *dataArray;
//





@property (strong,nonatomic) CommonTextField *txtEDDDetalsBusines;
@property (strong,nonatomic) CommonTextField *txtEDDHowwasProspts;
@property (strong,nonatomic) CommonTextField *txtEDDDescrbClntSrc;
@property (strong,nonatomic) CommonTextField *txtEDDPrdtUsgTrnsPrf;
@property (strong,nonatomic) CommonTextField *txtEDDNonresdnt;
@property (strong,nonatomic) CommonTextField *txtEDDDetlsNonresdnt;
@property (strong,nonatomic) CommonTextField *txtEDDAruAwreAsptsreltd;

@property (strong,nonatomic) CommonTextField *txtIConfmmCheckBox;
@property (strong,nonatomic) CommonTextField *txtPreparedBy;
@property (strong,nonatomic) CommonTextField *txtPreDate;
@property (strong,nonatomic) CommonTextField *txtReviewdBy;
@property (strong,nonatomic) CommonTextField *txtRevByDate;
@property (strong,nonatomic) CommonTextField *txtApprovedBy;
@property (strong,nonatomic) CommonTextField *txtAppByDate;

@property (strong,nonatomic) NSString *recordStatus;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;
//
@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;
//
@property (strong, nonatomic) UIWebView *webView;
//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;

//
//

@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;

@end

