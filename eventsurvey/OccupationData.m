//
//  OccupationData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "OccupationData.h"

@implementation OccupationData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
      _refNo = [jsonDictionary objectForKey:@"refNo"];
      _occupationType= [jsonDictionary objectForKey:@"occupationType"];
      _occupation= [jsonDictionary objectForKey:@"occupation"];
      _designation= [jsonDictionary objectForKey:@"designation"];
      _nameOfOrg= [jsonDictionary objectForKey:@"nameOfOrg"];
      _doj= [jsonDictionary objectForKey:@"doj"];
      _monthlySalary= [jsonDictionary objectForKey:@"monthlySalary"];
      _employeeNo= [jsonDictionary objectForKey:@"employeeNo"];
      _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
      _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        _occupationTypeValue= [jsonDictionary objectForKey:@"occupationTypeValue"];
        _occupationValue= [jsonDictionary objectForKey:@"occupationValue"];
        
    }
    
    return self;
}

@end