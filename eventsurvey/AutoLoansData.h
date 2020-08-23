//
//  AutoLoansData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoLoansData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *salesOfficerName;
@property (readonly) NSString *code;
@property (readonly) NSString *cisNo ;
@property (readonly) NSString *noYearsUAE;
@property (readonly) NSString *nameOfSponsor;
@property (readonly) NSString *accountNumber;
@property (readonly) NSString *ycisNo ;
@property (readonly) NSString *bankName;
@property (readonly) NSString *branch;
@property (readonly) NSString *salaryTransfer;
@property (readonly) NSString *monthlyPayments;
@property (readonly) NSString *dealerOrsellerName;
@property (readonly) NSString *telephone;
@property (readonly) NSString *fax;
@property (readonly) NSString *makeOrModel;
@property (readonly) NSString *mileage;
@property (readonly) NSString *neworUsed;
@property (readonly) NSString *normalOrAlloy;
@property (readonly) NSString *transmission;
@property (readonly) NSString *sunroof;
@property (readonly) NSString *dealerSalesRepName;

@property (readonly) NSString *yearOfManufacture;
@property (readonly) NSString *color;
@property (readonly) NSString *engineNo;
@property (readonly) NSString *chassisNo;
@property (readonly) NSString *registrationEmirate;
@property (readonly) NSString *priceOfVehicle;
@property (readonly) NSString *vehicleInsurance;
@property (readonly) NSString *otherCharges;
@property (readonly) NSString *totalCost;
@property (readonly) NSString *downPayment;
@property (readonly) NSString *tradeinValue;
@property (readonly) NSString *totalFinancedAmount;
@property (readonly) NSString *interestRate;
@property (readonly) NSString *repaymentAmount;
@property (readonly) NSString *processingFee;
@property (readonly) NSString *tenor;
@property (readonly) NSString *emi;
@property (readonly) NSString *insuranceCompanyName;
@property (readonly) NSString *dueDate;
@property (readonly) NSString *renewalDate;
@property (readonly) NSString *policyNo;

@property (readonly) NSString *guarantorName;
@property (readonly) NSString *guarantorAddress;
@property (readonly) NSString *guarantorTelephone;
@property (readonly) NSString *guarantorMonthlyIncome;
@property (readonly) NSString *guarantorBankName;
@property (readonly) NSString *guarantorAccountNo;
@property (readonly) NSString *personalRefName1;
@property (readonly) NSString *personalRefAddress1;
@property (readonly) NSString *personalRefTelephone1;
@property (readonly) NSString *personalRefName2;
@property (readonly) NSString *personalRefAddress2;
@property (readonly) NSString *personalRefTelephone2;
@property (readonly) NSString *caseOutcome;





@property (readonly) NSString *salaryTransferValue;
@property (readonly) NSString *neworUsedValue;
@property (readonly) NSString *normalOrAlloyValue;
@property (readonly) NSString *transmissionValue;
@property (readonly) NSString *sunroofValue;
@property (readonly) NSString *colorValue;
@property (readonly) NSString *registrationEmirateValue;


@property (readonly) NSString *recordFound;



@end