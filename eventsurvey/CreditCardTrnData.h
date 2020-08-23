//
//  CreditCardTrnData.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreditCardTrnData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *cifNumber;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *trnDate;
@property (readonly) NSString *trnType;
@property (readonly) NSString *narration1;
@property (readonly) NSString *narration2;
@property (readonly) NSNumber *trnAmount;
@property (readonly) NSString *CRDRflag;
@property (readonly) NSString *trnCurrency;
@property (readonly) NSNumber *recordFound;




@end
