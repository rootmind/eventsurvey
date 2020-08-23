//
//  CCTrnViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CreditCardsData.h"
#import "CreditCardTrnData.h"
#import "SpendData.h"
@interface CCTrnViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>


@property (nonatomic, strong) NSString *cifNumber;
@property (nonatomic, strong) NSString *creditCardNumber;


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *actIndSearch;
//@property (strong, nonatomic) IBOutlet UITableView *CustTableView;


//@property (strong, nonatomic) NSString *customerName;
//@property (strong, nonatomic) NSString *availableBalance;

//@property (strong, nonatomic) NSArray *custKeyData;
//@property (strong, nonatomic) NSArray *custValueData;
@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;


//@property (strong, nonatomic) NSDictionary *customerInfo;
@property (strong, nonatomic) UITableView *tableViewTrn;
@property (strong, nonatomic) UITableView *tableViewDtl;

@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *creditCardTrnArray;
@property (strong, nonatomic) NSDictionary *creditCardDataDictionary;
@property (strong, nonatomic) NSMutableArray *creditCardsArray;
@property (strong, nonatomic) CreditCardTrnData *creditCardTrn;
@property (strong, nonatomic) CreditCardsData *creditCards;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@property (strong, nonatomic) NSMutableArray *ccCaptionData;
@property (strong, nonatomic) NSMutableArray *ccValueData;


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
