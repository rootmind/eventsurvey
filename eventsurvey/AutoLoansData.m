//
//  AutoLoansData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import "AutoLoansData.h"

@implementation AutoLoansData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _salesOfficerName = [jsonDictionary objectForKey:@"salesOfficerName"];
        _code = [jsonDictionary objectForKey:@"code"];
        _cisNo = [jsonDictionary objectForKey:@"cisNo"];
        _noYearsUAE = [jsonDictionary objectForKey:@"noYearsUAE"];
        _nameOfSponsor = [jsonDictionary objectForKey:@"nameOfSponsor"];
        _accountNumber = [jsonDictionary objectForKey:@"accountNumber"];
        _ycisNo = [jsonDictionary objectForKey:@"ycisNo"];
        _bankName = [jsonDictionary objectForKey:@"bankName"];
        _branch = [jsonDictionary objectForKey:@"branch"];
        _salaryTransfer = [jsonDictionary objectForKey:@"salaryTransfer"];
        _monthlyPayments = [jsonDictionary objectForKey:@"monthlyPayments"];
        _dealerOrsellerName = [jsonDictionary objectForKey:@"dealerOrsellerName"];
        _telephone = [jsonDictionary objectForKey:@"telephone"];
        _fax= [jsonDictionary objectForKey:@"fax"];
        _makeOrModel = [jsonDictionary objectForKey:@"makeOrModel"];
        _mileage = [jsonDictionary objectForKey:@"mileage"];
        _neworUsed = [jsonDictionary objectForKey:@"neworUsed"];
        _normalOrAlloy = [jsonDictionary objectForKey:@"normalOrAlloy"];
        _transmission = [jsonDictionary objectForKey:@"transmission"];
        _sunroof = [jsonDictionary objectForKey:@"sunroof"];
        _dealerSalesRepName = [jsonDictionary objectForKey:@"dealerSalesRepName"];
       
        
        
        _yearOfManufacture = [jsonDictionary objectForKey:@"yearOfManufacture"];
        _color = [jsonDictionary objectForKey:@"color"];
        _engineNo = [jsonDictionary objectForKey:@"engineNo"];
        _chassisNo = [jsonDictionary objectForKey:@"chassisNo"];
        _registrationEmirate = [jsonDictionary objectForKey:@"registrationEmirate"];
        _priceOfVehicle = [jsonDictionary objectForKey:@"priceOfVehicle"];
        _vehicleInsurance = [jsonDictionary objectForKey:@"vehicleInsurance"];
        _otherCharges = [jsonDictionary objectForKey:@"otherCharges"];
        _totalCost = [jsonDictionary objectForKey:@"totalCost"];
        _downPayment = [jsonDictionary objectForKey:@"downPayment"];
        _tradeinValue = [jsonDictionary objectForKey:@"tradeinValue"];
        _totalFinancedAmount = [jsonDictionary objectForKey:@"totalFinancedAmount"];
        _interestRate = [jsonDictionary objectForKey:@"interestRate"];
        _repaymentAmount = [jsonDictionary objectForKey:@"repaymentAmount"];
        _processingFee = [jsonDictionary objectForKey:@"processingFee"];
        _tenor = [jsonDictionary objectForKey:@"tenor"];
        _emi = [jsonDictionary objectForKey:@"emi"];
        _insuranceCompanyName = [jsonDictionary objectForKey:@"insuranceCompanyName"];
        _dueDate = [jsonDictionary objectForKey:@"dueDate"];
        _renewalDate = [jsonDictionary objectForKey:@"renewalDate"];
        _policyNo = [jsonDictionary objectForKey:@"policyNo"];
        
        _guarantorName = [jsonDictionary objectForKey:@"guarantorName"];
        _guarantorAddress = [jsonDictionary objectForKey:@"guarantorAddress"];
        _guarantorTelephone = [jsonDictionary objectForKey:@"guarantorTelephone"];
        _guarantorMonthlyIncome = [jsonDictionary objectForKey:@"guarantorMonthlyIncome"];
        _guarantorBankName = [jsonDictionary objectForKey:@"guarantorBankName"];
        _guarantorAccountNo = [jsonDictionary objectForKey:@"guarantorAccountNo"];
        _personalRefName1 = [jsonDictionary objectForKey:@"personalRefName1"];
        _personalRefAddress1 = [jsonDictionary objectForKey:@"personalRefAddress1"];
        _personalRefTelephone1 = [jsonDictionary objectForKey:@"personalRefTelephone1"];
        _personalRefName2 = [jsonDictionary objectForKey:@"personalRefName2"];
        _personalRefAddress2 = [jsonDictionary objectForKey:@"personalRefAddress2"];
        _personalRefTelephone2 = [jsonDictionary objectForKey:@"personalRefTelephone2"];
        _caseOutcome = [jsonDictionary objectForKey:@"caseOutcome"];
       

        
        
        _salaryTransferValue = [jsonDictionary objectForKey:@"salaryTransferValue"];
        _neworUsedValue = [jsonDictionary objectForKey:@"neworUsedValue"];
        _normalOrAlloyValue = [jsonDictionary objectForKey:@"normalOrAlloyValue"];
        _transmissionValue = [jsonDictionary objectForKey:@"transmissionValue"];
        _sunroofValue = [jsonDictionary objectForKey:@"sunroofValue"];
        _colorValue = [jsonDictionary objectForKey:@"colorValue"];
        _registrationEmirateValue = [jsonDictionary objectForKey:@"registrationEmirateValue"];
        
        
        
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end