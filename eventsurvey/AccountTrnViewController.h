//
//  AccountTrnViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/25/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "AccountsData.h"
#import "AccountTrnData.h"
#import "SpendData.h"

@interface AccountTrnViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>


@property (nonatomic, strong) NSString *cifNumber;
@property (nonatomic, strong) NSString *accountNumber;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actIndSearch;
//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


//@property (strong, nonatomic) NSString *customerName;
//@property (strong, nonatomic) NSString *availableBalance;

//@property (strong, nonatomic) NSArray *custKeyData;
//@property (strong, nonatomic) NSArray *custValueData;
@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;


//@property (strong, nonatomic) NSDictionary *customerInfo;
@property (strong, nonatomic) UITableView *tableView;

@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *accountTrnArray;
@property (strong, nonatomic) NSDictionary *accountDataDictionary;
@property (strong, nonatomic) NSMutableArray *accountsArray;
@property (strong, nonatomic) AccountTrnData *accountTrn;
@property (strong, nonatomic) AccountsData *accounts;

@property (strong, nonatomic) UIWebView *expensesWebView;


@property (strong, nonatomic) SpendData *spendData;
@property (strong, nonatomic) NSMutableArray *spendArray;

//@property (nonatomic, retain) CALayer* topleft;
//@property (nonatomic, retain) CALayer* topright;
//@property (nonatomic, retain) CALayer* bottomleft;
//@property (nonatomic, retain) CALayer* bottomright;
//@property (nonatomic, retain) CALayer* bglayer;
//@property (nonatomic) BOOL roundTop;
//@property (nonatomic) BOOL roundBottom;
//-(void) drawRoundTop;
//-(void) drawRoundBottom;




@end

