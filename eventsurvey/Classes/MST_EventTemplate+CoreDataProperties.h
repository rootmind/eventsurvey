//
//  MST_EventTemplate+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_EventTemplate+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_EventTemplate (CoreDataProperties)

+ (NSFetchRequest<MST_EventTemplate *> *)fetchRequest;

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

@end

NS_ASSUME_NONNULL_END
