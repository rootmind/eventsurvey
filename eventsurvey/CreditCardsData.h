//
//  CreditCardsData.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardsData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *cifNumber;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *customerName;
@property (readonly) NSString *productName;
@property (readonly) NSString *creditCardType;
@property (readonly) NSString *creditCardStatus;
@property (readonly) NSNumber *totalLimitAmount;
@property (readonly) NSString *limitCurrency;
@property (readonly) NSNumber *currentOSBalance;
@property (readonly) NSString *paymentDueDate;
@property (readonly) NSString *lastPaymentDate;
@property (readonly) NSNumber *lastPaymentAmount;
@property (readonly) NSString *statementDate;
@property (readonly) NSNumber *availableCreditLimit;
@property (readonly) NSString *autoPaymentOption;
@property (readonly) NSNumber *availableCashLimit;
@property (readonly) NSNumber *totalPaymentDue;
@property (readonly) NSNumber *minPaymentDue;
@property (readonly) NSNumber *cashWithdrawLimit;
@property (readonly) NSNumber *recordFound;




@end


