//
//  UserAudit+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "UserAudit+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserAudit (CoreDataProperties)

+ (NSFetchRequest<UserAudit *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *loginDateTime;
@property (nullable, nonatomic, copy) NSString *userid;

@end

NS_ASSUME_NONNULL_END
