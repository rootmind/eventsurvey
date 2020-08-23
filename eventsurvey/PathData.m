//
//  PathData.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/30/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "PathData.h"

@implementation PathData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _screen = [jsonDictionary objectForKey:@"screen"];
        _status = [jsonDictionary objectForKey:@"status"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
    }
    
    return self;
}

@end
