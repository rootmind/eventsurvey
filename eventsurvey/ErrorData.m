//
//  ErrorData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 20/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "ErrorData.h"

@implementation ErrorData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _errorCode = [jsonDictionary objectForKey:@"errorCode"];
        _errorDesc = [jsonDictionary objectForKey:@"errorDesc"];
            }
    
    return self;
}

@end