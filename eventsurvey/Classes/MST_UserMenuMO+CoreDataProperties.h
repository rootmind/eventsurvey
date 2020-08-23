//
//  MST_UserMenuMO+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_UserMenuMO+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_UserMenuMO (CoreDataProperties)

+ (NSFetchRequest<MST_UserMenuMO *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *assignFlag;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *menuID;
@property (nullable, nonatomic, copy) NSString *menuIDValue;
@property (nullable, nonatomic, copy) NSString *userid;

@end

NS_ASSUME_NONNULL_END
