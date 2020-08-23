//
//  MST_ListMasterMO+CoreDataClass.m
//  
//
//  Created by Rootmind TechSoft Private Limited on 22/10/16.
//
//

#import "MST_ListMasterMO+CoreDataClass.h"

@implementation MST_ListMasterMO
+ (NSFetchRequest<MST_ListMasterMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_ListMaster"];
}

@dynamic tableName;
@dynamic sync;
@dynamic desc;
@dynamic code;

@end
