//
//  DedupData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 06/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "DedupData.h"

@implementation DedupData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _accountNumber = [jsonDictionary objectForKey:@"accountNumber"];
        _creditCardNumber = [jsonDictionary objectForKey:@"creditCardNumber"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        //_firstName = [jsonDictionary objectForKey:@"firstName"];
        _dob = [jsonDictionary objectForKey:@"dob"];
        _passportNumber = [jsonDictionary objectForKey:@"passportNumber"];
        _emiratesId = [jsonDictionary objectForKey:@"emiratesId"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];

        
    }
    
    return self;
}

@end