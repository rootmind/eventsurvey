//
//  AddressData.h
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface AddressData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *refNo;
@property (readonly) NSString *department;
@property (readonly) NSString *offStreetName;
@property (readonly) NSString *offBuildingName;
@property (readonly) NSString *offNearestLandmark;
@property (readonly) NSString *offFlatNo;
@property (readonly) NSString *offPOBox;
@property (readonly) NSString *offEmirate;
@property (readonly) NSString *offTelephone;
@property (readonly) NSString *offExtension;
@property (readonly) NSString *offFax;

@property (readonly) NSString *resStreetName;
@property (readonly) NSString *resBuildingName;
@property (readonly) NSString *resNearestLandmark;
@property (readonly) NSString *resFlatNo;
@property (readonly) NSString *resPOBox;
@property (readonly) NSString *resEmirate;
@property (readonly) NSString *resTelephone;
@property (readonly) NSString *resType;

@property (readonly) NSString *homeCountry;
@property (readonly) NSString *homeCity;
@property (readonly) NSString *homeMobile;
@property (readonly) NSString *homeTelephone;
@property (readonly) NSString *homeAddress1;
@property (readonly) NSString *homeAddress2;
@property (readonly) NSString *homeAddress3;
@property (readonly) NSString *recordFound;

@property (readonly) NSString *recordStatus;

@property (readonly) NSString *homeCountryValue;

@property (readonly) NSString *offEmirateValue;
@property (readonly) NSString *resEmirateValue;


@end