//
//  ContactData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import "ContactData.h"

@implementation ContactData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _mailOption= [jsonDictionary objectForKey:@"mailOption"];
        _debitCardDeliveryChnl= [jsonDictionary objectForKey:@"debitCardDeliveryChnl"];
        _eStatement= [jsonDictionary objectForKey:@"eStatement"];
        _email= [jsonDictionary objectForKey:@"email"];
        _email2= [jsonDictionary objectForKey:@"email2"];
        _mobile= [jsonDictionary objectForKey:@"mobile"];
        _mobileSP= [jsonDictionary objectForKey:@"mobileSP"];
        _mobile2= [jsonDictionary objectForKey:@"mobile2"];
        _courierAdd= [jsonDictionary objectForKey:@"courierAdd"];
        _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
         _mailOptionValue= [jsonDictionary objectForKey:@"mailOptionValue"];
         _debitCardDeliveryChnlValue= [jsonDictionary objectForKey:@"debitCardDeliveryChnlValue"];
         _eStatementValue= [jsonDictionary objectForKey:@"eStatementValue"];
         _mobileSPValue= [jsonDictionary objectForKey:@"mobileSPValue"];
        
    }
    
    return self;
}

@end



