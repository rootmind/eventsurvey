//
//  ListMasterData.m
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListMasterData.h"

@implementation ListMasterData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _code = [jsonDictionary objectForKey:@"code"];
        _desc = [jsonDictionary objectForKey:@"desc"];
        _tableName = [jsonDictionary objectForKey:@"tableName"];
        _sync = [jsonDictionary objectForKey:@"sync"];
       
        
    }
    
    return self;
}

@end
