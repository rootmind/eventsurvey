//
//  AddressData.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//



#import "AddressData.h"

@implementation AddressData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        
        // Assign all properties with keyed values from the dictionary
        
        _refNo = [jsonDictionary objectForKey:@"refNo"];
        
        _department= [jsonDictionary objectForKey:@"department"];
        _offStreetName= [jsonDictionary objectForKey:@"offStreetName"];
        _offBuildingName= [jsonDictionary objectForKey:@"offBuildingName"];
        _offNearestLandmark= [jsonDictionary objectForKey:@"offNearestLandmark"];
        _offFlatNo= [jsonDictionary objectForKey:@"offFlatNo"];
        _offPOBox= [jsonDictionary objectForKey:@"offPOBox"];
        _offEmirate= [jsonDictionary objectForKey:@"offEmirate"];
        _offTelephone= [jsonDictionary objectForKey:@"offTelephone"];
        _offExtension= [jsonDictionary objectForKey:@"offExtension"];
        _offFax= [jsonDictionary objectForKey:@"offFax"];
        
        _resStreetName= [jsonDictionary objectForKey:@"resStreetName"];
        _resBuildingName= [jsonDictionary objectForKey:@"resBuildingName"];
        _resNearestLandmark= [jsonDictionary objectForKey:@"resNearestLandmark"];
        _resFlatNo= [jsonDictionary objectForKey:@"resFlatNo"];
        _resPOBox= [jsonDictionary objectForKey:@"resPOBox"];
        _resEmirate= [jsonDictionary objectForKey:@"resEmirate"];
        _resTelephone= [jsonDictionary objectForKey:@"resTelephone"];
        _resType= [jsonDictionary objectForKey:@"resType"];
        
        _homeCountry= [jsonDictionary objectForKey:@"homeCountry"];
        _homeCity= [jsonDictionary objectForKey:@"homeCity"];
        _homeMobile= [jsonDictionary objectForKey:@"homeMobile"];
        _homeTelephone= [jsonDictionary objectForKey:@"homeTelephone"];
        _homeAddress1= [jsonDictionary objectForKey:@"homeAddress1"];
        _homeAddress2= [jsonDictionary objectForKey:@"homeAddress2"];
        _homeAddress3= [jsonDictionary objectForKey:@"homeAddress3"];
        _recordStatus = [jsonDictionary objectForKey:@"recordStatus"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
        
        _homeCountryValue = [jsonDictionary objectForKey:@"homeCountryValue"];
        _offEmirateValue= [jsonDictionary objectForKey:@"offEmirateValue"];
        _resEmirateValue= [jsonDictionary objectForKey:@"resEmirateValue"];
        
        
    }
    
    return self;
}

@end


