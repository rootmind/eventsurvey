//
//  EventData.m
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 10/14/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import "EventData.h"

@implementation EventData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _code = [jsonDictionary objectForKey:@"code"];
        _desc = [jsonDictionary objectForKey:@"description"];
        _tableName = [jsonDictionary objectForKey:@"tableName"];
        _startDate = [jsonDictionary objectForKey:@"startDate"];
        _expiryDate = [jsonDictionary objectForKey:@"expiryDate"];
        _status = [jsonDictionary objectForKey:@"status"];
        _makerID = [jsonDictionary objectForKey:@"makerID"];
        _makerDateTime = [jsonDictionary objectForKey:@"makerDateTime"];
        _modifierID = [jsonDictionary objectForKey:@"modifierID"];
        _modifierDateTime = [jsonDictionary objectForKey:@"modifierDateTime"];
        _userid = [jsonDictionary objectForKey:@"userid"];
        _instituteID = [jsonDictionary objectForKey:@"instituteID"];
        _instituteName = [jsonDictionary objectForKey:@"instituteName"];
        _image = [jsonDictionary objectForKey:@"image"];
        _imageFound = [jsonDictionary objectForKey:@"imageFound"];
        _avatarImageFound = [jsonDictionary objectForKey:@"avatarImageFound"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
