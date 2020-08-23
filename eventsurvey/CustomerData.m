//
//  CustomerData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 24/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//



#import "CustomerData.h"

@implementation CustomerData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary

        _availableBalance= [jsonDictionary objectForKey:@"availableBalance"];
        _accountCurrency= [jsonDictionary objectForKey:@"accountCurrency"];
        _assets= [jsonDictionary objectForKey:@"assets"];
        _liabilities= [jsonDictionary objectForKey:@"liabilities"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        

    }
    
    return self;
}

@end


