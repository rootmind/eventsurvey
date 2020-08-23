//
//  DashboardViewController.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DashboardViewController.h"
//#import "OnBoardViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "DashboardData.h"
//#import "IdentificationViewController.h"
//#import "OccupationViewController.h"
//#import "AddressViewController.h"
//#import "ContactViewController.h"
//#import "PersonalViewController.h"
//#import "ProductViewController.h"
//#import "KYCViewController.h"
//#import "KYCTranViewController.h"
//#import "QueueViewController.h"
//#import "FatcaViewController.h"
//#import "SearchViewController.h"
#import "CommonUtils.h"
#import "QueueViewController.h"

@interface DashboardViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red



@implementation DashboardViewController


@synthesize userid;
@synthesize sessionid;
@synthesize activityIndicator;
@synthesize lastLoginDate;

@synthesize dataDictionary;
@synthesize dashboardAssetArray;
@synthesize dashboardAsset;
@synthesize dashboardLiabilityArray;
@synthesize dashboardLiability;

@synthesize dashboardWebView;


//@synthesize accountName;
//@synthesize accountNumber;
//@synthesize accountCurrency;
//@synthesize accountAvlBalance;
//@synthesize accountCurrentBalance;
//@synthesize accountStatus;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];
    //[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1];//[UIColor whiteColor];
    
    //[self.navigationItem setHidesBackButton:YES animated:YES];
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];

    
    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
    wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    wallet.contentMode=UIViewContentModeCenter;
    wallet.layer.masksToBounds=YES;
    [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
    [wallet.layer setBorderWidth:2.0f];
    [wallet.layer setCornerRadius:15.0f];
    [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
    [self.view addSubview:wallet];*/
 
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
//    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
//    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
//    companyLogo.clipsToBounds = NO;
//    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    ////self.navigationItem.titleView=companyLogo;
    
    self.navigationItem.title=@"Dashboard";
    
//    
//    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    
//    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
//    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
//    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
//    //companyLogo.contentMode=UIViewContentModeCenter;
//    companyLogo.contentMode = UIViewContentModeScaleToFill;
//    companyLogo.clipsToBounds = NO;
//    companyLogo.layer.masksToBounds=NO;
//    //[self.view addSubview:companyLogo];  
//    //self.navigationItem.titleView=companyLogo;
    
    
    //-------accounts
//    UIButton *btnAccounts = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnAccounts.frame = CGRectMake(40,80,60,60);
//    [btnAccounts setTitle:@"Accounts" forState:UIControlStateNormal];
//    [btnAccounts setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnAccounts.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *AccountsImage = [[UIImage imageNamed:@"accounts-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnAccounts setImage:AccountsImage forState:UIControlStateNormal ];
//    [btnAccounts.titleLabel setFont:[UIFont boldSystemFontOfSize:14]]; //[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnAccounts.backgroundColor = [UIColor whiteColor];
//    [btnAccounts.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnAccounts.layer setBorderWidth:2.0f];
//    [btnAccounts.layer setCornerRadius:15.0f];
//    [btnAccounts.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnAccounts.layer setShadowOpacity:0.8f];
//    [btnAccounts.layer setShadowRadius:12.0f];
//    btnAccounts.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnAccounts.contentMode=UIViewContentModeCenter;
//    btnAccounts.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingAccounts = 6.0;
//    CGSize imageAccountsSize = AccountsImage.size;
//    btnAccounts.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageAccountsSize.width, - (imageAccountsSize.height + spacingAccounts), 0.0);
//    CGSize titleAccountsSize = [btnAccounts.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnAccounts.titleLabel.font}];
//    btnAccounts.imageEdgeInsets = UIEdgeInsetsMake(- (titleAccountsSize.height + spacingAccounts), 0.0, 0.0, - titleAccountsSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnAccounts addTarget:self action:@selector(btnAccounts:) forControlEvents:UIControlEventTouchUpInside];
//
//    btnAccounts.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnAccounts];
    
    
 

    //---------
 
//    //------credit card
//    UIButton *btnCreditCard = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnCreditCard.frame = CGRectMake(120,80,60,60);
//    [btnCreditCard setTitle:@"Credit Card" forState:UIControlStateNormal];
//    [btnCreditCard setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnCreditCard.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ccImage = [[UIImage imageNamed:@"credit-cards-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnCreditCard setImage:ccImage forState:UIControlStateNormal ];
//    [btnCreditCard.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnCreditCard.backgroundColor = [UIColor whiteColor];
//    [btnCreditCard.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnCreditCard.layer setBorderWidth:2.0f];
//    [btnCreditCard.layer setCornerRadius:15.0f];
//    [btnCreditCard.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnCreditCard.layer setShadowOpacity:0.8f];
//    [btnCreditCard.layer setShadowRadius:12.0f];
//    btnCreditCard.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnCreditCard.contentMode=UIViewContentModeCenter;
//    btnCreditCard.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingCC = 6.0;
//    CGSize imageCCSize = ccImage.size;
//    btnCreditCard.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageCCSize.width, - (imageCCSize.height + spacingCC), 0.0);
//    CGSize titleCCSize = [btnCreditCard.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnCreditCard.titleLabel.font}];
//    btnCreditCard.imageEdgeInsets = UIEdgeInsetsMake(- (titleCCSize.height + spacingCC), 0.0, 0.0, - titleCCSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnCreditCard addTarget:self action:@selector(btnCreditCard:) forControlEvents:UIControlEventTouchUpInside];
//    btnCreditCard.translatesAutoresizingMaskIntoConstraints=NO;
//    //[self.view addSubview:btnCreditCard];
//    //-----------
//

    

    
//    //-----deposits
//    UIButton *btnDeposit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnDeposit.frame = CGRectMake(200,80,60,60);
//    [btnDeposit setTitle:@"Deposits" forState:UIControlStateNormal];
//    [btnDeposit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnDeposit.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *depositImage = [[UIImage imageNamed:@"deposit-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnDeposit setImage:depositImage forState:UIControlStateNormal ];
//    [btnDeposit.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnDeposit.backgroundColor = [UIColor whiteColor];
//    [btnDeposit.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnDeposit.layer setBorderWidth:2.0f];
//    [btnDeposit.layer setCornerRadius:15.0f];
//    [btnDeposit.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnDeposit.layer setShadowOpacity:0.8f];
//    [btnDeposit.layer setShadowRadius:12.0f];
//    btnDeposit.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnDeposit.contentMode=UIViewContentModeCenter;
//    btnDeposit.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacing = 6.0;
//    CGSize imageSize = depositImage.size;
//    btnDeposit.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSize.width, - (imageSize.height + spacing), 0.0);
//    CGSize titleSize = [btnDeposit.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnDeposit.titleLabel.font}];
//    btnDeposit.imageEdgeInsets = UIEdgeInsetsMake(- (titleSize.height + spacing), 0.0, 0.0, - titleSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnDeposit addTarget:self action:@selector(btnDeposit:) forControlEvents:UIControlEventTouchUpInside];
//    btnDeposit.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnDeposit];
    //-------
    
    
    

//    //-------transfers
//    UIButton *btnTransfer = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnTransfer.frame = CGRectMake(40,170,60,60);
//    [btnTransfer setTitle:@"Trasnsfer" forState:UIControlStateNormal];
//    [btnTransfer setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnTransfer.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *transferImage = [[UIImage imageNamed:@"transfer-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnTransfer setImage:transferImage forState:UIControlStateNormal ];
//    [btnTransfer.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnTransfer.backgroundColor = [UIColor whiteColor];
//    [btnTransfer.layer setBorderColor:[UIColor borderColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnTransfer.layer setBorderWidth:2.0f];
//    [btnTransfer.layer setCornerRadius:15.0f];
//    [btnTransfer.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnTransfer.layer setShadowOpacity:0.8f];
//    [btnTransfer.layer setShadowRadius:12.0f];
//    btnTransfer.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnTransfer.contentMode=UIViewContentModeCenter;
//    btnTransfer.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingTransfer = 6.0;
//    CGSize imageTransferSize = transferImage.size;
//    btnTransfer.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageTransferSize.width, - (imageTransferSize.height + spacingTransfer), 0.0);
//    CGSize titleTransferSize = [btnTransfer.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnTransfer.titleLabel.font}];
//    btnTransfer.imageEdgeInsets = UIEdgeInsetsMake(- (titleTransferSize.height + spacingTransfer), 0.0, 0.0, - titleTransferSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnTransfer addTarget:self action:@selector(btnTransfer:) forControlEvents:UIControlEventTouchUpInside];
//    btnTransfer.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnTransfer];
    //---------
    
//    //------Bill payments
//    UIButton *btnBillpay = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnBillpay.frame = CGRectMake(120,170,60,60);
//    [btnBillpay setTitle:@"Bill Pay" forState:UIControlStateNormal];
//    [btnBillpay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnBillpay.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *billImage = [[UIImage imageNamed:@"billpay-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnBillpay setImage:billImage forState:UIControlStateNormal ];
//    [btnBillpay.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnBillpay.backgroundColor = [UIColor whiteColor];
//    [btnBillpay.layer setBorderColor:[UIColor borderColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnBillpay.layer setBorderWidth:2.0f];
//    [btnBillpay.layer setCornerRadius:15.0f];
//    [btnBillpay.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnBillpay.layer setShadowOpacity:0.8f];
//    [btnBillpay.layer setShadowRadius:12.0f];
//    btnBillpay.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnBillpay.contentMode=UIViewContentModeCenter;
//    btnBillpay.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingBill = 6.0;
//    CGSize imageBillSize = billImage.size;
//    btnBillpay.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageBillSize.width, - (imageBillSize.height + spacingBill), 0.0);
//    CGSize titleBillSize = [btnBillpay.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnBillpay.titleLabel.font}];
//    btnBillpay.imageEdgeInsets = UIEdgeInsetsMake(- (titleBillSize.height + spacingBill), 0.0, 0.0, - titleBillSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnBillpay addTarget:self action:@selector(btnBillPay:) forControlEvents:UIControlEventTouchUpInside];
//    btnBillpay.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnBillpay];
    //-----------
    
    //-----trade
//    UIButton *btnTrade = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnTrade.frame = CGRectMake(200,170,60,60);
//    [btnTrade setTitle:@"Loans" forState:UIControlStateNormal];
//    [btnTrade setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnTrade.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *tradeImage = [[UIImage imageNamed:@"trade-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnTrade setImage:tradeImage forState:UIControlStateNormal ];
//    [btnTrade.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnTrade.backgroundColor = [UIColor whiteColor];
//    [btnTrade.layer setBorderColor:[UIColor borderColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnTrade.layer setBorderWidth:2.0f];
//    [btnTrade.layer setCornerRadius:15.0f];
//    [btnTrade.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnTrade.layer setShadowOpacity:0.8f];
//    [btnTrade.layer setShadowRadius:12.0f];
//    btnTrade.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnTrade.contentMode=UIViewContentModeCenter;
//    btnTrade.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingTrade = 6.0;
//    CGSize imageTradeSize = tradeImage.size;
//    btnTrade.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageTradeSize.width, - (imageTradeSize.height + spacingTrade), 0.0);
//    CGSize titleTradeSize = [btnTrade.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnTrade.titleLabel.font}];
//    btnTrade.imageEdgeInsets = UIEdgeInsetsMake(- (titleTradeSize.height + spacingTrade), 0.0, 0.0, - titleTradeSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnTrade addTarget:self action:@selector(btnLoans:) forControlEvents:UIControlEventTouchUpInside];
//    btnTrade.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnTrade];
    //-------

    
    //-------loans
//    UIButton *btnLoans = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnTransfer.frame = CGRectMake(40,170,60,60);
//    [btnLoans setTitle:@"Loans" forState:UIControlStateNormal];
//    [btnLoans setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnLoans.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *loansImage = [[UIImage imageNamed:@"loans-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnLoans setImage:loansImage forState:UIControlStateNormal ];
//    [btnLoans.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];//[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnLoans.backgroundColor = [UIColor whiteColor];
//    [btnLoans.layer setBorderColor:[UIColor borderColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnLoans.layer setBorderWidth:2.0f];
//    [btnLoans.layer setCornerRadius:15.0f];
//    [btnLoans.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnLoans.layer setShadowOpacity:0.8f];
//    [btnLoans.layer setShadowRadius:12.0f];
//    btnLoans.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnLoans.contentMode=UIViewContentModeCenter;
//    btnLoans.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingLoans = 6.0;
//    CGSize imageLoansSize = loansImage.size;
//    btnLoans.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageLoansSize.width, - (imageLoansSize.height + spacingTransfer), 0.0);
//    CGSize titleLoansSize = [btnLoans.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnLoans.titleLabel.font}];
//    btnLoans.imageEdgeInsets = UIEdgeInsetsMake(- (titleLoansSize.height + spacingLoans), 0.0, 0.0, - titleLoansSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnLoans addTarget:self action:@selector(btnLoans:) forControlEvents:UIControlEventTouchUpInside];
//    btnLoans.translatesAutoresizingMaskIntoConstraints=NO;
    //[self.view addSubview:btnLoans];
    //---------
    
    
//    
    
    
//    
//    //-------Kyc
//    UIButton *btnKyc = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    //btnAccounts.frame = CGRectMake(40,80,60,60);
//    [btnKyc setTitle:@"Kyc" forState:UIControlStateNormal];
//    [btnKyc setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [btnKyc.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *KycImage = [[UIImage imageNamed:@"kyc-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnKyc setImage:KycImage forState:UIControlStateNormal ];
//    [btnKyc.titleLabel setFont:[UIFont boldSystemFontOfSize:14]]; //[UIFont fontWithName:@"Helvetica-Bold" size:10.0]];
//    btnKyc.backgroundColor = [UIColor whiteColor];
//    [btnKyc.layer setBorderColor:[UIColor borderColor].CGColor];//[UIColor blueColor].CGColor];
//    //[money setTintColor:[UIColor redColor]];
//    [btnKyc.layer setBorderWidth:2.0f];
//    [btnKyc.layer setCornerRadius:15.0f];
//    [btnKyc.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnKyc.layer setShadowOpacity:0.8f];
//    [btnKyc.layer setShadowRadius:12.0f];
//    btnKyc.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnKyc.contentMode=UIViewContentModeCenter;
//    btnKyc.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingKyc = 6.0;
//    CGSize imageKycSize = KycImage.size;
//    btnKyc.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageKycSize.width, - (imageKycSize.height + spacingKyc), 0.0);
//    CGSize titleKycSize = [btnKyc.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnKyc.titleLabel.font}];
//    btnKyc.imageEdgeInsets = UIEdgeInsetsMake(- (titleKycSize.height + spacingKyc), 0.0, 0.0, - titleKycSize.width);
//    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
//    [btnKyc addTarget:self action:@selector(btnKyc:) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnKyc.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnKyc];
//    
//    
    
    
    //---------

    
    
    UILabel *lblLastLogin = [[UILabel alloc] init];//WithFrame:CGRectMake(20, 500, 300, 20)];
    //lblUserid.borderStyle = UITextBorderStyleRoundedRect;
    lblLastLogin.font = [UIFont boldSystemFontOfSize:12];//[UIFont systemFontOfSize:12];
    lblLastLogin.text=[NSString stringWithFormat:@"Your last login was on %@",lastLoginDate];
    lblLastLogin.contentMode=UIControlContentHorizontalAlignmentCenter;
    //lblUserid.placeholder = @"Enter userid";
    //lblUserid.autocorrectionType = UITextAutocorrectionTypeNo;
    //lblUserid.keyboardType = UIKeyboardTypeDefault;
    //lblUserid.returnKeyType = UIReturnKeyDone;
    //lblUserid.clearButtonMode = UITextFieldViewModeWhileEditing;
    //lblUserid.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    //txtUserid.delegate = self;
    lblLastLogin.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblLastLogin];
    

    //------Accounts
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAccounts attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
    
//    //------Credit cards
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//    
//    //------Deposits
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//   
//    
//    //------Transfers
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTransfer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//
//
//    //------Bill Pay
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnBillpay attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//
//    //------Trade
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnTrade attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//
    
    //------Loans
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnLoans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
    
    
    
    
   // ------Kyc
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnKyc attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnKyc attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.4 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnKyc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.14 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnKyc attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.26 constant:0]];
//
    
    
    //[self fetchDashboard];
    
    //[self displayGraph];
    
    
    
   // dashboardAssetArray=[[NSMutableArray alloc] initWithObjects:@"Personal Details",@"Identification Details",@"Occupation Details",@"Contact Details",@"Addreess Details",@"Product Details",@"KYC Details",@"FATCA",@"View Personal Details",@"KYC Transaction Details", nil];
    
    
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //tableView.frame = CGRectMake(30,200,270,300);
//    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightBluishColor];
//    tableView.layer.borderWidth=1.0f;
//    tableView.layer.borderColor=[UIColor lightBluishColor].CGColor;
//    tableView.layer.cornerRadius=15.0f;
//    //tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    
//    //self.edgesForExtendedLayout = UIRectEdgeNone;
//    
////    CGRect titleRect = CGRectMake(0, 0, 100, 20);
////    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
////    tableTitle.textColor = [UIColor captionColor];
////    tableTitle.backgroundColor = [tableView backgroundColor];
////    tableTitle.opaque = YES;
////    tableTitle.font = [UIFont boldSystemFontOfSize:14];
////    tableTitle.textAlignment=NSTextAlignmentCenter;
////    tableTitle.text = @"";
////    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
//    //tableView.tableHeaderView = tableTitle;
//    
//    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    //[tableView setSeparatorColor:[UIColor whiteColor]];
//    tableView.separatorInset=UIEdgeInsetsZero;
//    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    
//    
//    // add to canvas
//    tableView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:tableView];
//    
//    //---tableView UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
//    //-------last login
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLastLogin attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:0.9 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLastLogin attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    

    
//    PieLayer* pieLayer = [[PieLayer alloc] init];
//    //pieLayer.frame = CGRectMake(75, 300, 200, 200);
//    
//        //pieLayer.frame=CGRectMake(headerView.frame.origin.x, headerView.frame.origin.x, headerView.frame.size.width, headerView.frame.size.height);
//    //pieLayer.contentsGravity=kCAGravityResizeAspectFill;
//    [self.view.layer addSublayer:pieLayer];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pieLayer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];
//    
//    
//    [pieLayer addValues:@[[PieElement pieElementWithValue:5.0 color:[UIColor redColor]],
//                          [PieElement pieElementWithValue:4.0 color:[UIColor blueColor]],
//                          [PieElement pieElementWithValue:7.0 color:[UIColor greenColor]]] animated:YES];
//    
//    PieElement* pieElem = pieLayer.values[0];
//    [PieElement animateChanges:^{
//        pieElem.val = 13.0;
//        pieElem.color = [UIColor yellowColor];
//    }];
    
    
    
    //--BUTTONS
    
    
    //-------Savings account
    UIButton *btnSavings = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnSavings setTitle:@"Download" forState:UIControlStateNormal];
    [btnSavings setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnSavings.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *SavingsImage = [[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnSavings setImage:SavingsImage forState:UIControlStateNormal ];
    [btnSavings.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
    btnSavings.backgroundColor=[UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
    [btnSavings.layer setBorderColor:[UIColor borderColor].CGColor];
    [btnSavings.layer setBorderWidth:2.0f];
    [btnSavings.layer setCornerRadius:15.0f];
    [btnSavings.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnSavings.layer setShadowOpacity:0.8f];
    [btnSavings.layer setShadowRadius:12.0f];
    btnSavings.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnSavings.contentMode=UIViewContentModeCenter;
    btnSavings.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingSavings = 6.0;
    CGSize imageSavingsSize = SavingsImage.size;
    btnSavings.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSavingsSize.width, - (imageSavingsSize.height + spacingSavings), 0.0);
    CGSize titleSavingsSize = [btnSavings.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnSavings.titleLabel.font}];
    btnSavings.imageEdgeInsets = UIEdgeInsetsMake(- (titleSavingsSize.height + spacingSavings), 0.0, 0.0, - titleSavingsSize.width);
    //[money setBackgroundImage:moneyImage forState:UIControlStateNormal];
    [btnSavings addTarget:self action:@selector(btnSavingsAccount) forControlEvents:UIControlEventTouchUpInside];
    
    btnSavings.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnSavings];
    

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSavings attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSavings attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSavings attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSavings attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    
    //-------Current account
    UIButton *btnCurrent = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnCurrent setTitle:@"Survey" forState:UIControlStateNormal];
    [btnCurrent setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnCurrent.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *CurrentImage = [[UIImage imageNamed:@"write.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnCurrent setImage:CurrentImage forState:UIControlStateNormal ];
    [btnCurrent.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];

    btnCurrent.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
    [btnCurrent.layer setBorderColor:[UIColor borderColor].CGColor];
    [btnCurrent.layer setBorderWidth:2.0f];
    [btnCurrent.layer setCornerRadius:15.0f];
    [btnCurrent.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnCurrent.layer setShadowOpacity:0.8f];
    [btnCurrent.layer setShadowRadius:12.0f];
    btnCurrent.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnCurrent.contentMode=UIViewContentModeCenter;
    btnCurrent.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingCurrent = 6.0;
    CGSize imageCurrentSize = CurrentImage.size;
    btnCurrent.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageCurrentSize.width, - (imageCurrentSize.height + spacingCurrent), 0.0);
    CGSize titleCurrentSize = [btnCurrent.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnCurrent.titleLabel.font}];
    btnCurrent.imageEdgeInsets = UIEdgeInsetsMake(- (titleSavingsSize.height + spacingCurrent), 0.0, 0.0, - titleCurrentSize.width);
    [btnCurrent addTarget:self action:@selector(btnCurrentAccount) forControlEvents:UIControlEventTouchUpInside];
    
    btnCurrent.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnCurrent];
    
    
    //------Current Account

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCurrent attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCurrent attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCurrent attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCurrent attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    //-------Queue
    UIButton *btnQueue = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnQueue setTitle:@"Survey Queue" forState:UIControlStateNormal];
    [btnQueue setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btnQueue.titleLabel setTextAlignment: NSTextAlignmentCenter];
    UIImage *QueueImage = [[UIImage imageNamed:@"script.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [btnQueue setImage:QueueImage forState:UIControlStateNormal ];
    [btnQueue.titleLabel  setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
    btnQueue.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
    [btnQueue.layer setBorderColor:[UIColor borderColor].CGColor];
    [btnQueue.layer setBorderWidth:2.0f];
    [btnQueue.layer setCornerRadius:15.0f];
    [btnQueue.layer setShadowColor:[UIColor blackColor].CGColor];
    [btnQueue.layer setShadowOpacity:0.8f];
    [btnQueue.layer setShadowRadius:12.0f];
    btnQueue.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
    btnQueue.contentMode=UIViewContentModeCenter;
    btnQueue.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    //image and text center alignment
    CGFloat spacingQueue = 6.0;
    CGSize imageQueueSize = QueueImage.size;
    btnQueue.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageQueueSize.width, - (imageQueueSize.height + spacingQueue), 0.0);
    CGSize titleQueueSize = [btnQueue.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnQueue.titleLabel.font}];
    btnQueue.imageEdgeInsets = UIEdgeInsetsMake(- (titleQueueSize.height + spacingQueue), 0.0, 0.0, - titleQueueSize.width);
    [btnQueue addTarget:self action:@selector(btnQueue) forControlEvents:UIControlEventTouchUpInside];
    
    btnQueue.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnQueue];
    
    
    //------Queue
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnQueue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnQueue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnQueue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnQueue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
//    
//    //-------Deposits account
//    UIButton *btnDeposits= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnDeposits setTitle:@"Fixed Deposit" forState:UIControlStateNormal];
//    [btnDeposits setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnDeposits.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *DepositsImage = [[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnDeposits setImage:DepositsImage forState:UIControlStateNormal ];
//    [btnDeposits.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnDeposits.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnDeposits.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnDeposits.layer setBorderWidth:2.0f];
//    [btnDeposits.layer setCornerRadius:15.0f];
//    [btnDeposits.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnDeposits.layer setShadowOpacity:0.8f];
//    [btnDeposits.layer setShadowRadius:12.0f];
//    btnDeposits.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnDeposits.contentMode=UIViewContentModeCenter;
//    btnDeposits.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingDeposits = 6.0;
//    CGSize imageDepositsSize = DepositsImage.size;
//    btnDeposits.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageDepositsSize.width, - (imageDepositsSize.height + spacingDeposits), 0.0);
//    CGSize titleDepositsSize = [btnDeposits.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnDeposits.titleLabel.font}];
//    btnDeposits.imageEdgeInsets = UIEdgeInsetsMake(- (titleSavingsSize.height + spacingDeposits), 0.0, 0.0, - titleDepositsSize.width);
//    [btnDeposits addTarget:self action:@selector(btnFixedDeposit) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnDeposits.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnDeposits];
//    
//    
//    //------Deposits
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposits attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposits attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposits attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDeposits attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//
//    
//    
//    //-------PersonalLoan btn
//    UIButton *btnPersonalLoan= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnPersonalLoan setTitle:@"Personal Loan" forState:UIControlStateNormal];
//    [btnPersonalLoan setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnPersonalLoan.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *PersonalLoanImage = [[UIImage imageNamed:@"fountain-pen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnPersonalLoan setImage:PersonalLoanImage forState:UIControlStateNormal ];
//    [btnPersonalLoan.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnPersonalLoan.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnPersonalLoan.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnPersonalLoan.layer setBorderWidth:2.0f];
//    [btnPersonalLoan.layer setCornerRadius:15.0f];
//    [btnPersonalLoan.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnPersonalLoan.layer setShadowOpacity:0.8f];
//    [btnPersonalLoan.layer setShadowRadius:12.0f];
//    btnPersonalLoan.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnPersonalLoan.contentMode=UIViewContentModeCenter;
//    btnPersonalLoan.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingPersonalLoan = 6.0;
//    CGSize imagePersonalLoanSize = PersonalLoanImage.size;
//    btnPersonalLoan.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imagePersonalLoanSize.width, - (imagePersonalLoanSize.height + spacingPersonalLoan), 0.0);
//    CGSize titlePersonalLoanSize = [btnPersonalLoan.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnPersonalLoan.titleLabel.font}];
//    btnPersonalLoan.imageEdgeInsets = UIEdgeInsetsMake(- (titlePersonalLoanSize.height + spacingPersonalLoan), 0.0, 0.0, - titlePersonalLoanSize.width);
//    [btnPersonalLoan addTarget:self action:@selector(btnPersonalLoan) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnPersonalLoan.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnPersonalLoan];
//    
//    //------Personal Loan
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPersonalLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPersonalLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.65 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPersonalLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnPersonalLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    //-------AutoLoan btn
//    UIButton *btnAutoLoan= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnAutoLoan setTitle:@"Auto Loan" forState:UIControlStateNormal];
//    [btnAutoLoan setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnAutoLoan.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *AutoLoanImage = [[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnAutoLoan setImage:AutoLoanImage forState:UIControlStateNormal ];
//    [btnAutoLoan.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnAutoLoan.backgroundColor=[UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnAutoLoan.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnAutoLoan.layer setBorderWidth:2.0f];
//    [btnAutoLoan.layer setCornerRadius:15.0f];
//    [btnAutoLoan.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnAutoLoan.layer setShadowOpacity:0.8f];
//    [btnAutoLoan.layer setShadowRadius:12.0f];
//    btnAutoLoan.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnAutoLoan.contentMode=UIViewContentModeCenter;
//    btnAutoLoan.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingAutoLoan = 6.0;
//    CGSize imageAutoLoanSize = AutoLoanImage.size;
//    btnAutoLoan.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageAutoLoanSize.width, - (imageAutoLoanSize.height + spacingAutoLoan), 0.0);
//    CGSize titleAutoLoanSize = [btnAutoLoan.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnAutoLoan.titleLabel.font}];
//    btnAutoLoan.imageEdgeInsets = UIEdgeInsetsMake(- (titleAutoLoanSize.height + spacingAutoLoan), 0.0, 0.0, - titleAutoLoanSize.width);
//    [btnAutoLoan addTarget:self action:@selector(btnAutoLoan) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnAutoLoan.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnAutoLoan];
//    
//    
//    //------AutoLoan view
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAutoLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAutoLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAutoLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnAutoLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//
//
//
//    //-------Revolving Overdraft btn
//    UIButton *btnROD= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnROD setTitle:@"ROD" forState:UIControlStateNormal];
//    [btnROD setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnROD.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *RODImage = [[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnROD setImage:RODImage  forState:UIControlStateNormal ];
//    [btnROD.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnROD.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnROD.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnROD.layer setBorderWidth:2.0f];
//    [btnROD.layer setCornerRadius:15.0f];
//    [btnROD.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnROD.layer setShadowOpacity:0.8f];
//    [btnROD.layer setShadowRadius:12.0f];
//    btnROD.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnROD.contentMode=UIViewContentModeCenter;
//    btnROD.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingROD = 6.0;
//    CGSize imageRODSize = RODImage.size;
//    btnROD.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageRODSize.width, - (imageRODSize.height + spacingROD), 0.0);
//    CGSize titleRODSize = [btnROD.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnROD.titleLabel.font}];
//    btnROD.imageEdgeInsets = UIEdgeInsetsMake(- (titleRODSize.height + spacingROD), 0.0, 0.0, - titleRODSize.width);
//    [btnROD addTarget:self action:@selector(btnROD) forControlEvents:UIControlEventTouchUpInside];
//    btnROD.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnROD];
//    
//    //-----Revolving Overdraft
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnROD attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnROD attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnROD attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnROD attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    //-------CreditCard btn
//    UIButton *btnCreditCard= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnCreditCard setTitle:@"Credit Card" forState:UIControlStateNormal];
//    [btnCreditCard setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnCreditCard.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *CreditCardImage = [[UIImage imageNamed:@"fountain-pen.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnCreditCard setImage:CreditCardImage  forState:UIControlStateNormal ];
//    [btnCreditCard.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnCreditCard.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnCreditCard.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnCreditCard.layer setBorderWidth:2.0f];
//    [btnCreditCard.layer setCornerRadius:15.0f];
//    [btnCreditCard.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnCreditCard.layer setShadowOpacity:0.8f];
//    [btnCreditCard.layer setShadowRadius:12.0f];
//    btnCreditCard.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnCreditCard.contentMode=UIViewContentModeCenter;
//    btnCreditCard.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingCreditCard = 6.0;
//    CGSize imageCreditCardSize = CreditCardImage.size;
//    btnCreditCard.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageCreditCardSize.width, - (imageCreditCardSize.height + spacingCreditCard), 0.0);
//    CGSize titleCreditCardSize = [btnCreditCard.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnCreditCard.titleLabel.font}];
//    btnCreditCard.imageEdgeInsets = UIEdgeInsetsMake(- (titleCreditCardSize.height + spacingCreditCard), 0.0, 0.0, - titleCreditCardSize.width);
//    [btnCreditCard addTarget:self action:@selector(btnCreditCard) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnCreditCard.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnCreditCard];
//    
//    //-----Credit Card
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.80 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCreditCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
    
    
    
    
    
