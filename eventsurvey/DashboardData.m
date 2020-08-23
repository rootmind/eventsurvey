//
//  DashboardData.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 3/6/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import "DashboardData.h"

@implementation DashboardData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _accountCurrency = [jsonDictionary objectForKey:@"accountCurrency"];
        _savingsAccountBalance= [jsonDictionary objectForKey:@"savingsAccountBalance"];
        _currentAccountBalance = [jsonDictionary objectForKey:@"currentAccountBalance"];
        _depositsBalance = [jsonDictionary objectForKey:@"depositsBalance"];
        _customerTotalAssets = [jsonDictionary objectForKey:@"customerTotalAssets"];
        _loansBalance = [jsonDictionary objectForKey:@"loansBalance"];
        _customerTotalLiability = [jsonDictionary objectForKey:@"customerTotalLiability"];
        _totalCASABalance = [jsonDictionary objectForKey:@"totalCASABalance"];
        _totalDepositsBalance = [jsonDictionary objectForKey:@"totalCASABalance"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end