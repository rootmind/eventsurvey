//
//  CalculatorData.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/14/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *customerName;
@property (readonly) NSString *dateOfBirth;
@property (readonly) NSString *nationality;
@property (readonly) NSString *employer;
@property (readonly) NSString *designation;
@property (readonly) NSString *residenceStatus;
@property (readonly) NSString *salary;
@property (readonly) NSString *loanOutstanding;
@property (readonly) NSString *creditCardLimit;
@property (readonly) NSString *amountRequest;
@property (readonly) NSNumber *approved;
@property (readonly) NSString *passportNo;
@property (readonly) NSString *emiratesID;

@property (readonly) NSString *residenceStatusValue;
@property (readonly) NSString *nationalityValue;


@property (readonly) NSNumber *responseStatus;

@property (readonly) NSString *recordFound;



@end

