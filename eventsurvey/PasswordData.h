//
//  PasswordData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 16/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#ifndef PasswordData_h
#define PasswordData_h


#endif /* PasswordData_h */


@interface PasswordData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *minLength;
@property (readonly) NSString *maxLength;
@property (readonly) NSString *capitalLetter;
@property (readonly) NSString *specialCharacter;
@property (readonly) NSString *oldPasswordRepeat;
@property (readonly) NSNumber *policyAvailable;
@property (readonly) NSString *recordFound;

@end