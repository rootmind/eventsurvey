//
//  EventTemplateMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/11/16.
//
//

#import "EventTemplateMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface EventTemplateMO (CoreDataProperties)

+ (NSFetchRequest<EventTemplateMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *component;
@property (nullable, nonatomic, copy) NSString *eventID;
@property (nullable, nonatomic, copy) NSString *eventRefNo;
@property (nullable, nonatomic, copy) NSString *fieldName;
@property (nullable, nonatomic, copy) NSString *labelName;
@property (nullable, nonatomic, copy) NSString *listTableName;
@property (nullable, nonatomic, copy) NSString *makerDateTime;
@property (nullable, nonatomic, copy) NSString *makerID;
@property (nullable, nonatomic, copy) NSString *mandatory;
@property (nullable, nonatomic, copy) NSString *modifierDateTime;
@property (nullable, nonatomic, copy) NSString *modifierID;
@property (nullable, nonatomic, copy) NSString *seqNo;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *viewOrder;
@property (nullable, nonatomic, copy) NSString *maxLength;
@property (nullable, nonatomic, copy) NSString *pageNo;

@end

NS_ASSUME_NONNULL_END
