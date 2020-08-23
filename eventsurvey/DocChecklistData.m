//
//  DocChecklistData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 10/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "DocChecklistData.h"

@implementation DocChecklistData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _seqNo = [jsonDictionary objectForKey:@"seqNo"];
        _accountType = [jsonDictionary objectForKey:@"accountType"];
        _docID = [jsonDictionary objectForKey:@"docID"];
        _docName = [jsonDictionary objectForKey:@"docName"];
        _mandatory = [jsonDictionary objectForKey:@"mandatory"];
        _uploaded = [jsonDictionary objectForKey:@"uploaded"];
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
