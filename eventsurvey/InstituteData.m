//
//  InstituteData.m
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 17/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>



#import "InstituteData.h"

@implementation InstituteData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        
        _code = [jsonDictionary objectForKey:@"code"];
        _desc = [jsonDictionary objectForKey:@"desc"];
        
        
        
        
    }
    
    return self;
}

@end
