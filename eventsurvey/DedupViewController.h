//
//  DedupViewController.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 06/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DedupData.h"
#import "CommonUtils.h"
#import "CommonTextField.h"



@class DedupViewController;



@interface DedupViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISplitViewControllerDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;

@property (strong, nonatomic) NSString *actionMode;

@property (strong, nonatomic) NSString *refNo;

@property (strong, nonatomic) NSDictionary *dataDictionary;

@property (strong, nonatomic) UITableView *tableView;


@property (strong, nonatomic) NSString *cifNumber;
@property (strong, nonatomic) NSString *accountNumber;
@property (strong, nonatomic) NSString *creditCardNumber;
@property (strong, nonatomic) NSString *customerName;
//@property (strong, nonatomic) NSString *firstName;

@property (strong, nonatomic) NSString *dob;
@property (strong, nonatomic) NSString *passportNumber;
@property (strong, nonatomic) NSString *emiratesId;

@property (strong, nonatomic) NSMutableArray *dedupArray;
@property (strong, nonatomic) DedupData *dedupData;


@property (strong, nonatomic) NSMutableArray *dataArray;







@end
