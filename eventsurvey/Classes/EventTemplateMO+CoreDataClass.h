//
//  EventTemplateMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 21/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface EventTemplateMO : NSManagedObject



@property (nullable, nonatomic, retain) NSString *seqNo;
@property (nullable, nonatomic, retain) NSString *eventRefNo;
@property (nullable, nonatomic, retain) NSString *eventID;
@property (nullable, nonatomic, retain) NSString *labelName;
@property (nullable, nonatomic, retain) NSString *component;
@property (nullable, nonatomic, retain) NSString *viewOrder;
@property (nullable, nonatomic, retain) NSString *mandatory;
@property (nullable, nonatomic, retain) NSString *fieldName;
@property (nullable, nonatomic, retain) NSString *status;
@property (nullable, nonatomic, retain) NSString *listTableName;
@property (nullable, nonatomic, retain) NSString *maxLength;
@property (nullable, nonatomic, retain) NSString *pageNo;
@property (nullable, nonatomic, retain) NSString *makerID;
@property (nullable, nonatomic, retain) NSDate *makerDateTime;
@property (nullable, nonatomic, retain) NSString *modifierID;
@property (nullable, nonatomic, retain) NSDate *modifierDateTime;


@end

NS_ASSUME_NONNULL_END

#import "EventTemplateMO+CoreDataProperties.h"
