//
//  EventUserData.m
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EventUserData.h"

@implementation EventUserData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _userid = [jsonDictionary objectForKey:@"userid"];
        _eventID = [jsonDictionary objectForKey:@"eventID"];
        _name = [jsonDictionary objectForKey:@"name"];
        _assignFlag = [jsonDictionary objectForKey:@"assignFlag"];
        _makerID = [jsonDictionary objectForKey:@"makerID"];
        _makerDateTime = [jsonDictionary objectForKey:@"makerDateTime"];
        _modifierID = [jsonDictionary objectForKey:@"modifierID"];
        _modifierDateTime = [jsonDictionary objectForKey:@"modifierDateTime"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
    }
    
    return self;
}

@end
