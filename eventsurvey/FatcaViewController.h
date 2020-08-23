//
//  FatcaViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 09/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PersonalData.h"
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "OnBoardData.h"


@interface FatcaViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate,UISplitViewControllerDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *onBoardArray;

@property (strong, nonatomic) OnBoardData *onBoardData;






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



@property (strong,nonatomic) CommonTextField *txtAccClassif;
@property (strong,nonatomic) CommonTextField *txtOtherNationality;
@property (strong,nonatomic) CommonTextField *txtCountryOfBirth;
@property (strong,nonatomic) CommonTextField *txtUsTaxpayer;
@property (strong,nonatomic) CommonTextField *txtResUSMailAdd;
@property (strong,nonatomic) CommonTextField *txtUSMailAdd1;
@property (strong,nonatomic) CommonTextField *txtUSMailAddPOBox;
@property (strong,nonatomic) CommonTextField *txtUSMailAddPhone;
@property (strong,nonatomic) CommonTextField *txtUSMailAdd2;
@property (strong,nonatomic) CommonTextField *txtOwnerUSTelePhNo;
@property (strong,nonatomic) CommonTextField *txtUsCountryCode;
@property (strong,nonatomic) CommonTextField *txtPhoneNo;
@property (strong,nonatomic) CommonTextField *txtOwnerUSProp;
@property (strong,nonatomic) CommonTextField *txtOwnerUSPropPOBox;
@property (strong,nonatomic) CommonTextField *txtOwnerUSPropPhoneNo;
@property (strong,nonatomic) CommonTextField *txtUsPropAdd1;
@property (strong,nonatomic) CommonTextField *txtUsPropAdd2;
@property (strong,nonatomic) CommonTextField *txtUsPropAdd3;
@property (strong,nonatomic) CommonTextField *txtUBOAddUS;
@property (strong,nonatomic) CommonTextField *txtUBOAddUSAdd1;
@property (strong,nonatomic) CommonTextField *txtUBOAddUSAdd2;
@property (strong,nonatomic) CommonTextField *txtUBOAddUSAdd3;
@property (strong,nonatomic) CommonTextField *txtUBOAddUSPhone;
@property (strong,nonatomic) CommonTextField *txtUBOAddUSPOBox;
@property (strong,nonatomic) CommonTextField *txtSignAuthAddUS;
@property (strong,nonatomic) CommonTextField *txtSignUSAdd1;
@property (strong,nonatomic) CommonTextField *txtSignUSAdd2;
@property (strong,nonatomic) CommonTextField *txtSignUSAdd3;
@property (strong,nonatomic) CommonTextField *txtSignUSAddPhone;
@property (strong,nonatomic) CommonTextField *txtSignUSAddPOBox;
@property (strong,nonatomic) CommonTextField *txtUsGreenCardHolder;
@property (strong,nonatomic) CommonTextField *txtGreenCardNumber;
@property (strong,nonatomic) CommonTextField *txtUsSSNHolder;
@property (strong,nonatomic) CommonTextField *txtUsSSN;
@property (strong,nonatomic) CommonTextField *txtSIUSBenificiary;
@property (strong,nonatomic) CommonTextField *txtSIAmount;
@property (strong,nonatomic) CommonTextField *txtSIFrequency;
@property (strong,nonatomic) CommonTextField *txtSIBenefName;
@property (strong,nonatomic) CommonTextField *txtSIAccNo;
@property (strong,nonatomic) CommonTextField *txtSIBranchCode;
@property (strong,nonatomic) CommonTextField *txtSIBankName;
@property (strong,nonatomic) CommonTextField *txtBusinessIncomeUS;
@property (strong,nonatomic) CommonTextField *txtWRecipt;
@property (strong,nonatomic) CommonTextField *txtBSWaiver;
@property (strong,nonatomic) CommonTextField *txtListedSExchange;
@property (strong,nonatomic) CommonTextField *txtTin;
@property (strong,nonatomic) CommonTextField *txtFatcaEntity;



@property (strong, nonatomic) NSTimer *timer;
@property (strong, nonatomic) UILabel *timerView;

@property (strong, nonatomic) UIToolbar *dateToolBar;
@property (strong, nonatomic) UIDatePicker *datePicker;

@property (strong, nonatomic) UIWebView *webView;
@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
@property (strong,nonatomic) UILabel *lblLoading;
@property (strong, nonatomic) NSString *switchFlag;


@end