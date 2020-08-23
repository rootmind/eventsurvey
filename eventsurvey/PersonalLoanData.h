//
//  PersonalLoanData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 04/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalLoanData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *accountNo;
@property (readonly) NSString *financeAccountNo;
@property (readonly) NSString *campaignCode;
@property (readonly) NSString *wifeOrHusbandEmployed;
@property (readonly) NSString *noOfChildren;
@property (readonly) NSString *education;
@property (readonly) NSString *iWantApplyFor;
@property (readonly) NSString *purposeOfLoan;
@property (readonly) NSString *personalRName;
@property (readonly) NSString *personalRTelephone;
@property (readonly) NSString *healthQA1;
@property (readonly) NSString *healthQA2;
@property (readonly) NSString *healthQB1;
@property (readonly) NSString *healthQB2;
@property (readonly) NSString *healthAddress;
@property (readonly) NSString *nameBeneficiary1;
@property (readonly) NSString *nameBeneficiary2;
@property (readonly) NSString *totalFinance;
@property (readonly) NSString *interestRate;
@property (readonly) NSString *tenor;
@property (readonly) NSString *installmentAmount;
@property (readonly) NSString *startingDate;
@property (readonly) NSString *lastInstallmentAmount;
@property (readonly) NSString *noOfInstallments;
@property (readonly) NSString *processingFee;
@property (readonly) NSString *insuranceAmount;
@property (readonly) NSString *settlementOwnResoures;
@property (readonly) NSString *settlementRepeatLoan;
@property (readonly) NSString *settlementOtherBank;
@property (readonly) NSString *otherFees;



@property (readonly) NSString *iWantApplyForValue;
@property (readonly) NSString *purposeOfLoanValue;
@property (readonly) NSString *healthQA1Value;
@property (readonly) NSString *healthQB1Value;

@property (readonly) NSString *recordFound;



@end
