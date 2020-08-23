//
//  KYCTranViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 23/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef KYCTranViewController_h
#define KYCTranViewController_h


#endif /* KYCTranViewController_h */


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CommonTextField.h"
#import "CommonLabel.h"
#import "PopoverViewController.h"
#import "CommonUtils.h"
#import "PopoverData.h"
#import "KycData.h"
#import "PathData.h"

@interface KYCTranViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, UITextViewDelegate, UIActionSheetDelegate,PopoverViewControllerDelegate,UIWebViewDelegate>

@property (strong, nonatomic) NSString *menuName;
//@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *actionMode;


@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) PopoverData *popoverData;
@property (strong, nonatomic) NSMutableArray *popoverArray;
@property (strong, nonatomic) NSString *refNo;
@property (strong,nonatomic) NSString *existingCustomerFlag;
@property (strong,nonatomic) NSString *existingRefNo;
@property (strong,nonatomic) NSMutableDictionary *popoverCodeValue;



@property (strong, nonatomic) KycData *kycData;
@property (strong, nonatomic) NSMutableArray *kycArray;
//@property (strong, nonatomic) NSMutableArray *dataArray;


@property (strong,nonatomic) CommonTextField *txtsourceFunAccReg;
@property (strong,nonatomic) CommonTextField *txtApproxAnnulturnFunExpt;
@property (strong,nonatomic) CommonTextField *txtTotIncomMonthly;


@property (strong,nonatomic) CommonTextField *txtNoOfTransInaMonthCash;
@property (strong,nonatomic) CommonTextField *txtNoOfTransInaMonthCheq;
@property (strong,nonatomic) CommonTextField *txtTotAmntOfTransAEDCash;
@property (strong,nonatomic) CommonTextField *txtTotAmntOfTransAEDCheq;
@property (strong,nonatomic) CommonTextField *txtPurpsOfTransCash;
@property (strong,nonatomic) CommonTextField *txtPurpsOfTransCheq;

@property (strong,nonatomic) CommonTextField *txtDepNoOfTransInaMonthCash;
@property (strong,nonatomic) CommonTextField *txtDepNoOfTransInaMonthCheq;
@property (strong,nonatomic) CommonTextField *txtDepTotAmntOfTransAEDCash;
@property (strong,nonatomic) CommonTextField *txtDepTotAmntOfTransAEDCheq;
@property (strong,nonatomic) CommonTextField *txtDepPurpsOfTransCash;
@property (strong,nonatomic) CommonTextField *txtDepPurpsOfTransCheq;

@property (strong,nonatomic) CommonTextField *txtMaxDepositsCash;
@property (strong,nonatomic) CommonTextField *txtMaxDepositsCheq;
@property (strong,nonatomic) CommonTextField *txtMaxWithdrawalsCash;
@property (strong,nonatomic) CommonTextField *txtMaxWithdrawalsCheq;

@property (strong,nonatomic) NSString *recordStatus;

//@property (strong,nonatomic) CommonTextField *txtOutNoOfTransInaMonthInternat;
//@property (strong,nonatomic) CommonTextField *txtOutNoOfTransInaMonthLocal;
//@property (strong,nonatomic) CommonTextField *txtOutTotAmntOfTransAEDInternat;
//@property (strong,nonatomic) CommonTextField *txtOutTotAmntOfTransAEDLocal;
//@property (strong,nonatomic) CommonTextField *txtOutPurpsOfTransInternat;
//@property (strong,nonatomic) CommonTextField *txtOutPurpsOfTransLocal;
//
//@property (strong,nonatomic) CommonTextField *txtInNoOfTransInaMonthInternat;
//@property (strong,nonatomic) CommonTextField *txtInNoOfTransInaMonthLocal;
//@property (strong,nonatomic) CommonTextField *txtInTotAmntOfTransAEDInternat;
//@property (strong,nonatomic) CommonTextField *txtInTotAmntOfTransAEDLocal;
//@property (strong,nonatomic) CommonTextField *txtInPurpsOfTransInternat;
//@property (strong,nonatomic) CommonTextField *txtInPurpsOfTransLocal;
//
//@property (strong,nonatomic) CommonTextField *txtInMaxsingAmtInwardremetns;
//@property (strong,nonatomic) CommonTextField *txtInMaxsingAmtOutwardremetns;
//@property (strong,nonatomic) CommonTextField *txtInIntrnlRemitInwardremetns;
//@property (strong,nonatomic) CommonTextField *txtInIntrnlRemiOutwardremetns;

//@property (strong,nonatomic) CommonTextField *txtEDDDetalsBusines;
//@property (strong,nonatomic) CommonTextField *txtEDDHowwasProspts;
//@property (strong,nonatomic) CommonTextField *txtEDDDescrbClntSrc;
//@property (strong,nonatomic) CommonTextField *txtEDDPrdtUsgTrnsPrf;
//@property (strong,nonatomic) CommonTextField *txtEDDNonresdnt;
//@property (strong,nonatomic) CommonTextField *txtEDDDetlsNonresdnt;
//@property (strong,nonatomic) CommonTextField *txtEDDAruAwreAsptsreltd;
//
//@property (strong,nonatomic) CommonTextField *txtIConfmmCheckBox;
//@property (strong,nonatomic) CommonTextField *txtPreparedBy;
//@property (strong,nonatomic) CommonTextField *txtPreDate;
//@property (strong,nonatomic) CommonTextField *txtReviewdBy;
//@property (strong,nonatomic) CommonTextField *txtRevByDate;
//@property (strong,nonatomic) CommonTextField *txtApprovedBy;
//@property (strong,nonatomic) CommonTextField *txtAppByDate;

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