//
//  CreditCardTrnData.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//


#import "CreditCardTrnData.h"

@implementation CreditCardTrnData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _creditCardNumber = [jsonDictionary objectForKey:@"creditCardNumber"];
        _trnType = [jsonDictionary objectForKey:@"trnType"];
        _trnDate = [jsonDictionary objectForKey:@"trnDate"];
        _narration1 = [jsonDictionary objectForKey:@"narration1"];
        _narration2 = [jsonDictionary objectForKey:@"narration2"];
        _trnAmount = [jsonDictionary objectForKey:@"trnAmount"];
        _CRDRflag = [jsonDictionary objectForKey:@"CRDRflag"];
        _trnCurrency = [jsonDictionary objectForKey:@"trnCurrency"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end

