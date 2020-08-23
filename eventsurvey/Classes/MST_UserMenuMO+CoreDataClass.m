//
//  MST_UserMenuMO+CoreDataClass.m
//  
//
//  Created by Rootmind TechSoft Private Limited on 31/10/16.
//
//

#import "MST_UserMenuMO+CoreDataClass.h"

@implementation MST_UserMenuMO


+ (NSFetchRequest<MST_UserMenuMO *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"MST_UserMenu"];
}

@dynamic assignFlag;
@dynamic desc;
@dynamic menuID;
@dynamic menuIDValue;
@dynamic userid;


@end
