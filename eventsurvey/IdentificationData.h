//
//  IdentificationData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface IdentificationData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;

//@property (readonly) NSString *passportNo;
//@property (readonly) NSString *passportIssueDate;
//@property (readonly) NSString *passportExpDate;
//@property (readonly) NSString *passportIssuePlace;
//@property (readonly) NSString *passportIssueCountry;
//@property (readonly) NSString *emiratesID;
//@property (readonly) NSString *emiratesIDExpDate;
//@property (readonly) NSString *passportIssueCountryValue;

@property (readonly) NSString *immiFileNumber;
@property (readonly) NSString *visaIssuePlace;
@property (readonly) NSString *visaIssueDate;
@property (readonly) NSString *visaExpDate;

@property (readonly) NSString *drivingLicenseNo;
@property (readonly) NSString *drivingLicenseExpDate;
@property (readonly) NSString *labourCardNo;
@property (readonly) NSString *labourCardExpDate;

@property (readonly) NSString *motherMaidenName;
@property (readonly) NSString *segment;
@property (readonly) NSString *preferredLanguage;
@property (readonly) NSString *familyInUAE;
@property (readonly) NSString *familySizeUAE;
@property (readonly) NSString *carOwnership;
@property (readonly) NSString *carYear;
@property (readonly) NSString *media;
@property (readonly) NSString *favouriteCity;
@property (readonly) NSString *domicile;

@property (readonly) NSString *preferredLanguageValue;
@property (readonly) NSString *familyInUAEValue;
@property (readonly) NSString *familySizeUAEValue;
@property (readonly) NSString *carOwnershipValue;
@property (readonly) NSString *mediaValue;
@property (readonly) NSString *favouriteCityValue;
@property (readonly) NSString *segmentValue;


@property (readonly) NSString *recordStatus;
@property (readonly) NSString *recordFound;






@end