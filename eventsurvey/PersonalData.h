//
//  PersonalData.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 6/5/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonalData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;


@property (readonly) NSString *refNo;
@property (readonly) NSString *existingRefNo;
@property (readonly) NSString *accountType;

@property (readonly) NSString *extCustomerFlag;
@property (readonly) NSString *cifNumber;
@property (readonly) NSString *extAccountNo;
@property (readonly) NSString *extCreditCardNo;
@property (readonly) NSString *extRelationship;
@property (readonly) NSString *relationshipNo;

@property (readonly) NSString *customerName;
@property (readonly) NSString *firstName;
@property (readonly) NSString *middleName;
@property (readonly) NSString *lastName;


@property (readonly) NSString *title;
@property (readonly) NSString *categoryType;
@property (readonly) NSString *branch;
@property (readonly) NSString *jointOwn;
@property (readonly) NSString *natureOfRelation;
@property (readonly) NSString *residenceStatus;
@property (readonly) NSString *nationality;
@property (readonly) NSString *dob;
@property (readonly) NSString *educated;
@property (readonly) NSString *maritalStatus;
@property (readonly) NSString *gender;

//@property (readonly) NSString *motherMaidenName;
//@property (readonly) NSString *segment;
//@property (readonly) NSString *preferredLanguage;
//@property (readonly) NSString *familyInUAE;
//@property (readonly) NSString *familySizeUAE;
//@property (readonly) NSString *carOwnership;
//@property (readonly) NSString *carYear;
//@property (readonly) NSString *media;
//@property (readonly) NSString *favouriteCity;
//@property (readonly) NSString *domicile;
//@property (readonly) NSString *preferredLanguageValue;
//@property (readonly) NSString *familyInUAEValue;
//@property (readonly) NSString *familySizeUAEValue;
//@property (readonly) NSString *carOwnershipValue;
//
//@property (readonly) NSString *mediaValue;
//@property (readonly) NSString *favouriteCityValue;


@property (readonly) NSString *passportNo;
@property (readonly) NSString *passportIssueDate;
@property (readonly) NSString *passportExpDate;
@property (readonly) NSString *passportIssuePlace;
@property (readonly) NSString *passportIssueCountry;
@property (readonly) NSString *emiratesID;
@property (readonly) NSString *emiratesIDExpDate;
@property (readonly) NSString *passportIssueCountryValue;


@property (readonly) NSString *extRelationshipValue;
@property (readonly) NSString *titleValue;
@property (readonly) NSString *categoryTypeValue;
@property (readonly) NSString *branchValue;
@property (readonly) NSString *jointOwnValue;
@property (readonly) NSString *natureOfRelationValue;
@property (readonly) NSString *residenceStatusValue;
@property (readonly) NSString *nationalityValue;
@property (readonly) NSString *educatedValue;
@property (readonly) NSString *maritalStatusValue;
@property (readonly) NSString *genderValue;
@property (readonly) NSString *makerId;
@property (readonly) NSString *makerDateTime;






@property (readonly) NSString *recordStatus;



//@property (readonly) NSString *eNamePerformedDate;
//@property (readonly) NSString *eNameMatchFlag;
//@property (readonly) NSString *eNamePerformedName;
//@property (readonly) NSString *eNameResult;
//@property (readonly) NSString *eNameComment;
//@property (readonly) NSString *shortName;
//@property (readonly) NSString *branch;
//@property (readonly) NSString *jointOwn;
//@property (readonly) NSString *natureOfRelation;
//@property (readonly) NSString *residenceStatus;
//@property (readonly) NSString *nationality;
//@property (readonly) NSString *dob;
//@property (readonly) NSString *educated;
//@property (readonly) NSString *maritalStatus;
//@property (readonly) NSString *gender;
//@property (readonly) NSString *preferredLanguage;
//@property (readonly) NSString *familyInUAE;
//@property (readonly) NSString *familySizeUAE;
//@property (readonly) NSString *carOwnership;
//@property (readonly) NSString *carYear;
//@property (readonly) NSString *media;
//@property (readonly) NSString *favouriteCity;
//@property (readonly) NSString *domicile;
//@property (readonly) NSString *passportNo;
//@property (readonly) NSString *passportIssueDate;
//@property (readonly) NSString *passportExpDate;
//@property (readonly) NSString *passportIssuePlace;
//@property (readonly) NSString *passportIssueCountry;
//@property (readonly) NSString *immiFileNumber;
//@property (readonly) NSString *visaIssuePlace;
//@property (readonly) NSString *visaIssueDate;
//@property (readonly) NSString *visaExpDate;
//@property (readonly) NSString *drivingLicenseNo;
//@property (readonly) NSString *drivingLicenseExpDate;
//@property (readonly) NSString *laborCardNo;
//@property (readonly) NSString *laborCardExpDate;
//@property (readonly) NSString *emiratesID;
//@property (readonly) NSString *emiratesIDExpDate;
//@property (readonly) NSString *guardianName;
//@property (readonly) NSString *introName;
//@property (readonly) NSString *introAccountNo;
//@property (readonly) NSString *introCustType;
//@property (readonly) NSString *introSegment;
//@property (readonly) NSString *introIndustry;
//@property (readonly) NSString *introBusinessGroup;
//@property (readonly) NSString *introBranch;
//@property (readonly) NSString *introGeography;
//@property (readonly) NSString *introRMID;
//@property (readonly) NSString *introSSO;

/*@property (readonly) NSString *duplicateCheck;
@property (readonly) NSString *occupationType;
@property (readonly) NSString *occupation;
@property (readonly) NSString *designation;
@property (readonly) NSString *orgName;
@property (readonly) NSString *otherOrgName;
@property (readonly) NSString *joiningDate;
@property (readonly) NSNumber *monthlySalary;
@property (readonly) NSString *employeeNo;
@property (readonly) NSString *mailOption;
@property (readonly) NSString *debitCardDeliveryChnl;
@property (readonly) NSString *eStatement;
@property (readonly) NSString *email;
@property (readonly) NSString *email2;
@property (readonly) NSString *mobile;
@property (readonly) NSString *mobileSP;
@property (readonly) NSString *mobile2;*/
@property (readonly) NSString *recordFound;

@end