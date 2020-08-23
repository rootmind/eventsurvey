//
//  CCPortfolioViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 28/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
//#import "DashboardData.h"
#import "CreditCardsData.h"
//#import "SpendData.h"
#import <WebKit/WebKit.h>
#import "PortfolioViewController.h"

@interface CCPortfolioViewController : UIViewController  <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UISplitViewControllerDelegate>

//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
//@property (strong, nonatomic) NSString *lastLoginDate;

@property (strong, nonatomic) NSString *cifNumber;
@property (strong, nonatomic) NSString *creditCardNumber;
@property (strong, nonatomic) NSString *accountNumber;
//@property (strong, nonatomic) NSString *accountType;

@property (strong, nonatomic) NSMutableArray *creditCardsArray;
@property (strong, nonatomic) CreditCardsData *creditCardsData;



//@property (strong, nonatomic) NSArray *accountName;
//@property (strong, nonatomic) NSArray *accountNumber;
//@property (strong, nonatomic) NSArray *accountCurrency;
//@property (strong, nonatomic) NSArray *accountAvlBalance;
//@property (strong, nonatomic) NSArray *accountCurrentBalance;
//@property (strong, nonatomic) NSArray *accountStatus;

//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSDictionary *dataDictionary;
//@property (strong, nonatomic) NSMutableArray *dashboardAssetArray;
//@property (strong, nonatomic) DashboardData *dashboardAsset;
//@property (strong, nonatomic) NSMutableArray *dashboardLiabilityArray;
//@property (strong, nonatomic) DashboardData *dashboardLiability;


//@property (strong, nonatomic) DashboardData *dashboardData;
//@property (strong, nonatomic) NSMutableArray *dashboardArray;


//@property (strong, nonatomic) SpendData *spendData;
//@property (strong, nonatomic) NSMutableArray *spendArray;




@property (strong, nonatomic) UIWebView *dashboardWebView;
//@property (strong, nonatomic) WKWebView *dashboardWebView;
@property (strong, nonatomic) UIWebView *expensesWebView;


@end