//  
//    //-------ImageUpload btn
//    UIButton *btnImageUpload = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnImageUpload setTitle:@"Image Upload" forState:UIControlStateNormal];
//    [btnImageUpload setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnImageUpload.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ImageUploadImage = [[UIImage imageNamed:@"camera-photo.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnImageUpload setImage:ImageUploadImage forState:UIControlStateNormal ];
//    [btnImageUpload.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnImageUpload.backgroundColor=[UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnImageUpload.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnImageUpload.layer setBorderWidth:2.0f];
//    [btnImageUpload.layer setCornerRadius:15.0f];
//    [btnImageUpload.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnImageUpload.layer setShadowOpacity:0.8f];
//    [btnImageUpload.layer setShadowRadius:12.0f];
//    btnImageUpload.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnImageUpload.contentMode=UIViewContentModeCenter;
//    btnImageUpload.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingImageUpload = 6.0;
//    CGSize imageImageUploadSize = ImageUploadImage.size;
//    btnImageUpload.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageImageUploadSize.width, - (imageImageUploadSize.height + spacingImageUpload), 0.0);
//    CGSize titleImageUploadSize = [btnImageUpload.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnImageUpload.titleLabel.font}];
//    btnImageUpload.imageEdgeInsets = UIEdgeInsetsMake(- (titleImageUploadSize.height + spacingImageUpload), 0.0, 0.0, - titleImageUploadSize.width);
//    [btnImageUpload addTarget:self action:@selector(btnImageUpload) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnImageUpload.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnImageUpload];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageUpload attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageUpload attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageUpload attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageUpload attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    
//    
//    //-------ImageView
//    UIButton *btnImageView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnImageView setTitle:@"Image View" forState:UIControlStateNormal];
//    [btnImageView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnImageView.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ImageViewImage = [[UIImage imageNamed:@"picture-frame.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnImageView setImage:ImageViewImage forState:UIControlStateNormal ];
//    [btnImageView.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnImageView.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnImageView.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnImageView.layer setBorderWidth:2.0f];
//    [btnImageView.layer setCornerRadius:15.0f];
//    [btnImageView.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnImageView.layer setShadowOpacity:0.8f];
//    [btnImageView.layer setShadowRadius:12.0f];
//    btnImageView.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnImageView.contentMode=UIViewContentModeCenter;
//    btnImageView.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingImageView = 6.0;
//    CGSize imageImageViewSize = ImageViewImage.size;
//    btnImageView.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageImageViewSize.width, - (imageImageViewSize.height + spacingCurrent), 0.0);
//    CGSize titleImageViewSize = [btnImageView.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnImageView.titleLabel.font}];
//    btnImageView.imageEdgeInsets = UIEdgeInsetsMake(- (titleImageViewSize.height + spacingImageView), 0.0, 0.0, - titleImageViewSize.width);
//    [btnImageView addTarget:self action:@selector(btnImageView) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnImageView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnImageView];
//    
//    
//    //------ImageView
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    //-------Enquiry btn
//    UIButton *btnEnquiry= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnEnquiry setTitle:@"Enquiry" forState:UIControlStateNormal];
//    [btnEnquiry setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnEnquiry.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *EnquiryImage = [[UIImage imageNamed:@"Search.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnEnquiry setImage:EnquiryImage forState:UIControlStateNormal ];
//    [btnEnquiry.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnEnquiry.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnEnquiry.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnEnquiry.layer setBorderWidth:2.0f];
//    [btnEnquiry.layer setCornerRadius:15.0f];
//    [btnEnquiry.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnEnquiry.layer setShadowOpacity:0.8f];
//    [btnEnquiry.layer setShadowRadius:12.0f];
//    btnEnquiry.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnEnquiry.contentMode=UIViewContentModeCenter;
//    btnEnquiry.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingEnquiry = 6.0;
//    CGSize imageEnquirySize = EnquiryImage.size;
//    btnEnquiry.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageEnquirySize.width, - (imageEnquirySize.height + spacingEnquiry), 0.0);
//    CGSize titleEnquirySize = [btnEnquiry.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnEnquiry.titleLabel.font}];
//    btnEnquiry.imageEdgeInsets = UIEdgeInsetsMake(- (titleEnquirySize.height + spacingEnquiry), 0.0, 0.0, - titleEnquirySize.width);
//    [btnEnquiry addTarget:self action:@selector(btnEnquiry) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnEnquiry.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnEnquiry];
//    
//    
//    //------btnEnquiry
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnEnquiry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnEnquiry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnEnquiry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnEnquiry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    
//    
//    //-------Signature btn
//    UIButton *btnSignature= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnSignature setTitle:@"Signature" forState:UIControlStateNormal];
//    [btnSignature setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnSignature.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *SignatureImage = [[UIImage imageNamed:@"clock.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnSignature setImage:SignatureImage forState:UIControlStateNormal ];
//    [btnSignature.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnSignature.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnSignature.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnSignature.layer setBorderWidth:2.0f];
//    [btnSignature.layer setCornerRadius:15.0f];
//    [btnSignature.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnSignature.layer setShadowOpacity:0.8f];
//    [btnSignature.layer setShadowRadius:12.0f];
//    btnSignature.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnSignature.contentMode=UIViewContentModeCenter;
//    btnSignature.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingSignature = 6.0;
//    CGSize imageSignatureSize = SignatureImage.size;
//    btnSignature.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSignatureSize.width, - (imageSignatureSize.height + spacingSignature), 0.0);
//    CGSize titleSignatureSize = [btnSignature.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnSignature.titleLabel.font}];
//    btnSignature.imageEdgeInsets = UIEdgeInsetsMake(- (titleSignatureSize.height + spacingSignature), 0.0, 0.0, - titleSignatureSize.width);
//    [btnSignature addTarget:self action:@selector(btnSignature) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnSignature.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnSignature];
//    
//    //------btnSignature
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSignature attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.20 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSignature attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.65 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSignature attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSignature attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    
//    //-------Search btn
//    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnSearch setTitle:@"Search" forState:UIControlStateNormal];
//    [btnSearch setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnSearch.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *SearchImage = [[UIImage imageNamed:@"Search.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnSearch setImage:SearchImage forState:UIControlStateNormal ];
//    [btnSearch.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnSearch.backgroundColor=[UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnSearch.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnSearch.layer setBorderWidth:2.0f];
//    [btnSearch.layer setCornerRadius:15.0f];
//    [btnSearch.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnSearch.layer setShadowOpacity:0.8f];
//    [btnSearch.layer setShadowRadius:12.0f];
//    btnSearch.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnSearch.contentMode=UIViewContentModeCenter;
//    btnSearch.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingSearch = 6.0;
//    CGSize imageSearchSize = SearchImage.size;
//    btnSearch.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageSearchSize.width, - (imageSearchSize.height + spacingImageUpload), 0.0);
//    CGSize titleSearchSize = [btnSearch.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnSearch.titleLabel.font}];
//    btnSearch.imageEdgeInsets = UIEdgeInsetsMake(- (titleSearchSize.height + spacingSearch), 0.0, 0.0, - titleSearchSize.width);
//    [btnSearch addTarget:self action:@selector(btnSearch) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnSearch.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnSearch];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//    
//    //-------OCR
//    UIButton *btnOCR = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnOCR setTitle:@"OCR" forState:UIControlStateNormal];
//    [btnOCR setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnOCR.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ocrImage = [[UIImage imageNamed:@"briefcase.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnOCR setImage:ocrImage forState:UIControlStateNormal ];
//    [btnOCR.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnOCR.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnOCR.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnOCR.layer setBorderWidth:2.0f];
//    [btnOCR.layer setCornerRadius:15.0f];
//    [btnOCR.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnOCR.layer setShadowOpacity:0.8f];
//    [btnOCR.layer setShadowRadius:12.0f];
//    btnOCR.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnOCR.contentMode=UIViewContentModeCenter;
//    btnOCR.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingOCR = 6.0;
//    CGSize imageOCRSize = ocrImage.size;
//    btnOCR.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageOCRSize.width, - (imageOCRSize.height + spacingOCR), 0.0);
//    CGSize titleOCRSize = [btnOCR.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnOCR.titleLabel.font}];
//    btnOCR.imageEdgeInsets = UIEdgeInsetsMake(- (titleOCRSize.height + spacingOCR), 0.0, 0.0, - titleOCRSize.width);
//    [btnOCR addTarget:self action:@selector(btnOCR) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnOCR.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnOCR];
//    
//    
//    //------OCR
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCR attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCR attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCR attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCR attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//
//    
//    //-------OCR View
//    UIButton *btnOCRView = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnOCRView setTitle:@"OCR View" forState:UIControlStateNormal];
//    [btnOCRView setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnOCRView.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ocrImageView = [[UIImage imageNamed:@"script.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnOCRView setImage:ocrImageView forState:UIControlStateNormal ];
//    [btnOCRView.titleLabel   setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnOCRView.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnOCRView.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnOCRView.layer setBorderWidth:2.0f];
//    [btnOCRView.layer setCornerRadius:15.0f];
//    [btnOCRView.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnOCRView.layer setShadowOpacity:0.8f];
//    [btnOCRView.layer setShadowRadius:12.0f];
//    btnOCRView.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnOCRView.contentMode=UIViewContentModeCenter;
//    btnOCRView.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingOCRView = 6.0;
//    CGSize imageOCRViewSize = ocrImageView.size;
//    btnOCRView.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageOCRViewSize.width, - (imageOCRViewSize.height + spacingOCRView), 0.0);
//    CGSize titleOCRViewSize = [btnOCRView.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnOCR.titleLabel.font}];
//    btnOCRView.imageEdgeInsets = UIEdgeInsetsMake(- (titleOCRViewSize.height + spacingOCRView), 0.0, 0.0, - titleOCRViewSize.width);
//    [btnOCRView addTarget:self action:@selector(btnOCRView) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnOCRView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnOCRView];
    
    
    //------ImageView
    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCRView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCRView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCRView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnOCRView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
