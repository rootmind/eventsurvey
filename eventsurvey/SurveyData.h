//
//  SurveyData.h
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 11/11/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#ifndef SurveyData_h
#define SurveyData_h


#endif /* SurveyData_h */

#import <UIKit/UIKit.h>

@interface SurveyData : NSObject

- (id)initWithJSONDictionary:(NSDictionary *)jsonDictionary;

@property (readonly) NSString *eventID;
@property (readonly) NSString *sync;
@property (readonly) NSString *instituteID;
@property (readonly) NSString *surveyorID;
@property (readonly) NSString *surveyData;
@property (readonly) NSString *eventName;
@property (readonly) NSString *surveyorName;
@property (readonly) NSString *surveyDataTime;
@property (readonly) NSString *instituteName;
@property (readonly) NSString *recordFound;

@end
