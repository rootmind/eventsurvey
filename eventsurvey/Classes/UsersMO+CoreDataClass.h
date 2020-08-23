//
//  UsersMO+CoreDataClass.h
//  
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface UsersMO : NSManagedObject

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

#import "UsersMO+CoreDataProperties.h"
