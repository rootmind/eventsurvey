//
//  SurveyMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "SurveyMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SurveyMO (CoreDataProperties)

+ (NSFetchRequest<SurveyMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *eventID;
@property (nullable, nonatomic, copy) NSString *eventName;
@property (nullable, nonatomic, copy) NSString *instituteID;
@property (nullable, nonatomic, copy) NSString *instituteName;
@property (nullable, nonatomic, copy) NSString *surveyData;
@property (nullable, nonatomic, copy) NSString *surveyDateTime;
@property (nullable, nonatomic, copy) NSString *surveyorName;
@property (nullable, nonatomic, copy) NSString *surveyorID;
@property (nullable, nonatomic, copy) NSString *sync;

@end

NS_ASSUME_NONNULL_END
