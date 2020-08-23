//
//  Users+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "Users+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *lastLoginDate;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *password;
@property (nullable, nonatomic, copy) NSString *sessionid;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *userGroup;
@property (nullable, nonatomic, copy) NSString *userid;

@end

NS_ASSUME_NONNULL_END
