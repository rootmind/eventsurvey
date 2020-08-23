//
//  Survey+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "Survey+CoreDataProperties.h"

@implementation Survey (CoreDataProperties)

+ (NSFetchRequest<Survey *> *)fetchRequest {
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
