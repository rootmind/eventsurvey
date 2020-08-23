//
//  RoDData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 05/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import "RoDData.h"

@implementation RoDData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _rodSalaryMultiple = [jsonDictionary objectForKey:@"rodSalaryMultiple"];
        _rodOverdraftAmount = [jsonDictionary objectForKey:@"rodOverdraftAmount"];
        _rodRate = [jsonDictionary objectForKey:@"rodRate"];
        _cisNo = [jsonDictionary objectForKey:@"cisNo"];
        _accountNo = [jsonDictionary objectForKey:@"accountNo"];
        _securityChequeNo = [jsonDictionary objectForKey:@"securityChequeNo"];
        _offTelephone = [jsonDictionary objectForKey:@"offTelephone"];
        _resTelephone = [jsonDictionary objectForKey:@"resTelephone"];
        _mobileNo = [jsonDictionary objectForKey:@"mobileNo"];
        _campaignCode = [jsonDictionary objectForKey:@"campaignCode"];
        _salaryMultiple = [jsonDictionary objectForKey:@"salaryMultiple"];
        _overdraftAmount = [jsonDictionary objectForKey:@"overdraftAmount"];
        _rate = [jsonDictionary objectForKey:@"rate"];
        _refName1 = [jsonDictionary objectForKey:@"refName1"];
        _refContactNo1 = [jsonDictionary objectForKey:@"refContactNo1"];
        _refName2 = [jsonDictionary objectForKey:@"refName2"];
        _refContactNo2 = [jsonDictionary objectForKey:@"refContactNo2"];
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
