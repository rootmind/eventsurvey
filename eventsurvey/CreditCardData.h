//
//  CreditCardData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface CreditCardData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

//Creditcard screen1
@property (readonly) NSString *refNo;
@property (readonly) NSString *cardType;
@property (readonly) NSString *bpmSubProduct;
@property (readonly) NSString *deliveryOption;
@property (readonly) NSString *deliveryOptionValue;
@property (readonly) NSString *yearsInUAE;
@property (readonly) NSString *perRefHomeCountryName;
@property (readonly) NSString *perRefHomeCountryTelephone;
@property (readonly) NSString *perRefUAEName1;
@property (readonly) NSString *perRefUAETelephone1;
@property (readonly) NSString *perRefUAEName2;
@property (readonly) NSString *perRefUAETelephone2;
@property (readonly) NSString *suppTitle;
@property (readonly) NSString *suppName;
@property (readonly) NSString *suppRelationship;
@property (readonly) NSString *suppDOB;
@property (readonly) NSString *accountNumber;
@property (readonly) NSString *accDtlsAccountType;
@property (readonly) NSString *autoPaymentAmount;

//Creditcard screen2
@property (readonly) NSString *product;
@property (readonly) NSString *nameOfBank;
@property (readonly) NSString *accountCCNo ;
@property (readonly) NSString *creditLmtMonthPayments;
@property (readonly) NSString *creditShield;
@property (readonly) NSString *accidentCare;
@property (readonly) NSString *osaName1;
@property (readonly) NSString *osaTelephone;
@property (readonly) NSString *osaName2;
@property (readonly) NSString *osaGSM;
@property (readonly) NSString *osaName3;
@property (readonly) NSString *osaAlShamil;
@property (readonly) NSString *waselName;
@property (readonly) NSString *waselAccountNumber;
@property (readonly) NSString *waselAmount;
@property (readonly) NSString *waselWeeklyDay;
@property (readonly) NSString *waselMonthlyAmount;
@property (readonly) NSString *waselMonthlyDate;
@property (readonly) NSString *renewalOption;




//Creditcard screen3
@property (readonly) NSString *cisNumber1 ;
@property (readonly) NSString *caseID1;
@property (readonly) NSString *primaryMobileNo;
@property (readonly) NSString *beneficiaryTelephone;
@property (readonly) NSString *beneficiaryType;
@property (readonly) NSString *cisNumber2;
@property (readonly) NSString *caseID2;
@property (readonly) NSString *campaignCode;


@property (readonly) NSString *cardTypeValue;
@property (readonly) NSString *nameOfBankValue;
@property (readonly) NSString *autoPaymentAmountValue;
@property (readonly) NSString *productValue;
@property (readonly) NSString *creditShieldValue;
@property (readonly) NSString *accidentCareValue;
@property (readonly) NSString *waselWeeklyDayValue;

@property (readonly) NSString *beneficiaryTypeValue;

@property (readonly) NSString *recordStatus;


@property (readonly) NSString *recordFound;

@end