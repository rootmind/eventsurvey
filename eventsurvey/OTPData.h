//
//  OTPData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef OTPData_h
#define OTPData_h


#endif /* OTPData_h */
#import <UIKit/UIKit.h>

@interface OTPData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *refNo;
@property (readonly) NSString *cifNumber;
@property (readonly) NSString *accountNo;
@property (readonly) NSString *creditCardNumber;
@property (readonly) NSString *generatedOTP;
@property (readonly) NSString *verifiedOTP;
@property (readonly) NSString *otp;  //to be deleted
@property (readonly) NSString *recordFound;

@end