//
//  ACPortfolioViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 11/15/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef ACPortfolioViewController_h
#define ACPortfolioViewController_h


#endif /* ACPortfolioViewController_h */
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DashboardData.h"
#import "AccountsData.h"
#import "SpendData.h"
#import <WebKit/WebKit.h>
#import "CCPortfolioViewController.h"
#import "ImageData.h"

@interface ACPortfolioViewController : UIViewController  <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate,UISplitViewControllerDelegate,UINavigationControllerDelegate,  UIImagePickerControllerDelegate,UIPopoverPresentationControllerDelegate>

//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *lastLoginDate;

@property (strong, nonatomic) NSString *cifNumber;
@property (strong, nonatomic) NSString *accountNumber;
@property (strong, nonatomic) NSString *accountType;

@property (strong, nonatomic) NSMutableArray *accountsArray;
@property (strong, nonatomic) AccountsData *accountsData;



//@property (strong, nonatomic) NSArray *accountName;
//@property (strong, nonatomic) NSArray *accountNumber;
//@property (strong, nonatomic) NSArray *accountCurrency;
//@property (strong, nonatomic) NSArray *accountAvlBalance;
//@property (strong, nonatomic) NSArray *accountCurrentBalance;
//@property (strong, nonatomic) NSArray *accountStatus;

@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;

@property (strong, nonatomic) NSDictionary *dataDictionary;
//@property (strong, nonatomic) NSMutableArray *dashboardAssetArray;
//@property (strong, nonatomic) DashboardData *dashboardAsset;
//@property (strong, nonatomic) NSMutableArray *dashboardLiabilityArray;
//@property (strong, nonatomic) DashboardData *dashboardLiability;


@property (strong, nonatomic) DashboardData *dashboardData;
@property (strong, nonatomic) NSMutableArray *dashboardArray;


@property (strong, nonatomic) SpendData *spendData;
@property (strong, nonatomic) NSMutableArray *spendArray;




@property (strong, nonatomic) UIWebView *dashboardWebView;
//@property (strong, nonatomic) WKWebView *dashboardWebView;
@property (strong, nonatomic) UIWebView *expensesWebView;



@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) ImageData *imageData;

@property (nonatomic, strong)  UIButton *photoButton;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic,strong)  UIView *overlayView;
@property (nonatomic,strong) UIImagePickerController *imagePickerController;

@property (nonatomic, strong) NSTimer *cameraTimer;
@property (nonatomic,strong) NSMutableArray *capturedImages;

@property (nonatomic,strong) UIImage *selectedImage;

@end