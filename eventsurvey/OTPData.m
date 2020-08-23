//
//  OTPData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OTPData.h"

@implementation OTPData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _cifNumber= [jsonDictionary objectForKey:@"cifNumber"];
        _accountNo= [jsonDictionary objectForKey:@"accountNo"];
        _creditCardNumber= [jsonDictionary objectForKey:@"creditCardNumber"];
        _generatedOTP= [jsonDictionary objectForKey:@"generatedOTP"];
        _verifiedOTP= [jsonDictionary objectForKey:@"verifiedOTP"];
        _otp= [jsonDictionary objectForKey:@"otp"]; //to be deleted
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        

        
    }
    
    return self;
}

@end