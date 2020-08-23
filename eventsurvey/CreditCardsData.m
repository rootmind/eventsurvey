//
//  CreditCardsData.m
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 12/12/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import "CreditCardsData.h"

@implementation CreditCardsData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _cifNumber = [jsonDictionary objectForKey:@"cifNumber"];
        _creditCardNumber = [jsonDictionary objectForKey:@"creditCardNumber"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _productName = [jsonDictionary objectForKey:@"productName"];
        _creditCardType = [jsonDictionary objectForKey:@"creditCardType"];
        _creditCardStatus = [jsonDictionary objectForKey:@"creditCardStatus"];
        _totalLimitAmount = [jsonDictionary objectForKey:@"totalLimitAmount"];
        _limitCurrency = [jsonDictionary objectForKey:@"limitCurrency"];
        _currentOSBalance = [jsonDictionary objectForKey:@"currentOSBalance"];
        _paymentDueDate = [jsonDictionary objectForKey:@"paymentDueDate"];
        _lastPaymentDate = [jsonDictionary objectForKey:@"lastPaymentDate"];
        _lastPaymentAmount = [jsonDictionary objectForKey:@"lastPaymentAmount"];
        _statementDate = [jsonDictionary objectForKey:@"statementDate"];
        _availableCreditLimit = [jsonDictionary objectForKey:@"availableCreditLimit"];
        _autoPaymentOption = [jsonDictionary objectForKey:@"autoPaymentOption"];
        _availableCashLimit = [jsonDictionary objectForKey:@"availableCashLimit"];
        _totalPaymentDue = [jsonDictionary objectForKey:@"totalPaymentDue"];
        _minPaymentDue = [jsonDictionary objectForKey:@"minPaymentDue"];
        _cashWithdrawLimit = [jsonDictionary objectForKey:@"cashWithdrawLimit"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];

        
    }
    
    return self;
}

@end