//    //-------Approver
//    UIButton *btnApprover= [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btnApprover setTitle:@"Approver" forState:UIControlStateNormal];
//    [btnApprover setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [btnApprover.titleLabel setTextAlignment: NSTextAlignmentCenter];
//    UIImage *ApproverImage = [[UIImage imageNamed:@"stamp.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [btnApprover setImage:ApproverImage forState:UIControlStateNormal ];
//    [btnApprover.titleLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:25]];
//    btnApprover.backgroundColor = [UIColor strongAzureColor]; //[UIColor lightBluishColor]; 03-May-2016
//    [btnApprover.layer setBorderColor:[UIColor borderColor].CGColor];
//    [btnApprover.layer setBorderWidth:2.0f];
//    [btnApprover.layer setCornerRadius:15.0f];
//    [btnApprover.layer setShadowColor:[UIColor blackColor].CGColor];
//    [btnApprover.layer setShadowOpacity:0.8f];
//    [btnApprover.layer setShadowRadius:12.0f];
//    btnApprover.layer.shadowOffset = CGSizeMake(8.0f, 8.0f);
//    btnApprover.contentMode=UIViewContentModeCenter;
//    btnApprover.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
//    //image and text center alignment
//    CGFloat spacingApprover = 6.0;
//    CGSize imageApproverSize = ApproverImage.size;
//    btnApprover.titleEdgeInsets = UIEdgeInsetsMake(0.0, - imageApproverSize.width, - (imageApproverSize.height + spacingApprover), 0.0);
//    CGSize titleApproverSize = [btnApprover.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: btnApprover.titleLabel.font}];
//    btnApprover.imageEdgeInsets = UIEdgeInsetsMake(- (titleApproverSize.height + spacingApprover), 0.0, 0.0, - titleApproverSize.width);
//    [btnApprover addTarget:self action:@selector(btnApprover) forControlEvents:UIControlEventTouchUpInside];
//    
//    btnApprover.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:btnApprover];
//    
//    
//    //------btnApprover
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnApprover attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.60 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnApprover attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.65 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnApprover attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.12 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnApprover attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    

    

    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    //return [accountName count];
    //return [customerInfo.count count];
    //return [dashboardAssetArray count];
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Number of rows is the number of time zones in the region for the specified section.
    //Region *region = [regions objectAtIndex:section];
    //return [region.timeZoneWrappers count];
