//
//  EnquiryViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 29/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "CommonUtils.h"
#import "PersonalData.h"



@interface EnquiryViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,UIWebViewDelegate,  UISplitViewControllerDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSString *recordStatus;


@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) NSMutableArray *personalArray;
@property (strong, nonatomic) PersonalData *personalData;


@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong, nonatomic) NSString *refNo;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;


@property (strong,nonatomic) NSString *menuId;



@end