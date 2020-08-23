//
//  UsersData.h
//  TechElite
//
//  Created by Sai Kiran Gandham on 5/1/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsersData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *userid;
@property (readonly) NSString *password;
@property (readonly) NSString *status;
@property (readonly) NSString *cifNumber;
@property (readonly) NSString *lastLoginDate;
@property (readonly) NSString *deviceToken;
@property (readonly) NSNumber *noLoginRetry;
@property (readonly) NSNumber *maxRetry;
@property (readonly) NSString *sessionid;
@property (readonly) NSString *pwdChgDate;
@property (readonly) NSNumber *otp;
@property (readonly) NSString *businessUnit;
@property (readonly) NSNumber *sessionExpriyTime;
@property (readonly) NSString *userGroup;
@property (readonly) NSNumber *validUser;

@property (readonly) NSString *oldPassword;
@property (readonly) NSString *ipAddress;
@property (readonly) NSNumber *passwordChanged;
@property (readonly) NSString *oldPasswordRepeat;
@property (readonly) NSString *invalidOldPassword;

@property (readonly) NSString *name;

@property (readonly) NSNumber *recordFound;




@end

