//
//  UsersMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "UsersMO+CoreDataProperties.h"

@implementation UsersMO (CoreDataProperties)

+ (NSFetchRequest<UsersMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Users"];
}

@dynamic lastLoginDate;
@dynamic name;
@dynamic password;
@dynamic sessionid;
@dynamic status;
@dynamic userGroup;
@dynamic userid;

@end
