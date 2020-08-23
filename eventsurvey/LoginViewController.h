//
//  ViewController.h
//  finnoneprod
//
//  Created by Sai Kiran Gandham on 11/1/14.
//  Copyright (c) 2014 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsersData.h"
#import "QueueViewController.h"
#import "CoreDataController.h"
#import "Classes/UserAuditMO+CoreDataProperties.h"


@interface LoginViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate, UITextFieldDelegate,UISplitViewControllerDelegate,NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblUserid;
@property (strong, nonatomic) IBOutlet UILabel *lblPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtUserid;
@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnLogin;
//@property (strong, nonatomic) IBOutlet UILabel *lblMessage;

@property (strong, nonatomic) NSString *userid;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *sessionid;
@property (strong, nonatomic) NSString *userGroup;

@property (strong, nonatomic) NSString *menuId;


//@property (strong, nonatomic) NSDictionary *dataDictionary;
@property (strong, nonatomic) NSString *lastLoginDate;
@property (strong, nonatomic) NSString *deviceToken;
@property (strong, nonatomic) NSMutableArray *newsArray;
@property (strong, nonatomic) NSMutableArray *newsDateArray;





@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIPageControl * pageControl;
@property (assign, nonatomic) NSInteger *indexNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblScroll;
@property (nonatomic) BOOL pageControlBeingUsed;
@property (nonatomic, strong) UIImage *pageImage;

//@property (strong,nonatomic) UIActivityIndicatorView *activityIndicator;
//@property (strong,nonatomic) UILabel *lblLoading;

@property (strong, nonatomic) NSMutableArray *usersArray;
@property (strong, nonatomic) UsersData *users;



@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSMutableArray *eventDataArray;

@property (strong, nonatomic) NSArray *resultsEvent;



- (void)setupScrollView:(UIScrollView*)scrMain ;

@end

