//
//  SurveyMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface SurveyMO : NSManagedObject

+ (NSFetchRequest<SurveyMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *eventID;
@property (nullable, nonatomic, copy) NSString *eventName;
@property (nullable, nonatomic, copy) NSString *instituteID;
@property (nullable, nonatomic, copy) NSString *instituteName;
@property (nullable, nonatomic, copy) NSString *surveyData;
@property (nullable, nonatomic, copy) NSString *surveyDateTime;
@property (nullable, nonatomic, copy) NSString *surveyorID;
@property (nullable, nonatomic, copy) NSString *surveyorName;
@property (nullable, nonatomic, copy) NSString *sync;


@end

NS_ASSUME_NONNULL_END

#import "SurveyMO+CoreDataProperties.h"