//    switch (section) {
//        case 0:
//            return [dashboardAssetArray count];
//            break;
//            
//        default:
//            return [dashboardLiabilityArray count];
//            break;
//    }
    return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //GFloat result;
    //switch ([indexPath row])
    //{
    //    case 0: {
    //        result = kUIRowHeight;
    //        break; }
    //    case 1: {
    //        result = kUIRowLabelHeight;
    //        break; }
    //}
    return 50;
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    // The header for the section is the region name -- get this from the region at the section index.
    //Region *region = [regions objectAtIndex:section];
    //return [region name];
    
    
//    if(section == 0)
//    {
//        
//        return @"   I have";
//        
//    }
//    else
//    {
//        
//        return @"   I owe";
//    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==0)
    {
        return 10.00f;
    }
    return 30.0f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 30)];
//    CGRect titleRect = CGRectMake(0, 0, 100, 20);
//    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
//    tableTitle.textColor = [UIColor captionColor];
//    tableTitle.backgroundColor = [tableView backgroundColor];
//    tableTitle.opaque = YES;
//    tableTitle.font = [UIFont boldSystemFontOfSize:14];
//    tableTitle.textAlignment=NSTextAlignmentCenter;
//    tableTitle.text = @"";
//    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
//    //tableView.tableHeaderView = tableTitle;
//    
//    [headerView addSubview:tableTitle];
//    
//   if (section == 0)
//   {
//        
//        [headerView setBackgroundColor:[UIColor clearColor]];
//        tableTitle.text = @"I Have";
//    }
//    else if (section == 1)
//    {
//        [headerView setBackgroundColor:[UIColor clearColor]];
//        tableTitle.text = @"I Owe";
//        
//    }
//    return headerView;
    
    return nil;

}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    cell.backgroundColor=[UIColor cellBGColor];
    cell.layer.borderWidth=0.1f;
    cell.layer.cornerRadius=15.0f;
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
        
        //cell.separatorInset=UIEdgeInsetsMake(0,0,0,cell.frame.size.width);
        
        
        //UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"DetailDisclosureRed.png"]];
        //cell.accessoryView = [UIImageView accessoryImage];
    }
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    
    
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];

    
    
    
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    gradient.frame = cell.bounds;
    //    gradient.layer.cornerRadius=10.0f;
    //    gradient.color=[UIColor whiteColor];
    //    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
    //    [cell.layer addSublayer:gradient];
    
    
    //[cell addSubview:imv];
    
    
    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    //NSLog(@"table view%ldd",(long) indexPath.section);
    
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
    
    //accounts = [accountsArray objectAtIndex:indexPath.row];
    
    
    
    //NSLog(@"table view%@", dashboardAsset.customerTotalAssets);
    //NSLog(@"table view%@", dashboardLiability.customerTotalLiability);
    
    
    //if(indexPath.section==0)
    //{
        //dashboardAsset = [dashboardAssetArray objectAtIndex:indexPath.row];
        
        //if(dashboardAsset.customerTotalAssets !=nil && dashboardAsset.customerTotalAssets !=(id)[NSNull null])
        //{

            //cell.imageView.image=[[UIImage imageNamed:@"assets-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

            //cell.textLabel.text = [NSString stringWithFormat:@"%@",[dashboardAssetArray objectAtIndex:indexPath.section]];
            //cell.textLabel.numberOfLines=3;
            //cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
        //}
    //}
    
