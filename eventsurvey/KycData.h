//
//  KycData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/09/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface KycData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *customerName;
@property (readonly) NSString *uAEResident;
@property (readonly) NSString *kYCType;
@property (readonly) NSString *cisNoForExistingCustomer;
@property (readonly) NSString *pOAGiven;
@property (readonly) NSString *kYCPreparedOn;
@property (readonly) NSString *nextKYCReviewDate;
@property (readonly) NSString *kYCComments;
@property (readonly) NSString *qA1ExposedPerson;
@property (readonly) NSString *qA2NonResident;
@property (readonly) NSString *qA3Individuals;
@property (readonly) NSString *qA4SelectCountries;
@property (readonly) NSString *qA5CustHRBusiness;
@property (readonly) NSString *qA6HoldMailCustomer;
@property (readonly) NSString *qA7ReputationalAspects;
@property (readonly) NSString *qB1AnnualCredits;
@property (readonly) NSString *qB2AggregateBalance;
@property (readonly) NSString *qB3AssetProducts;
@property (readonly) NSString *qB4InvestmentsPortfolio;
@property (readonly) NSString *qB5ResidentCustomer;
@property (readonly) NSString *qB6RiskClassification;
@property (readonly) NSString *custReasOpenAccount;


@property (readonly) NSString *sourceFundAccntReg;
@property (readonly) NSString *approxAnnualTurnOverExpt;
@property (readonly) NSString *totalIncomeAED;
@property (readonly) NSString *noOfTransMonthCash;
@property (readonly) NSString *noOfTransMonthCheq;
@property (readonly) NSString *totalAmtTransAEDCash;
@property (readonly) NSString *totalAmtTransAEDCheq;
@property (readonly) NSString *purposeTransCash;
@property (readonly) NSString *purposeTransCheq;
@property (readonly) NSString *depNoOfTransMonthCash;
@property (readonly) NSString *depNoOfTransMonthCheq;
@property (readonly) NSString *depTotalAmtTransAEDCash;
@property (readonly) NSString *depTotalAmtTransAEDCheq;
@property (readonly) NSString *depPurposeTransCash;
@property (readonly) NSString *depPurposeTransCheq;
@property (readonly) NSString *maxDepositsCash;
@property (readonly) NSString *maxDepositsCheq;
@property (readonly) NSString *maxWithdrawalsCash;
@property (readonly) NSString *maxWithdrawalsCheq;






@property (readonly) NSString *outNoOfTransMonthInternational;
@property (readonly) NSString *outNoOfTransInMntLocal;
@property (readonly) NSString *outTotalAmtTransAEDInternational;
@property (readonly) NSString *outTotalAmtTransAEDLocal;
@property (readonly) NSString *outPurposeTransInternational;
@property (readonly) NSString *outPurposeTransLocal;
@property (readonly) NSString *inNoOfTransMonthInternational;
@property (readonly) NSString *inNoOfTransMonthLocal;
@property (readonly) NSString *inTotalAmtTransAEDInternational;
@property (readonly) NSString *inTotlAmtTransAEDLocal;
@property (readonly) NSString *inPurposeTransInternational;
@property (readonly) NSString *inPurposeTransLocal;
@property (readonly) NSString *maxSingleAmtInward;
@property (readonly) NSString *maxSingleAmtOutward;
@property (readonly) NSString *internationalRem3MjrContriesIn;
@property (readonly) NSString *internationalRem3MjrContriesOut;

@property (readonly) NSString *eddDetailsLnsBusiness;
@property (readonly) NSString *eddHowProspectIntroduced;
@property (readonly) NSString *eddDescClientsSourceWealth;
@property (readonly) NSString *eddProdUsgTransProfile;
@property (readonly) NSString *eddNonResident;
@property (readonly) NSString *eddDetailsOpenAcc;
@property (readonly) NSString *eddAreYouAwereOfAnyAspect;
@property (readonly) NSString *iConfirmCheckbox;
@property (readonly) NSString *preparedBy;
@property (readonly) NSString *preparedDate;
@property (readonly) NSString *reviewedBy;
@property (readonly) NSString *reviewedDate;
@property (readonly) NSString *approvedBy;
@property (readonly) NSString *approvedDate;
@property (readonly) NSString *recordStatus;
@property (readonly) NSString *recordFound;




@property (readonly) NSString *uAEResidentValue;
@property (readonly) NSString *kYCTypeValue;
@property (readonly) NSString *pOAGivenValue;
@property (readonly) NSString *qA1ExposedPersonValue;
@property (readonly) NSString *qA2NonResidentValue;
@property (readonly) NSString *qA3IndividualsValue;
@property (readonly) NSString *qA4SelectCountriesValue;
@property (readonly) NSString *qA5CustHRBusinessValue;
@property (readonly) NSString *qA6HoldMailCustomerValue;
@property (readonly) NSString *qA7ReputationalAspectsValue;

@property (readonly) NSString *qB1AnnualCreditsValue;
@property (readonly) NSString *qB2AggregateBalanceValue;
@property (readonly) NSString *qB3AssetProductsValue;
@property (readonly) NSString *qB4InvestmentsPortfolioValue;
@property (readonly) NSString *qB5ResidentCustomerValue;
@property (readonly) NSString *qB6RiskClassificationValue;
@property (readonly) NSString *custReasOpenAccountValue;


@property (readonly) NSString *internationalRem3MjrContriesInValue;
@property (readonly) NSString *internationalRem3MjrContriesOutValue;




@end
