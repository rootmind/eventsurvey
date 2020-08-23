//
//  UsersData.m
//  TechElite
//
//  Created by Sai Kiran Gandham on 5/1/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import "UsersData.h"

@implementation UsersData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _userid = [jsonDictionary objectForKey:@"userid"];
        _password = [jsonDictionary objectForKey:@"password"];
        _status = [jsonDictionary objectForKey:@"status"];
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _lastLoginDate = [jsonDictionary objectForKey:@"lastLoginDate"];
        _deviceToken = [jsonDictionary objectForKey:@"deviceToken"];
        _noLoginRetry = [jsonDictionary objectForKey:@"noLoginRetry"];
        _maxRetry = [jsonDictionary objectForKey:@"maxRetry"];
        _sessionid = [jsonDictionary objectForKey:@"sessionid"];
        _pwdChgDate = [jsonDictionary objectForKey:@"pwdChgDate"];
        _otp = [jsonDictionary objectForKey:@"otp"];
        _businessUnit = [jsonDictionary objectForKey:@"businessUnit"];
        _sessionExpriyTime = [jsonDictionary objectForKey:@"sessionExpiryTime"];
        _userGroup = [jsonDictionary objectForKey:@"userGroup"];
        _validUser = [jsonDictionary objectForKey:@"validUser"];
        
        _oldPassword = [jsonDictionary objectForKey:@"oldPassword"];
        _ipAddress = [jsonDictionary objectForKey:@"ipAddress"];
        _passwordChanged = [jsonDictionary objectForKey:@"passwordChanged"];
        _oldPasswordRepeat= [jsonDictionary objectForKey:@"oldPasswordRepeat"];
        _invalidOldPassword= [jsonDictionary objectForKey:@"invalidOldPassword"];
        
        _name = [jsonDictionary objectForKey:@"name"];
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}


@end
