//
//  ProductViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 07/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PopoverData.h"
#import "ProductData.h"
#import "PathData.h"


@interface ProductViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;
//@property (strong, nonatomic) NSString *viewMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *productArray;
@property (strong, nonatomic) ProductData *productData;

@property (strong,nonatomic) NSString *refNo;

@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;

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


@property (strong,nonatomic) CommonTextField *txtAccountNo;
@property (strong,nonatomic) CommonTextField *txtAccountIBAN;
@property (strong,nonatomic) CommonTextField *txtAccountType;
@property (strong,nonatomic) CommonTextField *txtCurrency;
@property (strong,nonatomic) CommonTextField *txtStmtCycle;
@property (strong,nonatomic) CommonTextField *txtOnlineBankTrans;
@property (strong,nonatomic) CommonTextField *txtAccountOperInstrs;
@property (strong,nonatomic) CommonTextField *txtAccountTitle;
@property (strong,nonatomic) CommonTextField *txtDebitCardReq;
@property (strong,nonatomic) CommonTextField *txtNameCard;
@property (strong,nonatomic) CommonTextField *txtFavoriteCity;


@property (strong,nonatomic) CommonTextField *txtDebitCardDelvChnl;
@property (strong,nonatomic) CommonTextField *txtPinMailerDelvChnl;
@property (strong,nonatomic) CommonTextField *txtTransferSalary;
@property (strong,nonatomic) CommonTextField *txtChequeBookReq;
@property (strong,nonatomic) CommonTextField *txtOverDraftType;
@property (strong,nonatomic) CommonTextField *txtInterestOption;
@property (strong,nonatomic) CommonTextField *txtInterestRate;
@property (strong,nonatomic) CommonTextField *txtSupplCardReq;

@property (strong,nonatomic) CommonTextField *txtPurposeCode;
@property (strong,nonatomic) CommonTextField *txtBusinessCode;
@property (strong,nonatomic) CommonTextField *txtInsuranceCode;
@property (strong,nonatomic) CommonTextField *txtCampaignCode;
@property (strong,nonatomic) CommonTextField *txtSellerID;
@property (strong,nonatomic) CommonTextField *txtSellerChnl;
@property (strong,nonatomic) CommonTextField *txtSchemeID;

@property (strong, nonatomic) NSString *recordStatus;
@property (strong, nonatomic) NSString *accountType;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;

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
