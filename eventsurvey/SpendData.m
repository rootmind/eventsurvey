//
//  SpendData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 25/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//



#import "SpendData.h"

@implementation SpendData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _creditCardNumber = [jsonDictionary objectForKey:@"creditCardNumber"];
        _category = [jsonDictionary objectForKey:@"category"];
        _trnAmount = [jsonDictionary objectForKey:@"trnAmount"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
    }
    
    return self;
}

@end
