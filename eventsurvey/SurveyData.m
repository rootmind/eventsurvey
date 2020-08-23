//
//  SurveyData.m
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 11/11/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SurveyData.h"

@implementation SurveyData

// Init the object with information from a dictionary
- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary {
    if(self = [self init]) {
        // Assign all properties with keyed values from the dictionary
        _eventID = [jsonDictionary objectForKey:@"eventID"];
        _sync = [jsonDictionary objectForKey:@"sync"];
        _instituteID = [jsonDictionary objectForKey:@"instituteID"];
        _surveyorID = [jsonDictionary objectForKey:@"surveyorID"];
        _surveyData = [jsonDictionary objectForKey:@"surveyData"];
        _eventName = [jsonDictionary objectForKey:@"eventName"];
        _surveyorName = [jsonDictionary objectForKey:@"surveyorName"];
        _surveyDataTime = [jsonDictionary objectForKey:@"surveyDataTime"];
        _instituteName = [jsonDictionary objectForKey:@"instituteName"];
        _recordFound = [jsonDictionary objectForKey:@"recordFound"];
        
    }
    
    return self;
}

@end
