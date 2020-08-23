//
//  UsersMO+CoreDataClass.m
//  
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//
//

#import "UsersMO+CoreDataClass.h"

@implementation UsersMO

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