//    if(indexPath.section==1)
//    {
//        dashboardLiability = [dashboardLiabilityArray objectAtIndex:indexPath.row];
//        
//        if(dashboardLiability.customerTotalLiability !=nil && dashboardLiability.customerTotalLiability !=(id)[NSNull null])
//        {
//            if(indexPath.row==0)
//            {
//                cell.imageView.image=[[UIImage imageNamed:@"loan-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            }
//            else{
//                cell.imageView.image=[[UIImage imageNamed:@"credit-cards-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//            }
//
//            cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",dashboardLiability.customerTotalLiability,dashboardLiability.accountCurrency];
//            //cell.textLabel.numberOfLines=3;
//            //cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
//        }
//    }

    
    //    NSString *CRDRflag = [[NSString alloc] init];
    //
    //    if([accounts.CRDRflag isEqual:@"CR"])
    //    {
    //        CRDRflag=@"+";
    //    }
    //    else
    //    {
    //        CRDRflag=@"-";
    //    }
    
    //cell.detailTextLabel.text=[NSString stringWithFormat:@"\n%@  %@",accounts.availableBalance,accounts.accountCurrency];
    //cell.detailTextLabel.numberOfLines=0;
    //cell.detailTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",accounts.accountDesc];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",accounts.accountNumber,accounts.availableBalance,accounts.accountCurrency];
    
    
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    // Create a view controller with the title as its
    //    // navigation title and push it.
    //    NSUInteger row = indexPath.row;
    //    if (row != NSNotFound)
    //    {
    //        // Create the view controller and initialize it with the
    //        // next level of data.
    //        MyViewController *viewController = [[MyViewController alloc]
    //                                            initWithTable:tableView andDataAtIndexPath:indexPath];
    //        [[self navigationController] pushViewController:viewController
    //                                               animated:YES];
    //    }
    
    //NSUInteger section = indexPath.section;//row;
    
