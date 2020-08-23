//
//  Users+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "Users+CoreDataProperties.h"

@implementation Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest {
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
