//
//  KycData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//



#import "KycData.h"

@implementation KycData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        _customerName = [jsonDictionary objectForKey:@"customerName"];
        _uAEResident = [jsonDictionary objectForKey:@"uAEResident"];
        _kYCType = [jsonDictionary objectForKey:@"kYCType"];
        _cisNoForExistingCustomer = [jsonDictionary objectForKey:@"cisNoForExistingCustomer"];
        _pOAGiven = [jsonDictionary objectForKey:@"pOAGiven"];
        _kYCPreparedOn = [jsonDictionary objectForKey:@"kYCPreparedOn"];
        _nextKYCReviewDate = [jsonDictionary objectForKey:@"nextKYCReviewDate"];
        _kYCComments = [jsonDictionary objectForKey:@"kYCComments"];
        _qA1ExposedPerson = [jsonDictionary objectForKey:@"qA1ExposedPerson"];
        _qA2NonResident = [jsonDictionary objectForKey:@"qA2NonResident"];
        _qA3Individuals = [jsonDictionary objectForKey:@"qA3Individuals"];
        _qA4SelectCountries = [jsonDictionary objectForKey:@"qA4SelectCountries"];
        _qA5CustHRBusiness = [jsonDictionary objectForKey:@"qA5CustHRBusiness"];
        _qA6HoldMailCustomer = [jsonDictionary objectForKey:@"qA6HoldMailCustomer"];
        _qA7ReputationalAspects = [jsonDictionary objectForKey:@"qA7ReputationalAspects"];
        _qB1AnnualCredits = [jsonDictionary objectForKey:@"qB1AnnualCredits"];
        _qB2AggregateBalance = [jsonDictionary objectForKey:@"qB2AggregateBalance"];
        _qB3AssetProducts = [jsonDictionary objectForKey:@"qB3AssetProducts"];
        _qB4InvestmentsPortfolio = [jsonDictionary objectForKey:@"qB4InvestmentsPortfolio"];
        _qB5ResidentCustomer = [jsonDictionary objectForKey:@"qB5ResidentCustomer"];
        _qB6RiskClassification = [jsonDictionary objectForKey:@"qB6RiskClassification"];
        _custReasOpenAccount = [jsonDictionary objectForKey:@"custReasOpenAccount"];
        
        _sourceFundAccntReg = [jsonDictionary objectForKey:@"sourceFundAccntReg"];
        _approxAnnualTurnOverExpt = [jsonDictionary objectForKey:@"approxAnnualTurnOverExpt"];
        _totalIncomeAED = [jsonDictionary objectForKey:@"totalIncomeAED"];
        _noOfTransMonthCash = [jsonDictionary objectForKey:@"noOfTransMonthCash"];
        _noOfTransMonthCheq = [jsonDictionary objectForKey:@"noOfTransMonthCheq"];
        _totalAmtTransAEDCash = [jsonDictionary objectForKey:@"totalAmtTransAEDCash"];
        _totalAmtTransAEDCheq = [jsonDictionary objectForKey:@"totalAmtTransAEDCheq"];
        _purposeTransCash = [jsonDictionary objectForKey:@"purposeTransCash"];
        _purposeTransCheq = [jsonDictionary objectForKey:@"purposeTransCheq"];
        _depNoOfTransMonthCash = [jsonDictionary objectForKey:@"depNoOfTransMonthCash"];
        _depNoOfTransMonthCheq = [jsonDictionary objectForKey:@"depNoOfTransMonthCheq"];
        _depTotalAmtTransAEDCash = [jsonDictionary objectForKey:@"depTotalAmtTransAEDCash"];
        _depTotalAmtTransAEDCheq = [jsonDictionary objectForKey:@"depTotalAmtTransAEDCheq"];
        _depPurposeTransCash = [jsonDictionary objectForKey:@"depPurposeTransCash"];
        _depPurposeTransCheq = [jsonDictionary objectForKey:@"depPurposeTransCheq"];
        _maxDepositsCash = [jsonDictionary objectForKey:@"maxDepositsCash"];
        _maxDepositsCheq = [jsonDictionary objectForKey:@"maxDepositsCheq"];
        _maxWithdrawalsCash = [jsonDictionary objectForKey:@"maxWithdrawalsCash"];
        _maxWithdrawalsCheq = [jsonDictionary objectForKey:@"maxWithdrawalsCheq"];
        _outNoOfTransMonthInternational = [jsonDictionary objectForKey:@"outNoOfTransMonthInternational"];
        _outNoOfTransInMntLocal = [jsonDictionary objectForKey:@"outNoOfTransInMntLocal"];
        _outTotalAmtTransAEDInternational = [jsonDictionary objectForKey:@"outTotalAmtTransAEDInternational"];
        _outTotalAmtTransAEDLocal = [jsonDictionary objectForKey:@"outTotalAmtTransAEDLocal"];
        _outPurposeTransInternational = [jsonDictionary objectForKey:@"outPurposeTransInternational"];
        _outPurposeTransLocal = [jsonDictionary objectForKey:@"outPurposeTransLocal"];
        _inNoOfTransMonthInternational = [jsonDictionary objectForKey:@"inNoOfTransMonthInternational"];
        _inNoOfTransMonthLocal = [jsonDictionary objectForKey:@"inNoOfTransMonthLocal"];
        _inTotalAmtTransAEDInternational = [jsonDictionary objectForKey:@"inTotalAmtTransAEDInternational"];
        _inTotlAmtTransAEDLocal = [jsonDictionary objectForKey:@"inTotlAmtTransAEDLocal"];
        _inPurposeTransInternational = [jsonDictionary objectForKey:@"inPurposeTransInternational"];
        _inPurposeTransLocal = [jsonDictionary objectForKey:@"inPurposeTransLocal"];
        _maxSingleAmtInward = [jsonDictionary objectForKey:@"maxSingleAmtInward"];
        _maxSingleAmtOutward = [jsonDictionary objectForKey:@"maxSingleAmtOutward"];
        _internationalRem3MjrContriesIn = [jsonDictionary objectForKey:@"internationalRem3MjrContriesIn"];
        _internationalRem3MjrContriesOut = [jsonDictionary objectForKey:@"internationalRem3MjrContriesOut"];
        _eddDetailsLnsBusiness = [jsonDictionary objectForKey:@"eddDetailsLnsBusiness"];
        _eddHowProspectIntroduced = [jsonDictionary objectForKey:@"eddHowProspectIntroduced"];
        _eddDescClientsSourceWealth = [jsonDictionary objectForKey:@"eddDescClientsSourceWealth"];
        _eddProdUsgTransProfile = [jsonDictionary objectForKey:@"eddProdUsgTransProfile"];
        _eddNonResident = [jsonDictionary objectForKey:@"eddNonResident"];
        _eddDetailsOpenAcc = [jsonDictionary objectForKey:@"eddDetailsOpenAcc"];
        _eddAreYouAwereOfAnyAspect = [jsonDictionary objectForKey:@"eddAreYouAwereOfAnyAspect"];
        _iConfirmCheckbox = [jsonDictionary objectForKey:@"iConfirmCheckbox"];
        _preparedBy = [jsonDictionary objectForKey:@"preparedBy"];
        _preparedDate = [jsonDictionary objectForKey:@"preparedDate"];
        _reviewedBy = [jsonDictionary objectForKey:@"reviewedBy"];
        _reviewedDate = [jsonDictionary objectForKey:@"reviewedDate"];
        _approvedBy = [jsonDictionary objectForKey:@"approvedBy"];
        _approvedDate = [jsonDictionary objectForKey:@"approvedDate"];
        _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
        
        _uAEResidentValue = [jsonDictionary objectForKey:@"uAEResidentValue"];
        _kYCTypeValue = [jsonDictionary objectForKey:@"kYCTypeValue"];
        _pOAGivenValue = [jsonDictionary objectForKey:@"pOAGivenValue"];
        _qA1ExposedPersonValue = [jsonDictionary objectForKey:@"qA1ExposedPersonValue"];
        _qA2NonResidentValue = [jsonDictionary objectForKey:@"qA2NonResidentValue"];
        _qA3IndividualsValue = [jsonDictionary objectForKey:@"qA3IndividualsValue"];
        _qA4SelectCountriesValue = [jsonDictionary objectForKey:@"qA4SelectCountriesValue"];
        _qA5CustHRBusinessValue = [jsonDictionary objectForKey:@"qA5CustHRBusinessValue"];
        _qA6HoldMailCustomerValue = [jsonDictionary objectForKey:@"qA6HoldMailCustomerValue"];
        _qA7ReputationalAspectsValue = [jsonDictionary objectForKey:@"qA7ReputationalAspectsValue"];
        
        
        _qB1AnnualCreditsValue = [jsonDictionary objectForKey:@"qB1AnnualCreditsValue"];
        _qB2AggregateBalanceValue = [jsonDictionary objectForKey:@"qB2AggregateBalanceValue"];
        _qB3AssetProductsValue = [jsonDictionary objectForKey:@"qB3AssetProductsValue"];
        _qB4InvestmentsPortfolioValue = [jsonDictionary objectForKey:@"qB4InvestmentsPortfolioValue"];
        _qB5ResidentCustomerValue = [jsonDictionary objectForKey:@"qB5ResidentCustomerValue"];
        _qB6RiskClassificationValue = [jsonDictionary objectForKey:@"qB6RiskClassificationValue"];
        _custReasOpenAccountValue = [jsonDictionary objectForKey:@"custReasOpenAccountValue"];
        
        _internationalRem3MjrContriesInValue = [jsonDictionary objectForKey:@"internationalRem3MjrContriesInValue"];
        _internationalRem3MjrContriesOutValue = [jsonDictionary objectForKey:@"internationalRem3MjrContriesOutValue"];
        
        
    }
    
    return self;
}

@end

