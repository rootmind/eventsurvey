//
//  IdentificationData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 11/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//



#import "IdentificationData.h"

@implementation IdentificationData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
     
                _refNo = [jsonDictionary objectForKey:@"refNo"];
//                _passportNo = [jsonDictionary objectForKey:@"passportNo"];
//                _passportIssueDate = [jsonDictionary objectForKey:@"passportIssueDate"];
//                _passportExpDate = [jsonDictionary objectForKey:@"passportExpDate"];
//                _passportIssuePlace = [jsonDictionary objectForKey:@"passportIssuePlace"];
//                _passportIssueCountry= [jsonDictionary objectForKey:@"passportIssueCountry"];
//                _emiratesID = [jsonDictionary objectForKey:@"emiratesID"];
//                _emiratesIDExpDate = [jsonDictionary objectForKey:@"emiratesIDExpDate"];
//                _passportIssueCountryValue= [jsonDictionary objectForKey:@"passportIssueCountryValue"];
        
                _immiFileNumber= [jsonDictionary objectForKey:@"immiFileNumber"];
                _visaIssuePlace= [jsonDictionary objectForKey:@"visaIssuePlace"];
                _visaIssueDate= [jsonDictionary objectForKey:@"visaIssueDate"];
                _visaExpDate= [jsonDictionary objectForKey:@"visaExpDate"];
                _drivingLicenseNo= [jsonDictionary objectForKey:@"drivingLicenseNo"];
                _drivingLicenseExpDate= [jsonDictionary objectForKey:@"drivingLicenseExpDate"];
                _labourCardNo = [jsonDictionary objectForKey:@"labourCardNo"];
                _labourCardExpDate = [jsonDictionary objectForKey:@"labourCardExpDate"];
        
                _motherMaidenName = [jsonDictionary objectForKey:@"motherMaidenName"];
                _segment = [jsonDictionary objectForKey:@"segment"];
                _preferredLanguage = [jsonDictionary objectForKey:@"preferredLanguage"];
                _familyInUAE = [jsonDictionary objectForKey:@"familyInUAE"];
                _familySizeUAE = [jsonDictionary objectForKey:@"familySizeUAE"];
                _carOwnership = [jsonDictionary objectForKey:@"carOwnership"];
                _carYear = [jsonDictionary objectForKey:@"carYear"];
                _media =[jsonDictionary objectForKey:@"media"];
                _favouriteCity =[jsonDictionary objectForKey:@"favouriteCity"];
                _domicile =[jsonDictionary objectForKey:@"domicile"];
                _preferredLanguageValue = [jsonDictionary objectForKey:@"preferredLanguageValue"];
                _familyInUAEValue=[jsonDictionary objectForKey:@"familyInUAEValue"];
                _familySizeUAEValue = [jsonDictionary objectForKey:@"familySizeUAEValue"];
                _carOwnershipValue=[jsonDictionary objectForKey:@"carOwnershipValue"];
                _mediaValue =[jsonDictionary objectForKey:@"mediaValue"];
                _favouriteCityValue=[jsonDictionary objectForKey:@"favouriteCityValue"];
                 _segmentValue = [jsonDictionary objectForKey:@"segmentValue"];
                _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
                _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
        
                
        
    }
    
    return self;
}

@end

