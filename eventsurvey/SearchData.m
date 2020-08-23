//
//  SearchData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 18/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import "SearchData.h"

@implementation SearchData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
       
        _cifNumber= [jsonDictionary objectForKey:@"cifNumber"];
        _accountNo= [jsonDictionary objectForKey:@"accountNo"];
        _creditCardNumber= [jsonDictionary objectForKey:@"creditCardNumber"];
        _customerName= [jsonDictionary objectForKey:@"customerName"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end



