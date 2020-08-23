//
//  UserAuditMO+CoreDataProperties.m
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "UserAuditMO+CoreDataProperties.h"

@implementation UserAuditMO (CoreDataProperties)

+ (NSFetchRequest<UserAuditMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"UserAudit"];
}

@dynamic loginDateTime;
@dynamic userid;

@end