//    if(indexPath.section==0)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
//        personalViewController.actionMode=@"NEW";
//        personalViewController.accountType=@"SA"; //Savings Account
//        
//        [self.navigationController pushViewController:personalViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    
//    if (indexPath.section==1)
//    {
//        [self.activityIndicator startAnimating];
//        
//        IdentificationViewController *identificationViewController = [[IdentificationViewController alloc]initWithNibName:nil bundle:nil];
//        identificationViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:identificationViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    
//    if (indexPath.section==2)
//    {
//    
//        [self.activityIndicator startAnimating];
//        
//        OccupationViewController *occupationViewController = [[OccupationViewController alloc]initWithNibName:nil bundle:nil];
//        //occupationViewController.userid=self.userid;
//        //occupationViewController.sessionid=self.sessionid;
//        occupationViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:occupationViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==3)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        ContactViewController *contactViewController = [[ContactViewController alloc]initWithNibName:nil bundle:nil];
//        //contactViewController.userid=self.userid;
//        //contactViewController.sessionid=self.sessionid;
//        contactViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:contactViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==4)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        AddressViewController *addressViewController = [[AddressViewController alloc]initWithNibName:nil bundle:nil];
//        //addressViewController.userid=self.userid;
//       // addressViewController.sessionid=self.sessionid;
//        addressViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:addressViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==5)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        ProductViewController *productViewController = [[ProductViewController alloc]initWithNibName:nil bundle:nil];
//      //  productViewController.userid=self.userid;
//      //  productViewController.sessionid=self.sessionid;
//        productViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:productViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==6)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        KYCViewController *kYCViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
//       // kYCViewController.userid=self.userid;
//        //kYCViewController.sessionid=self.sessionid;
//        kYCViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:kYCViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==7)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        FatcaViewController *fatcaViewController = [[FatcaViewController alloc]initWithNibName:nil bundle:nil];
//        fatcaViewController.userid=self.userid;
//        fatcaViewController.sessionid=self.sessionid;
//        fatcaViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:fatcaViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==8)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.userid=self.userid;
//        queueViewController.sessionid=self.sessionid;
//        queueViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:queueViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    if (indexPath.section==9)
//    {
//        
//        [self.activityIndicator startAnimating];
//        
//        KYCTranViewController *kYCTranViewController = [[KYCTranViewController alloc]initWithNibName:nil bundle:nil];
//       /// kYCTranViewController.userid=self.userid;
//        //kYCTranViewController.sessionid=self.sessionid;
//        kYCTranViewController.actionMode=@"INPUT";
//        
//        [self.navigationController pushViewController:kYCTranViewController animated:YES];
//        
//        [self.activityIndicator stopAnimating];
//        
//        
//    }
//    
    
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}






//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"BackACSumSegue"])
//    {
//        DashboardViewController *dashboardViewController = [segue destinationViewController];
//        dashboardViewController.sessionid=self.sessionid;
//        dashboardViewController.userid=self.userid;
//    }
//}


//- (void) fetchDashboard  {
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"fetch Accounts %@",userid);
//        
//        
//        
//        //        //main thread
//        //        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        //        [self.view addSubview:spinner];
//        //
//        //        //switch to background thread
//        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner startAnimating];
//        //            });
//        
//        
//        
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/AccountsServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";
//        //create string for parameters that we need to send in the HTTP POST body
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=fetchDashboard",userid,sessionid];
//        
//        
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//        
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:120.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //allocate a new operation queue
//        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        //Loads the data for a URL request and executes a handler block on an
//        //operation queue when the request completes or fails.
//        /*[NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//         NSData *data,
//         NSError *error) {
//         if ([data length] >0 && error == nil){
//         //process the JSON response
//         //use the main queue so that we can interact with the screen
//         dispatch_async(dispatch_get_main_queue(), ^{
//         [self parseResponse:data];
//         });
//         }
//         else if ([data length] == 0 && error == nil){
//         NSLog(@"Empty Response, not sure why?");
//         }
//         else if (error != nil){
//         NSLog(@"Not again, what is the error = %@", error);
//         }
//         }];*/
//        
//        
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            [self parseResponse:newData];
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [CommonUtils showError:error:self:@"fetchDashboard"];
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner stopAnimating];
//        //            });
//        //            });
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in fetch Accounts code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in fetch Accounts Code");
//    }
//    
//    
//}


- (void) parseResponse:(NSData *) data {
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:@"fetchDashboard"];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                dashboardAssetArray = [[NSMutableArray alloc] init];
                dashboardLiabilityArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:@"dashboardWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    dashboardAsset = [[DashboardData alloc] initWithJSONDictionary:dict];
                    dashboardLiability = [[DashboardData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" accounts %@",dashboardAsset.customerTotalAssets);
                    
                 
                    if(dashboardAsset.customerTotalAssets !=nil && dashboardAsset.customerTotalAssets !=(id)[NSNull null])
                    {
                        // Add the Location object to the array
                        [dashboardAssetArray addObject:dashboardAsset];
                        //ihaveRows=ihaveRows+1;
                    }
                    if(dashboardLiability.customerTotalLiability !=nil && dashboardLiability.customerTotalLiability !=(id)[NSNull null])
                    {
                        // Add the Location object to the array
                        [dashboardLiabilityArray addObject:dashboardLiability];
                        //ioweRows=ioweRows+1;
                    }
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)dashboardAssetArray.count);
                NSLog(@"data count %lu",(unsigned long)dashboardLiabilityArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"accountsWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                accountStatus= [customerDetailData objectForKey:@"accountStatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                accountsKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                accountsValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in accountsKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in accountsValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Customer Code is Invalid...");
            }
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        
         [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}


-(void)loadView {
    [super loadView];
    self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:self.activityIndicator];
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    //[self.activityIndicator setHidesWhenStopped:YES];
}

-(void)btnSavingsAccount
{
    
    
    
    
    
    
    //if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
    //{
        
        DataSyncViewController *dataSyncViewController = [[DataSyncViewController alloc]initWithNibName:nil bundle:nil];

        [self.navigationController pushViewController:dataSyncViewController animated:YES];
        
        
        
    //}
    
    
}

