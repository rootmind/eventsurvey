//
//  DocChecklistViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 10/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


#import "DocChecklistData.h"
#import "CommonUtils.h"
#import "PathData.h"




@interface DocChecklistViewController : UIViewController <UITableViewDelegate,UITableViewDataSource, UIWebViewDelegate,  UIActionSheetDelegate>
//
//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *docChecklistArray;
@property (strong, nonatomic) DocChecklistData *docChecklistData;


@property (strong, nonatomic) NSMutableArray *switchArray;
@property (strong, nonatomic) NSMutableArray *switchStateArray;

@property (strong,nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
//@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

//
//@property (strong,nonatomic) CommonTextField *txtAcOpeningForm;
//@property (strong,nonatomic) CommonTextField *txtPassportCopy;
//@property (strong,nonatomic) CommonTextField *txtAdditionalDocuments;
//@property (strong,nonatomic) CommonTextField *txtKnowYourCustomer;
//@property (strong,nonatomic) CommonTextField *txtSpecimenSignatureCard;
//@property (strong,nonatomic) CommonTextField *txtENameCheckDone;
//@property (strong,nonatomic) CommonTextField *txtCustomerEligibleFor;

//@property (strong,nonatomic) NSString *docID;
//@property (strong,nonatomic) NSString *uploaded;

@property (strong,nonatomic) NSString *menuName;




@property (strong,nonatomic) NSString *recordStatus;
@property (strong, nonatomic) NSString *accountType;

@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;

@property (strong,nonatomic) NSString *menuId;
@property (strong, nonatomic) NSMutableArray *pathArray;
@property (strong, nonatomic) PathData *pathData;

@end
