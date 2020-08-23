//
//  PopoverData.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 6/1/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import "PopoverData.h"

@implementation PopoverData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _code = [jsonDictionary objectForKey:@"code"];
        _desc = [jsonDictionary objectForKey:@"desc"];
        _filter = [jsonDictionary objectForKey:@"filter"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
