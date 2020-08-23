//
//  CreditCardData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
#import "CreditCardData.h"

@implementation CreditCardData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _cardType =[jsonDictionary objectForKey:@"cardType"];
        _bpmSubProduct =[jsonDictionary objectForKey:@"bpmSubProduct"];
        _deliveryOption =[jsonDictionary objectForKey:@"deliveryOption"];
         _deliveryOptionValue =[jsonDictionary objectForKey:@"deliveryOptionValue"];
        _yearsInUAE =[jsonDictionary objectForKey:@"yearsInUAE"];
        _perRefHomeCountryName = [jsonDictionary objectForKey:@"perRefHomeCountryName"];
        _perRefHomeCountryTelephone = [jsonDictionary objectForKey:@"perRefHomeCountryTelephone"];
        _perRefUAEName1 = [jsonDictionary objectForKey:@"perRefUAEName1"];
        _perRefUAETelephone1 = [jsonDictionary objectForKey:@"perRefUAETelephone1"];
        _perRefUAEName2 = [jsonDictionary objectForKey:@"perRefUAEName2"];
        _perRefUAETelephone2 = [jsonDictionary objectForKey:@"perRefUAETelephone2"];
        _suppTitle =[jsonDictionary objectForKey:@"suppTitle"];
        _suppName =[jsonDictionary objectForKey:@"suppName"];
        _suppRelationship = [jsonDictionary objectForKey:@"suppRelationship"];
        _suppDOB = [jsonDictionary objectForKey:@"suppDOB"];
        _accountNumber = [jsonDictionary objectForKey:@"accountNumber"];
        _accDtlsAccountType = [jsonDictionary objectForKey:@"accDtlsAccountType"];
        _autoPaymentAmount = [jsonDictionary objectForKey:@"autoPaymentAmount"];
        
        _product = [jsonDictionary objectForKey:@"product"];
        _nameOfBank = [jsonDictionary objectForKey:@"nameOfBank"];
        _accountCCNo = [jsonDictionary objectForKey:@"accountCCNo"];
        _creditLmtMonthPayments = [jsonDictionary objectForKey:@"creditLmtMonthPayments"];
        _creditShield = [jsonDictionary objectForKey:@"creditShield"];
        _accidentCare = [jsonDictionary objectForKey:@"accidentCare"];
        _osaName1 = [jsonDictionary objectForKey:@"osaName1"];
        _osaTelephone = [jsonDictionary objectForKey:@"osaTelephone"];
        _osaName2 =[jsonDictionary objectForKey:@"osaName2"];
        _osaGSM =[jsonDictionary objectForKey:@"osaGSM"];
        _osaName3 = [jsonDictionary objectForKey:@"osaName3"];
        _osaAlShamil = [jsonDictionary objectForKey:@"osaAlShamil"];
        _waselName = [jsonDictionary objectForKey:@"waselName"];
        _waselAccountNumber = [jsonDictionary objectForKey:@"waselAccountNumber"];
        _waselAmount = [jsonDictionary objectForKey:@"waselAmount"];
        _waselWeeklyDay = [jsonDictionary objectForKey:@"waselWeeklyDay"];
        _waselMonthlyAmount = [jsonDictionary objectForKey:@"waselMonthlyAmount"];
        _waselMonthlyDate = [jsonDictionary objectForKey:@"waselMonthlyDate"];
        _renewalOption =[jsonDictionary objectForKey:@"renewalOption"];
        
        _cisNumber1 =[jsonDictionary objectForKey:@"cisNumber1"];
        _caseID1 = [jsonDictionary objectForKey:@"caseID1"];
        _primaryMobileNo = [jsonDictionary objectForKey:@"primaryMobileNo"];
        _beneficiaryTelephone = [jsonDictionary objectForKey:@"beneficiaryTelephone"];
        _beneficiaryType =[jsonDictionary objectForKey:@"beneficiaryType"];
        _cisNumber2 =[jsonDictionary objectForKey:@"cisNumber2"];
        _caseID2 = [jsonDictionary objectForKey:@"caseID2"];
        _campaignCode = [jsonDictionary objectForKey:@"campaignCode"];
        
        
        _cardTypeValue = [jsonDictionary objectForKey:@"cardTypeValue"];
        _autoPaymentAmountValue = [jsonDictionary objectForKey:@"autoPaymentAmountValue"];
        _productValue = [jsonDictionary objectForKey:@"productValue"];
         _nameOfBankValue = [jsonDictionary objectForKey:@"nameOfBankValue"];
        _creditShieldValue = [jsonDictionary objectForKey:@"creditShieldValue"];
        _accidentCareValue = [jsonDictionary objectForKey:@"accidentCareValue"];
        _waselWeeklyDayValue = [jsonDictionary objectForKey:@"waselWeeklyDayValue"];
        _beneficiaryTypeValue = [jsonDictionary objectForKey:@"beneficiaryTypeValue"];
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
