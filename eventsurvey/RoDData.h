//
//  RoDData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 05/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface RoDData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *rodSalaryMultiple;
@property (readonly) NSString *rodOverdraftAmount;
@property (readonly) NSString *rodRate;
@property (readonly) NSString *cisNo;
@property (readonly) NSString *accountNo;
@property (readonly) NSString *securityChequeNo;
@property (readonly) NSString *offTelephone;
@property (readonly) NSString *resTelephone;
@property (readonly) NSString *mobileNo;
@property (readonly) NSString *campaignCode;
@property (readonly) NSString *salaryMultiple;
@property (readonly) NSString *overdraftAmount;
@property (readonly) NSString *rate;
@property (readonly) NSString *refName1;
@property (readonly) NSString *refContactNo1;
@property (readonly) NSString *refName2;
@property (readonly) NSString *refContactNo2;

@property (readonly) NSString *recordFound;



@end