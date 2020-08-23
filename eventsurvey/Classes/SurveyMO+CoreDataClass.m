//
//  SurveyMO+CoreDataClass.m
//  
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//
//

#import "SurveyMO+CoreDataClass.h"

@implementation SurveyMO

+ (NSFetchRequest<SurveyMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Survey"];
}

@dynamic eventID;
@dynamic eventName;
@dynamic instituteID;
@dynamic instituteName;
@dynamic surveyData;
@dynamic surveyDateTime;
@dynamic surveyorID;
@dynamic surveyorName;
@dynamic sync;


@end
