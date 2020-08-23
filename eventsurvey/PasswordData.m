//
//  PasswordData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 16/12/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "PasswordData.h"

@implementation PasswordData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        _minLength = [jsonDictionary objectForKey:@"minLength"];
        _maxLength = [jsonDictionary objectForKey:@"maxLength"];
        _capitalLetter = [jsonDictionary objectForKey:@"capitalLetter"];
        _specialCharacter = [jsonDictionary objectForKey:@"specialCharacter"];
        _oldPasswordRepeat = [jsonDictionary objectForKey:@"oldPasswordRepeat"];
        _policyAvailable = [jsonDictionary objectForKey:@"policyAvailable"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}
@end