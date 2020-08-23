//
//  UsersMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "UsersMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UsersMO (CoreDataProperties)

+ (NSFetchRequest<UsersMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *lastLoginDate;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *sessionid;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *userGroup;
@property (nullable, nonatomic, copy) NSString *userid;

@end

NS_ASSUME_NONNULL_END