-(void)btnCurrentAccount{
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    //    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
    //    ccSumViewController.userid=self.userid;
    //    [self.navigationController pushViewController:ccSumViewController animated:YES];
    //
    
    
    
    //if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
    //{
        
        //PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
          QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
        //personalViewController.actionMode=@"NEW";
        //personalViewController.viewMode=@"N";
        //personalViewController.accountType=@"CA"; //Savings Account
        //personalViewController.recordStatus=@"INPROGRESS";
        //personalViewController.menuName=menuName;
        //[detailNavigationController pushViewController:personalViewController animated:YES];
        [self.navigationController pushViewController:queueViewController animated:YES];
        
        
        
        //                [viewControllerArray addObject:personalViewController];
        //                self.splitViewController.delegate = personalViewController;
        //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
        //                [self.splitViewController viewWillAppear:YES];
        
        
    //}
    
    
}
//
//-(void)btnFixedDeposit{
//    
//    
//    
//    //trim spaces
//    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//    
//    //    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    //    ccSumViewController.userid=self.userid;
//    //    [self.navigationController pushViewController:ccSumViewController animated:YES];
//    //
//    
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//    {
//        
////        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////        personalViewController.actionMode=@"NEW";
////        //personalViewController.viewMode=@"N";
////        personalViewController.accountType=@"FD"; //Savings Account
////        personalViewController.recordStatus=@"INPROGRESS";
////        //personalViewController.menuName=menuName;
////        //[detailNavigationController pushViewController:personalViewController animated:YES];
////        [self.navigationController pushViewController:personalViewController animated:YES];
////        
////        
//        
//        //                [viewControllerArray addObject:personalViewController];
//        //                self.splitViewController.delegate = personalViewController;
//        //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
//        //                [self.splitViewController viewWillAppear:YES];
//        
//        
//    }
//    
//    
//}
//
//-(void)btnPersonalLoan{
//    
//    
//    
//    //trim spaces
//    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    
//    
//    //    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    //    ccSumViewController.userid=self.userid;
//    //    [self.navigationController pushViewController:ccSumViewController animated:YES];
//    //
//    
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//    {
////        
////        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////        personalViewController.actionMode=@"NEW";
////        //personalViewController.viewMode=@"N";
////        personalViewController.accountType=@"PL"; //Personal Loan
////        personalViewController.recordStatus=@"INPROGRESS";
////        //personalViewController.menuName=menuName;
////        //[detailNavigationController pushViewController:personalViewController animated:YES];
////        [self.navigationController pushViewController:personalViewController animated:YES];
////        
////        
////        
//        //                [viewControllerArray addObject:personalViewController];
//        //                self.splitViewController.delegate = personalViewController;
//        //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
//        //                [self.splitViewController viewWillAppear:YES];
//        
//        
//    }
//    
//    
//}
//-(void)btnAutoLoan{
//    
//
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//    {
//        
////        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////        personalViewController.actionMode=@"NEW";
////        //personalViewController.viewMode=@"N";
////        personalViewController.accountType=@"AL"; //Auto Loan
////        personalViewController.recordStatus=@"INPROGRESS";
////        //personalViewController.menuName=menuName;
////        //[detailNavigationController pushViewController:personalViewController animated:YES];
////        [self.navigationController pushViewController:personalViewController animated:YES];
//
//    }
//    
//    
//}
//
//-(void)btnROD{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//    {
//        
////        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////        personalViewController.actionMode=@"NEW";
////        //personalViewController.viewMode=@"N";
////        personalViewController.accountType=@"RO"; //Revolving Overdraft
////        personalViewController.recordStatus=@"INPROGRESS";
////        //personalViewController.menuName=menuName;
////        //[detailNavigationController pushViewController:personalViewController animated:YES];
////        [self.navigationController pushViewController:personalViewController animated:YES];
////        
//    }
//    
//    
//}
//
//-(void)btnCreditCard{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
//    {
//        
////        PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
////        personalViewController.actionMode=@"NEW";
////        //personalViewController.viewMode=@"N";
////        personalViewController.accountType=@"CC"; //Credit Card
////        personalViewController.recordStatus=@"INPROGRESS";
////        //personalViewController.menuName=menuName;
////        //[detailNavigationController pushViewController:personalViewController animated:YES];
////        [self.navigationController pushViewController:personalViewController animated:YES];
//        
//    }
//    
//    
//}




-(void)btnQueue{
    
    //if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
    //{
        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
        //queueViewController.actionMode=@"UPDATE";
        //queueViewController.menuId=@"QUEUEMAKER";
        
        //queueViewController.viewMode=@"Y";
        //queueViewController.recordStatus=@"INPROGRESS";
        [self.navigationController pushViewController:queueViewController animated:YES];
        //                [viewControllerArray addObject:queueViewController];
        //                self.splitViewController.delegate = queueViewController;
        //                [[self.splitViewController.viewControllers objectAtIndex:1] setViewControllers:viewControllerArray animated:NO];
        //                [self.splitViewController viewWillAppear:YES];
        
        
    //}
    
    
}
//-(void)btnApprover{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"]) {
//        
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"QUEUEAPPROVER";
//        
//        //queueViewController.viewMode=@"Y";
//        queueViewController.recordStatus=@"CREATE";
//        [self.navigationController pushViewController:queueViewController animated:YES];
//        
//       
//        
//    }
//    else{
//        [CommonUtils showMessage:@"You are not authorised to access this menu" :self];
//    }
//
//    
//    
//}
//
//
//-(void)btnImageUpload{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"IMAGEUPLOAD";
//        
//        queueViewController.recordStatus=@"INPROGRESS";
//        [self.navigationController  pushViewController:queueViewController animated:YES];
//        
//        
//        
//    }
//    
//
//    
//    
//}
//-(void)btnImageView{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"IMAGEVIEW";
//        
//        queueViewController.recordStatus=@"INPROGRESS";
//        [self.navigationController  pushViewController:queueViewController animated:YES];
//        
//        
//    }
//    
//    
//}
//-(void)btnEnquiry{
//    
//    
//    QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//    queueViewController.actionMode=@"ENQUIRY";
//    queueViewController.menuId=@"ENQUIRY";
//    queueViewController.recordStatus=@"";
//    [self.navigationController  pushViewController:queueViewController animated:YES];
//    
//    
//}
//
//
//-(void)btnOCR{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"OCR";
//        
//        queueViewController.recordStatus=@"INPROGRESS";
//        [self.navigationController  pushViewController:queueViewController animated:YES];
//        
//        
//        
//    }
//    
//    
//    
//    
//}
//
//-(void)btnOCRView{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"OCRVIEW";
//        
//        queueViewController.recordStatus=@"INPROGRESS";
//        [self.navigationController  pushViewController:queueViewController animated:YES];
//        
//        
//        
//    }
//    
//    
//    
//    
//}

//-(void)btnSignature{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
//        QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//        queueViewController.actionMode=@"UPDATE";
//        queueViewController.menuId=@"SIGN";
//        
//        queueViewController.recordStatus=@"INPROGRESS";
//        [self.navigationController  pushViewController:queueViewController animated:YES];
//        
//        
//        
//    }
//    
//    
//}

//-(void)btnSearch{
//    
//    
//    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]) {
//        
//        
////        SearchViewController *searchViewController = [[SearchViewController alloc]initWithNibName:nil bundle:nil];
////        
////        [self.navigationController  pushViewController:searchViewController animated:YES];
////        
//        
//        
//    }
//    
//    
//}

- (IBAction)btnAccounts:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    

    //[self performSegueWithIdentifier:@"ACSumSegue" sender:sender];
  
    //AccountSumViewController *accountSumViewController = [segue destinationViewController];
    //accountSumViewController.userid=(NSString *) self.userid;
    //accountSumViewController.sessionid=(NSString *) self.sessionid;

//    
//    [self.activityIndicator startAnimating];
//    
//    OnBoardViewController *onBoardViewController = [[OnBoardViewController alloc]initWithNibName:nil bundle:nil];
//    onBoardViewController.userid=self.userid;
//    onBoardViewController.sessionid=self.sessionid;
//    onBoardViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:onBoardViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
}

- (IBAction)btnCreditCard:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
//    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
//    ccSumViewController.userid=self.userid;
//    [self.navigationController pushViewController:ccSumViewController animated:YES];
//    
    
    
    
//    [self.activityIndicator startAnimating];
//    
//    IdentificationViewController *identificationViewController = [[IdentificationViewController alloc]initWithNibName:nil bundle:nil];
//  //  identificationViewController.userid=self.userid;
//   // identificationViewController.sessionid=self.sessionid;
//    identificationViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:identificationViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
    
}
- (IBAction)btnDeposit:(id)sender {
    
    
    
//    [self.activityIndicator startAnimating];
//    NSString
    
    
    
    

    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
    //    CCSumViewController *ccSumViewController = [[CCSumViewController alloc]initWithNibName:nil bundle:nil];
    //    ccSumViewController.userid=self.userid;
    //    [self.navigationController pushViewController:ccSumViewController animated:YES];
    //
    
    
    
//    [self.activityIndicator startAnimating];
//    
//    IdentificationViewController *identificationViewController = [[IdentificationViewController alloc]initWithNibName:nil bundle:nil];
//    identificationViewController.userid=self.userid;
//    identificationViewController.sessionid=self.sessionid;
//    identificationViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:identificationViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
//    [self.activityIndicator startAnimating];
    
//    ProductFeaturesViewController *productFeaturesViewController = [[ProductFeaturesViewController alloc]initWithNibName:nil bundle:nil];
//    productFeaturesViewController.userid=self.userid;
//    productFeaturesViewController.sessionid=self.sessionid;
//    productFeaturesViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:productFeaturesViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
    
    
    
    
//    [self.activityIndicator startAnimating];
//    
//    KYCViewController *kycViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
//  //  kycViewController.userid=self.userid;
//   // kycViewController.sessionid=self.sessionid;
//    kycViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:kycViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
//
    
    
    
    
}
- (IBAction)btnTransfer:(id)sender {
    
    [self.activityIndicator startAnimating];
    
   // PersonalViewController *personalViewController = [[PersonalViewController alloc]initWithNibName:nil bundle:nil];
    //personalViewController.userid=self.userid;
    //personalViewController.sessionid=self.sessionid;
    //personalViewController.actionMode=@"INPUT";
    
    //[self.navigationController pushViewController:personalViewController animated:YES];
    
    [self.activityIndicator stopAnimating];
    
    
    
//    OccupationDetailsViewController *occupationDetailsViewController = [[OccupationDetailsViewController alloc]initWithNibName:nil bundle:nil];
//    occupationDetailsViewController.userid=self.userid;
//    occupationDetailsViewController.sessionid=self.sessionid;
//    occupationDetailsViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:occupationDetailsViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
//    TransferViewController *transferViewController = [[TransferViewController alloc]initWithNibName:nil bundle:nil];
//    transferViewController.userid=self.userid;
//    transferViewController.sessionid=self.sessionid;
//    [self.navigationController pushViewController:transferViewController animated:YES];
//    
    
//    AccountSumViewController *accountSumViewController = [[AccountSumViewController alloc]initWithNibName:nil bundle:nil];
//    accountSumViewController.userid=self.userid;
//    accountSumViewController.sessionid=self.sessionid;
//    accountSumViewController.actionMode=@"TRANSFER";
//    
//    [self.navigationController pushViewController:accountSumViewController animated:YES];
//
    
   // KYCViewController *kycViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
   // kycViewController.userid=self.userid;
   // kycViewController.sessionid=self.sessionid;
   // kycViewController.actionMode=@"INPUT";
    
  //  [self.navigationController pushViewController:kycViewController animated:YES];
    
}


