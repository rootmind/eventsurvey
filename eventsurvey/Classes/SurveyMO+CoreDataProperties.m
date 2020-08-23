//
//  SurveyMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "SurveyMO+CoreDataProperties.h"

@implementation SurveyMO (CoreDataProperties)

+ (NSFetchRequest<SurveyMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Survey"];
}

@dynamic eventID;
@dynamic eventName;
@dynamic instituteID;
@dynamic instituteName;
@dynamic surveyData;
@dynamic surveyDateTime;
@dynamic surveyorName;
@dynamic surveyorID;
@dynamic sync;

@end
