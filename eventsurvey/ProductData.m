//
//  ProductData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>




#import "ProductData.h"

@implementation ProductData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _accountNo = [jsonDictionary objectForKey:@"accountNo"];
        _accountIBAN = [jsonDictionary objectForKey:@"accountIBAN"];
        _accountType = [jsonDictionary objectForKey:@"accountType"];
        _currency = [jsonDictionary objectForKey:@"currency"];
        _statementCycle = [jsonDictionary objectForKey:@"statementCycle"];
        _onlineBankTrans = [jsonDictionary objectForKey:@"onlineBankTrans"];
        _accOperInstrs = [jsonDictionary objectForKey:@"accOperInstrs"];
        _accountTitle = [jsonDictionary objectForKey:@"accountTitle"];
        _debitCardRequired = [jsonDictionary objectForKey:@"debitCardRequired"];
        _nameCard= [jsonDictionary objectForKey:@"nameCard"];
        _favEmirate=[jsonDictionary objectForKey:@"favEmirate"];
        _debitCardDelvChnl = [jsonDictionary objectForKey:@"debitCardDelvChnl"];
        _pinMailerDelvChnl = [jsonDictionary objectForKey:@"pinMailerDelvChnl"];
        _transferSalary = [jsonDictionary objectForKey:@"transferSalary"];
        _chequeBookRequired = [jsonDictionary objectForKey:@"chequeBookRequired"];
        _overDraftType = [jsonDictionary objectForKey:@"overDraftType"];
        _interestOption = [jsonDictionary objectForKey:@"interestOption"];
        _interestRate = [jsonDictionary objectForKey:@"interestRate"];
        _supplCardReq = [jsonDictionary objectForKey:@"supplCardReq"];
        _purposeCode = [jsonDictionary objectForKey:@"purposeCode"];
        _businessCode = [jsonDictionary objectForKey:@"businessCode"];
        _insuranceCode = [jsonDictionary objectForKey:@"insuranceCode"];
        _campaignCode = [jsonDictionary objectForKey:@"campaignCode"];
        _sellerID = [jsonDictionary objectForKey:@"sellerID"];
        _sellerChannel = [jsonDictionary objectForKey:@"sellerChannel"];
        _schemeID = [jsonDictionary objectForKey:@"schemeID"];
        _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
        _accountTypeValue = [jsonDictionary objectForKey:@"accountTypeValue"];
        _currencyValue = [jsonDictionary objectForKey:@"currencyValue"];
        _statementCycleValue = [jsonDictionary objectForKey:@"statementCycleValue"];
        _onlineBankTransValue = [jsonDictionary objectForKey:@"onlineBankTransValue"];
        _debitCardRequiredValue = [jsonDictionary objectForKey:@"debitCardRequiredValue"];
        _favEmirateValue=[jsonDictionary objectForKey:@"favEmirateValue"];
        _debitCardDelvChnlValue = [jsonDictionary objectForKey:@"debitCardDelvChnlValue"];
        _pinMailerDelvChnlValue = [jsonDictionary objectForKey:@"pinMailerDelvChnlValue"];
        _transferSalaryValue = [jsonDictionary objectForKey:@"transferSalaryValue"];
        _chequeBookRequiredValue = [jsonDictionary objectForKey:@"chequeBookRequiredValue"];
        _interestOptionValue = [jsonDictionary objectForKey:@"interestOptionValue"];
        _interestRateValue = [jsonDictionary objectForKey:@"interestRateValue"];
        _supplCardReqValue = [jsonDictionary objectForKey:@"supplCardReqValue"];
        
         _purposeCodeValue = [jsonDictionary objectForKey:@"purposeCodeValue"];
        _accOperInstrsValue = [jsonDictionary objectForKey:@"accOperInstrsValue"];
        
        
      
        
    }
    
    return self;
}

@end
