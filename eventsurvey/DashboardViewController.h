//
//  DashboardViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DashboardData.h"
#import "DataSyncViewController.h"


@interface DashboardViewController : UIViewController  <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UISplitViewControllerDelegate>

//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *lastLoginDate;

//@property (strong, nonatomic) NSArray *accountName;
//@property (strong, nonatomic) NSArray *accountNumber;
//@property (strong, nonatomic) NSArray *accountCurrency;
//@property (strong, nonatomic) NSArray *accountAvlBalance;
//@property (strong, nonatomic) NSArray *accountCurrentBalance;
//@property (strong, nonatomic) NSArray *accountStatus;

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *dashboardAssetArray;
@property (strong, nonatomic) DashboardData *dashboardAsset;
@property (strong, nonatomic) NSMutableArray *dashboardLiabilityArray;
@property (strong, nonatomic) DashboardData *dashboardLiability;

@property (strong, nonatomic) UIWebView *dashboardWebView;


@end