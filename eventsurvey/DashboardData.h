//
//  DashboardData.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 3/6/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *cifNumber;
@property (readonly) NSString *customerName;
@property (readonly) NSString *accountCurrency;
@property (readonly) NSNumber *savingsAccountBalance;
@property (readonly) NSNumber *currentAccountBalance;
@property (readonly) NSNumber *depositsBalance;
@property (readonly) NSString *customerTotalAssets;
@property (readonly) NSNumber *loansBalance;
@property (readonly) NSString *customerTotalLiability;
@property (readonly) NSString *totalCASABalance;
@property (readonly) NSString *totalDepositsBalance;

@property (readonly) NSNumber *recordFound;




@end
