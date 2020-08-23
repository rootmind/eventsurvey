//
//  MST_EventMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 29/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface MST_EventMO : NSManagedObject
+ (NSFetchRequest<MST_EventMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userid;
@property (nullable, nonatomic, copy) NSString *tableName;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *modifierID;
@property (nullable, nonatomic, copy) NSString *modifierDateTime;
@property (nullable, nonatomic, copy) NSString *makerID;
@property (nullable, nonatomic, copy) NSString *makerDateTime;
@property (nullable, nonatomic, copy) NSString *instituteName;
@property (nullable, nonatomic, copy) NSString *instituteID;
@property (nullable, nonatomic, copy) NSDate *expiryDate;
@property (nullable, nonatomic, copy) NSString *startDate;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *code;
@property (nullable, nonatomic, copy) NSString *expiryDate1;
@property (nullable, nonatomic, copy) NSDate *dtStartDate;
@property (nullable, nonatomic, copy) NSDate *dtExpiryDate;
@property (nullable, nonatomic, copy) NSData *image;
@property (nullable, nonatomic, copy) NSString *imageFound;
@property (nullable, nonatomic, copy) NSString *avatarImageFound;


@end

NS_ASSUME_NONNULL_END

#import "MST_EventMO+CoreDataProperties.h"
