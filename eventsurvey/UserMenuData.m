//
//  UserMenuData.m
//  eventsurvey
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserMenuData.h"

@implementation UserMenuData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _userid = [jsonDictionary objectForKey:@"userid"];
        _desc = [jsonDictionary objectForKey:@"desc"];
        _menuID = [jsonDictionary objectForKey:@"menuID"];
        _assignFlag = [jsonDictionary objectForKey:@"assignFlag"];
        _menuIDValue = [jsonDictionary objectForKey:@"menuIDValue"];
    
    }
    
    return self;
}

@end

