//
//  MST_UserMenu+CoreDataProperties.h
//  
//
//  Created by Sai Kiran Gandham on 11/5/16.
//
//

#import "MST_UserMenu+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface MST_UserMenu (CoreDataProperties)

+ (NSFetchRequest<MST_UserMenu *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *assignFlag;
@property (nullable, nonatomic, copy) NSString *desc;
@property (nullable, nonatomic, copy) NSString *menuID;
@property (nullable, nonatomic, copy) NSString *menuIDValue;
@property (nullable, nonatomic, copy) NSString *userid;

@end

NS_ASSUME_NONNULL_END
