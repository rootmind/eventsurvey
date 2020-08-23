//
//  EventTemplateData.m
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "EventTemplateData.h"

@implementation EventTemplateData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        
       _seqNo = [jsonDictionary objectForKey:@"seqNo"];
       _eventRefNo = [jsonDictionary objectForKey:@"eventRefNo"];
       _eventID = [jsonDictionary objectForKey:@"eventID"];
       _labelName = [jsonDictionary objectForKey:@"labelName"];
       _component = [jsonDictionary objectForKey:@"component"];
       _viewOrder = [jsonDictionary objectForKey:@"viewOrder"];
       _mandatory = [jsonDictionary objectForKey:@"mandatory"];
       _fieldName = [jsonDictionary objectForKey:@"fieldName"];
       _status = [jsonDictionary objectForKey:@"status"];
       _listTableName = [jsonDictionary objectForKey:@"listTableName"];
       _maxLength = [jsonDictionary objectForKey:@"maxLength"];
       _pageNo = [jsonDictionary objectForKey:@"pageNo"];
       _makerID = [jsonDictionary objectForKey:@"makerID"];
       _makerDateTime = [jsonDictionary objectForKey:@"makerDateTime"];
       _modifierID = [jsonDictionary objectForKey:@"modifierID"];
       _modifierDateTime = [jsonDictionary objectForKey:@"modifierDateTime"];
       _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
