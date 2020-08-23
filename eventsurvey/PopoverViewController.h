//
//  PopoverViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/17/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopoverData.h"
#import "CoreDataController.h"
#import "MST_ListMasterMO+CoreDataClass.h"


@class PopoverViewController;

@protocol PopoverViewControllerDelegate <NSObject>

- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item didFinishEnteringItem1:(NSString *)item1 didFinishEnteringItem2:(int)item1;

@end


@interface PopoverViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating,UISplitViewControllerDelegate, NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *dateField;
@property (strong, nonatomic) NSString *dateRange;
@property (strong, nonatomic) NSString *dateFormat;
@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSMutableArray *popoverArray;




@property (strong,nonatomic) UITableView *tableView;
//@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) NSString *actionCode;
@property (strong, nonatomic) NSIndexPath* checkedIndexPath;
@property (nonatomic) int fieldTag;
@property (nonatomic, strong) id <PopoverViewControllerDelegate> delegate;

@property (strong, nonatomic) PopoverData *popoverData;
@property (strong, nonatomic) NSString *tableName;
@property (strong, nonatomic) NSString *filter;

//@property (strong, nonatomic) UISearchBar *searchBar;


@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSMutableArray *listMasterDataArray;
@property (strong, nonatomic) MST_ListMasterMO *listMasterMO;

@property (strong, nonatomic) NSArray *sortedResults;
@property (strong, nonatomic) NSString *multiSelect;


@end
