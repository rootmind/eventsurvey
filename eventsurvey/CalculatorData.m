//
//  CalculatorData.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/14/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import "CalculatorData.h"

@implementation CalculatorData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _dateOfBirth = [jsonDictionary objectForKey:@"dateOfBirth"];
        _nationality = [jsonDictionary objectForKey:@"nationality"];
        _employer = [jsonDictionary objectForKey:@"employer"];
        _designation = [jsonDictionary objectForKey:@"designation"];
        _residenceStatus = [jsonDictionary objectForKey:@"residenceStatus"];
        _salary = [jsonDictionary objectForKey:@"salary"];
        _loanOutstanding= [jsonDictionary objectForKey:@"loanOutstanding"];
        _creditCardLimit = [jsonDictionary objectForKey:@"creditCardLimit"];
        _amountRequest = [jsonDictionary objectForKey:@"amountRequest"];
        _approved = [jsonDictionary objectForKey:@"approved"];
        _passportNo = [jsonDictionary objectForKey:@"passportNo"];
        _emiratesID = [jsonDictionary objectForKey:@"emiratesID"];
        
        _residenceStatusValue = [jsonDictionary objectForKey:@"residenceStatusValue"];
        _nationalityValue = [jsonDictionary objectForKey:@"nationalityValue"];
        
        _responseStatus = [jsonDictionary objectForKey:@"responseStatus"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end

