//
//  MST_EventMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/14/16.
//
//

#import "MST_EventMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_EventMO (CoreDataProperties)

+ (NSFetchRequest<MST_EventMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSDate *dtExpiryDate;
@property (nullable, nonatomic, copy) NSDate *dtStartDate;
@property (nullable, nonatomic, copy) NSDate *expiryDate;
@property (nullable, nonatomic, copy) NSString *expiryDate1;
@property (nullable, nonatomic, copy) NSString *instituteID;
@property (nullable, nonatomic, copy) NSString *instituteName;
@property (nullable, nonatomic, copy) NSDate *makerDateTime;
@property (nullable, nonatomic, copy) NSString *makerID;
@property (nullable, nonatomic, copy) NSDate *modifierDateTime;
@property (nullable, nonatomic, copy) NSString *modifierID;
@property (nullable, nonatomic, copy) NSString *startDate;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *tableName;
@property (nullable, nonatomic, copy) NSString *userid;
@property (nullable, nonatomic, retain) NSData *image;
@property (nullable, nonatomic, copy) NSString *imageFound;
@property (nullable, nonatomic, copy) NSString *avatarImageFound;

@end

NS_ASSUME_NONNULL_END
