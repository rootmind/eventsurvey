//
//  PersonalLoanData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 04/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import "PersonalLoanData.h"

@implementation PersonalLoanData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _accountNo = [jsonDictionary objectForKey:@"accountNo"];
        _financeAccountNo = [jsonDictionary objectForKey:@"financeAccountNo"];
        _campaignCode = [jsonDictionary objectForKey:@"campaignCode"];
        _wifeOrHusbandEmployed = [jsonDictionary objectForKey:@"wifeOrHusbandEmployed"];
        _noOfChildren = [jsonDictionary objectForKey:@"noOfChildren"];
        _education = [jsonDictionary objectForKey:@"education"];
        _iWantApplyFor = [jsonDictionary objectForKey:@"iWantApplyFor"];
        _purposeOfLoan = [jsonDictionary objectForKey:@"purposeOfLoan"];
        _personalRName = [jsonDictionary objectForKey:@"personalRName"];
        _personalRTelephone = [jsonDictionary objectForKey:@"personalRTelephone"];
        _healthQA1 = [jsonDictionary objectForKey:@"healthQA1"];
        _healthQA2 = [jsonDictionary objectForKey:@"healthQA2"];
        _healthQB1 = [jsonDictionary objectForKey:@"healthQB1"];
        _healthQB2 = [jsonDictionary objectForKey:@"healthQB2"];
        _healthAddress = [jsonDictionary objectForKey:@"healthAddress"];
        _nameBeneficiary1 = [jsonDictionary objectForKey:@"nameBeneficiary1"];
        _nameBeneficiary2 = [jsonDictionary objectForKey:@"nameBeneficiary2"];
        _totalFinance = [jsonDictionary objectForKey:@"totalFinance"];
        _interestRate = [jsonDictionary objectForKey:@"interestRate"];
        _tenor = [jsonDictionary objectForKey:@"tenor"];
        _installmentAmount = [jsonDictionary objectForKey:@"installmentAmount"];
        _startingDate = [jsonDictionary objectForKey:@"startingDate"];
        _lastInstallmentAmount = [jsonDictionary objectForKey:@"lastInstallmentAmount"];
        _noOfInstallments = [jsonDictionary objectForKey:@"noOfInstallments"];
        _processingFee = [jsonDictionary objectForKey:@"processingFee"];
        _insuranceAmount = [jsonDictionary objectForKey:@"insuranceAmount"];
        _settlementOwnResoures = [jsonDictionary objectForKey:@"settlementOwnResoures"];
        _settlementRepeatLoan = [jsonDictionary objectForKey:@"settlementRepeatLoan"];
        _settlementOtherBank = [jsonDictionary objectForKey:@"settlementOtherBank"];
        _otherFees = [jsonDictionary objectForKey:@"otherFees"];
        
        _iWantApplyForValue = [jsonDictionary objectForKey:@"iWantApplyForValue"];
        _purposeOfLoanValue = [jsonDictionary objectForKey:@"purposeOfLoanValue"];
        _healthQA1Value = [jsonDictionary objectForKey:@"healthQA1Value"];
        _healthQB1Value = [jsonDictionary objectForKey:@"healthQB1Value"];
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
