//
//  ProductData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//



#import <UIKit/UIKit.h>

@interface ProductData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;

@property (readonly) NSString *accountNo;
@property (readonly) NSString *accountIBAN;
@property (readonly) NSString *accountType;
@property (readonly) NSString *currency;
@property (readonly) NSString *statementCycle;
@property (readonly) NSString *onlineBankTrans;
@property (readonly) NSString *accOperInstrs;
@property (readonly) NSString *accountTitle;
@property (readonly) NSString *debitCardRequired;
@property (readonly) NSString *nameCard;
@property (readonly) NSString *favEmirate;
@property (readonly) NSString *debitCardDelvChnl;
@property (readonly) NSString *pinMailerDelvChnl;
@property (readonly) NSString *transferSalary;
@property (readonly) NSString *chequeBookRequired;
@property (readonly) NSString *overDraftType;
@property (readonly) NSString *interestOption;
@property (readonly) NSString *interestRate;
@property (readonly) NSString *supplCardReq;
@property (readonly) NSString *purposeCode;
@property (readonly) NSString *businessCode;
@property (readonly) NSString *insuranceCode;
@property (readonly) NSString *campaignCode;
@property (readonly) NSString *sellerID;
@property (readonly) NSString *sellerChannel;
@property (readonly) NSString *schemeID;
@property (readonly) NSString *recordStatus;

@property (readonly) NSString *recordFound;



@property (readonly) NSString *accountTypeValue;
@property (readonly) NSString *currencyValue;
@property (readonly) NSString *statementCycleValue;
@property (readonly) NSString *onlineBankTransValue;
@property (readonly) NSString *debitCardRequiredValue;
@property (readonly) NSString *favEmirateValue;
@property (readonly) NSString *debitCardDelvChnlValue;
@property (readonly) NSString *pinMailerDelvChnlValue;
@property (readonly) NSString *transferSalaryValue;
@property (readonly) NSString *chequeBookRequiredValue;
@property (readonly) NSString *interestOptionValue;
@property (readonly) NSString *interestRateValue;
@property (readonly) NSString *supplCardReqValue;

@property (readonly) NSString *purposeCodeValue;
@property (readonly) NSString *accOperInstrsValue;


@end