- (IBAction)btnBillPay:(id)sender {
    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
//    BillerViewController *billerViewController = [[BillerViewController alloc]initWithNibName:nil bundle:nil];
//    billerViewController.userid=self.userid;
//    billerViewController.sessionid=self.sessionid;
//    [self.navigationController pushViewController:billerViewController animated:YES];
    
//    
//    [self.activityIndicator startAnimating];
//    
//    AddressViewController *addressViewController = [[AddressViewController alloc]initWithNibName:nil bundle:nil];
//  //  addressViewController.userid=self.userid;
//  //  addressViewController.sessionid=self.sessionid;
//    addressViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:addressViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
    
    
  
    
    
    
}


- (IBAction)btnLoans:(id)sender {
    
    
   // [self.activityIndicator startAnimating];
    
   // ContactViewController *contactViewController = [[ContactViewController alloc]initWithNibName:nil bundle:nil];
  ///  contactViewController.userid=self.userid;
  //  contactViewController.sessionid=self.sessionid;
    //contactViewController.actionMode=@"INPUT";
    
    //[self.navigationController pushViewController:contactViewController animated:YES];
    
  //  [self.activityIndicator stopAnimating];
    

    
    
    
    //trim spaces
    //customerNumber = [customerNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    
//    
//    LoansSumViewController *loansSumViewController = [[LoansSumViewController alloc]initWithNibName:nil bundle:nil];
//    loansSumViewController.userid=self.userid;
//    loansSumViewController.sessionid=self.sessionid;
//    [self.navigationController pushViewController:loansSumViewController animated:YES];
//    
    
    
    
}



//
//- (IBAction)btnKyc:(id)sender {
//    
//    
//    [self.activityIndicator startAnimating];
//    
//    
//    KYCViewController *kYCViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
//    kYCViewController.userid=self.userid;
//    kYCViewController.sessionid=self.sessionid;
//    kYCViewController.actionMode=@"INPUT";
//    
//    [self.navigationController pushViewController:kYCViewController animated:YES];
//    
//    [self.activityIndicator stopAnimating];
//    
//
//}

//-(void) displayMessage:(NSError *) error{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:@"Unable to connect to server, please try again"
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   [self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//
//}


    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    
    
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.frame = CGRectMake(40,300,240,300);
//    tableView.backgroundColor = [UIColor whiteColor];//[UIColor lightBluishColor];
//    tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    //
//    
//    //
//    //CGRect titleRect = CGRectMake(0, 0, 300, 40);
//    //UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
//    //tableTitle.textColor = [UIColor blackColor];
//    //tableTitle.backgroundColor = [tableView backgroundColor];
//    //tableTitle.opaque = YES;
//    //tableTitle.font = [UIFont boldSystemFontOfSize:12];
//    //tableTitle.textAlignment=NSTextAlignmentCenter;
//    //tableTitle.text = @"Customer Information";
//    //tableView.tableHeaderView = tableTitle;
//    //[self drawRect:titleRect];
//    //
//    
//    // important! without this line it does not work!
//    [tableView setBackgroundView:[[UIView alloc] init]];
//    // set plain background color
//    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
//    // remove seperator color
//    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    //[tableView setSeparatorColor:[UIColor blackColor]];
//    
//    // add to canvas
//    [self.view addSubview:tableView];
//    
//    
//    
//    accountName=[NSArray arrayWithObjects:@"Current Account",@"Savings Account",@"eSaver Account",nil];
//    accountNumber=[NSArray arrayWithObjects:@"123456789",@"757575757575",@"9947474747",nil];
//    accountCurrency=[NSArray arrayWithObjects:@"AED",@"USD",@"INR",nil];
//    accountAvlBalance=[NSArray arrayWithObjects:@"100,273.56",@"46,576.12",@"5,466.88",nil];
//    accountCurrentBalance=[NSArray arrayWithObjects:@"46,474.67",@"477,575.34",@"585,464.57",nil];
//    accountStatus=[NSArray arrayWithObjects:@"Active",@"Dormant",@"Active",nil];
//        
    
 
    




/*- (void)loadView
 {
 UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10.0f, 100.0f, 250.0f, 30.0f) style:UITableViewStylePlain];
 //tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
 tableView.delegate = self;
 tableView.dataSource = self;
 [tableView reloadData];
 //self.view = tableView;
 [self.view addSubview:tableView];
 }*/

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//    return [accountName count];
//    //return [customerInfo.count count];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    // Number of rows is the number of time zones in the region for the specified section.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region.timeZoneWrappers count];
//   
//    return [accountName count];
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //GFloat result;
//    //switch ([indexPath row])
//    //{
//    //    case 0: {
//    //        result = kUIRowHeight;
//    //        break; }
//    //    case 1: {
//    //        result = kUIRowLabelHeight;
//    //        break; }
//    //}
//    return 50;
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//    // The header for the section is the region name -- get this from the region at the section index.
//    //Region *region = [regions objectAtIndex:section];
//    //return [region name];
//    
//    
//    if(section == 0)
//        
//        return @"Accounts";
//    
//    else
//        
//        return @"Credit Card";
//    
//    //return nil;
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    /*if ((indexPath.row % 2) == 1) {
//        cell.backgroundColor = [UIColor grayColor];
//        //cell.textLabel.backgroundColor = [UIColor blackColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }
//    else
//    {
//        cell.backgroundColor = [UIColor whiteColor];
//        cell.selectionStyle = UITableViewCellSelectionStyleGray;
//    }*/
//    
//    cell.backgroundColor=[UIColor whiteColor];
//    cell.layer.cornerRadius=10.0f;
//    cell.layer.borderWidth=2.0f;
//    cell.layer.shadowRadius=3.0f;
//    
//    
//    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
//    //CALayer *sublayerHeader = [CALayer layer];
//    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
//    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
//    //sublayerHeader.shadowRadius = 10.0;
//    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
//    //sublayerHeader.shadowOpacity = 0.8;
//    //sublayerHeader.cornerRadius = 10.0;
//    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
//                                    //  .width, tableView.bounds.size.height);
//    //[shadowView.layer addSublayer:sublayerHeader];
//    //[self.view.layer addSublayer:sublayerHeader];
//    //[cell.contentView addSubview:shadowView];
//    
//    //[cell.layer addSublayer:sublayerHeader];
//    
//    
//    
//    /*cell.contentView.layer.cornerRadius = 15.0f;
//    cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
//    cell.contentView.layer.borderWidth = 1.0f;*/
//    
//}
//
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 3;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MyIdentifier = @"MyReuseIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier];
//        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        cell.selectionStyle=UITableViewCellSelectionStyleNone;
//        
//        //If you'd only like the "i" button, you'd use UITableViewCellAccessoryDetailButton and if you'd only like the "disclosure indicator, you'd use  UITableViewCellAccessoryDisclosureIndicator
//    }
//    
//    
//    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
//    
//    UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 14.0 ];
//    cell.textLabel.font  = myFont;
//    UIFont *mySecondFont = [ UIFont fontWithName: @"Arial" size: 10.0 ];
//    cell.detailTextLabel.font  = mySecondFont;
//    
//    
//    //top shadow
//    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    //CAGradientLayer *topShadow = [CAGradientLayer layer];
//    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
//    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
//    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
//    
//    //[cell.contentView addSubview:topShadowView];
//    
//
//    
//    
//    NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
//    
//    
//    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
//    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@  %@",[self.accountCurrency objectAtIndex:indexPath.row],[self.accountNumber objectAtIndex:indexPath.row]];
//    
//    
//
//    
//    
//    return cell;
//}

//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    //if ([[segue identifier] isEqualToString:@"ACSumSegue"])
//    //{
////        AccountSumViewController *accountSumViewController = [segue destinationViewController];
////        accountSumViewController.userid=(NSString *) self.userid;
////        accountSumViewController.sessionid=(NSString *) self.sessionid;
//    
//        
//    //}
//}

-(void)displayGraph
{
    
    dashboardWebView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    dashboardWebView.tag=55;
    dashboardWebView.delegate = self;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"board" ofType:@"html" inDirectory:@"www"]];
    [dashboardWebView loadRequest:[NSURLRequest requestWithURL:url]];
    dashboardWebView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:dashboardWebView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.56 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dashboardWebView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    dashboardAsset = [dashboardAssetArray objectAtIndex:0];
    
    dashboardLiability = [dashboardLiabilityArray objectAtIndex:0];
    
    
    
    NSString *assets = [dashboardAsset.customerTotalAssets stringByReplacingOccurrencesOfString:@"," withString:@""];
    NSString *liabilities = [dashboardLiability.customerTotalLiability stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    
    NSDictionary *jsonDictionary;
    
    jsonDictionary= @{[NSString stringWithFormat:@"Assets %@",dashboardAsset.accountCurrency] : assets,
                      [NSString stringWithFormat:@"Liabilities %@",dashboardLiability.accountCurrency] : liabilities
                      };
    
    
    NSError *errorOut;
    NSString *jsonString;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&errorOut];
    
    if (! jsonData) {
        NSLog(@"Got an error in json creation chart: %@", errorOut);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"jsondata %@",jsonString);
    
    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
    
    //NSLog(@"graph json %@",json);
    
    NSString* json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
    
    NSLog(@"function json %@",json);
    [dashboardWebView stringByEvaluatingJavaScriptFromString: json];
}



-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}

@end
