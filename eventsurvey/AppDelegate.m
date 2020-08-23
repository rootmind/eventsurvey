//
//  AppDelegate.m
//  eventsurvey
//
//  Created by Sai Kiran Gandham on 10/7/16.
//  Copyright © 2016 Rootmind TechSoft Private Limited. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "UIColor+Constants.h"
//#import "QueueViewController.h"

//#import "MasterViewController.h"
//#import "DetailViewController.h"
//#import "DashboardViewController.h"
//#import "SearchViewController.h"
//@import Firebase;

@interface AppDelegate ()

#ifndef NSFoundationVersionNumber_iOS_9_x_Max
#define NSFoundationVersionNumber_iOS_9_x_Max 1299
#endif


@end

@implementation AppDelegate


//@synthesize tabBar;
//@synthesize detailTabBar;



LoginViewController *loginViewController;
//QueueViewController *queueViewController;

//MasterViewController* masterViewController;
//DetailViewController* detailViewController;
//SearchViewController* searvhViewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
     NSLog(@"root %@" , self.window.rootViewController.description);
    
    
    //---initialize Core Data Controller
    [CoreDataController sharedCoreDataController];

    
    //self.tabBar=[[UITabBarController alloc]init];
    
   LoginViewController *loginViewController=[[LoginViewController alloc]initWithNibName:nil bundle:nil];
   loginViewController.title=@"Login";
    
    loginViewController.tabBarItem.image=[[UIImage imageNamed:@"home-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  
    UINavigationController *loginNavigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
//
//    QueueViewController *queueViewController=[[QueueViewController alloc]initWithNibName:nil bundle:nil];
//    queueViewController.title=@"Status";
//    
//    queueViewController.tabBarItem.image=[[UIImage imageNamed:@"home-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    UINavigationController *queueNavigationController = [[UINavigationController alloc] initWithRootViewController:queueViewController];
    
    
  
  
    
    
    [[UITabBar appearance] setTintColor:[UIColor blueColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [loginNavigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    //[queueNavigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userName"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sessionid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userGroup"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastLoginDate"];
    
    //loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
    
    //UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor strongAzureColor]];//[UIColor navyBlueColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    
    //self.tabBar.viewControllers=[NSArray arrayWithObjects:loginViewController,queueViewController, nil];

    //[navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = loginNavigationController;
    [self.window makeKeyAndVisible];
    
    
// 
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    [[UINavigationBar appearance] setBarTintColor:[UIColor navigatorColor ]];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//    //--------
//    UIButton *logoView = [[UIButton alloc] initWithFrame:CGRectMake((loginNavigationController.navigationBar.frame.size.width-100)/2,0,100,40)];
//    [logoView setBackgroundImage:[UIImage imageNamed:@"Mashreq_logo1.png"] forState:UIControlStateNormal];
//    [logoView setUserInteractionEnabled:NO];
//    [loginNavigationController.navigationBar addSubview:logoView];
//

// 
//    
////    UISplitViewController* splitVC = [[UISplitViewController alloc] init];
////    splitVC.viewControllers = [NSArray arrayWithObjects:loginNavigationController, nil];
//    
//    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController=self.tabBar;
//    
//    [self.window makeKeyAndVisible];
//    
//
//    
////    masterViewController = [[MasterViewController alloc] init];
////    detailViewController = [[DetailViewController alloc] init];
////    
////    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
////    
////    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
////
////    
////    UISplitViewController* splitViewController = [[UISplitViewController alloc] init];
////    splitViewController.viewControllers = [NSArray arrayWithObjects:masterNavigationController, detailNavigationController, nil];
////    
////    
////
////    
////    
////    splitViewController.delegate=detailViewController;
////    
////    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
////    self.window.rootViewController = splitViewController;
////    [self.window makeKeyAndVisible];
////
    
    
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sessionid"];
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userGroup"];
//    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastLoginDate"];
//
//    self.tabBar=[[UITabBarController alloc]initWithNibName:nil bundle:nil];
//    self.detailTabBar=[[UITabBarController alloc]initWithNibName:nil bundle:nil];
//    
//    masterViewController = [[MasterViewController alloc]initWithNibName:nil bundle:nil];
//    detailViewController = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
//    loginViewController = [[LoginViewController alloc]initWithNibName:nil bundle:nil];
//    
//    masterViewController.title=@"Home";
//    masterViewController.tabBarItem.image=[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    
//    //detailViewController.title=@"Home";
//    //detailViewController.tabBarItem.image=[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    
//    
//    //loginViewController.title=@"Login";
//    //loginViewController.tabBarItem.image=[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    
//    UINavigationController *masterNavigationController = [[UINavigationController alloc] initWithRootViewController:masterViewController];
//    
//    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
//    
//   
//    
//    
//
//    
//    //masterNavigationController.navigationBar.barTintColor=[UIColor navigatorColor];
//    //detailNavigationController.navigationBar.barTintColor=[UIColor navigatorColor];
//    
//    
//    UIButton *logoView = [[UIButton alloc] initWithFrame:CGRectMake((masterNavigationController.navigationBar.frame.size.width-40)/2,0,40,40)];
//    [logoView setBackgroundImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateNormal];//imageNamed:@"Mashreq-icon-40.png"] forState:UIControlStateNormal];
//    [logoView setUserInteractionEnabled:NO];
//    logoView.layer.cornerRadius=10;
//    logoView.clipsToBounds=YES;
//    [masterNavigationController.navigationBar addSubview:logoView];
//    
//    
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    //20-Jun-2016
//    //16-JUL-2016
//    [[UINavigationBar appearance] setBarTintColor:[UIColor strongAzureColor]];//[UIColor navyBlueColor]];
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
//
//    
//
//    
//    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
//    //20-Jun-2016
//    //16-JUL-2016
//    [[UITabBar appearance] setBarTintColor:[UIColor strongAzureColor]];//[UIColor navyBlueColor]];
//    
//    
////    masterNavigationController.tabBarController.tabBar.tintColor=[UIColor navigatorColor];
////    detailNavigationController.tabBarController.tabBar.barTintColor=[UIColor whiteColor];
//    
//    
//    [masterNavigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
//    [detailNavigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
//    
//    
//    
//    
//    masterNavigationController.viewControllers=[NSArray arrayWithObjects:masterViewController, nil];
//    detailNavigationController.viewControllers=[NSArray arrayWithObjects:loginViewController,  nil];
//    
//    tabBar.viewControllers=[NSArray arrayWithObjects:masterNavigationController, nil];
//    
//    detailTabBar.viewControllers=[NSArray arrayWithObjects:detailNavigationController,nil];
//    
//    UISplitViewController* splitViewController = [[UISplitViewController alloc]initWithNibName:nil bundle:nil];
//    splitViewController.viewControllers = [NSArray arrayWithObjects:tabBar, detailTabBar, nil];
//    
//    splitViewController.delegate=detailViewController;
//    splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
//    splitViewController.presentsWithGesture=NO;
//    
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.rootViewController = splitViewController;
//    [self.window makeKeyAndVisible];


    //--------Firebase------//
    // Use Firebase library to configure APIs
    //[FIRApp configure];
    
    

//    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
//      UIUserNotificationType allNotificationTypes =
//      (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
//      UIUserNotificationSettings *settings =
//      [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
//      [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
//    } else {
//      // iOS 10 or later
//      #if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
//      UNAuthorizationOptions authOptions =
//          UNAuthorizationOptionAlert
//          | UNAuthorizationOptionSound
//          | UNAuthorizationOptionBadge;
//      [[UNUserNotificationCenter currentNotificationCenter]
//          requestAuthorizationWithOptions:authOptions
//          completionHandler:^(BOOL granted, NSError * _Nullable error) {
//          }
//       ];
//
//      // For iOS 10 display notification (sent via APNS)
//      [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
//      // For iOS 10 data message (sent via FCM)
//      [[FIRMessaging messaging] setRemoteMessageDelegate:self];
//      #endif
//    }
//
//    [[UIApplication sharedApplication] registerForRemoteNotifications];


    //-----------------end of firebase----//
    
   
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
  //[[FIRMessaging messaging] disconnect];
  NSLog(@"Disconnected from FCM");
  
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    //[self saveContext];
}

//#pragma mark - Core Data stack
//
//@synthesize managedObjectContext = _managedObjectContext;
//@synthesize managedObjectModel = _managedObjectModel;
//@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//
//- (NSURL *)applicationDocumentsDirectory {
//    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.rootmind.eventsurvey" in the application's documents directory.
//    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
//}
//
//- (NSManagedObjectModel *)managedObjectModel {
//    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
//    if (_managedObjectModel != nil) {
//        return _managedObjectModel;
//    }
//    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"eventsurvey" withExtension:@"momd"];
//    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
//    return _managedObjectModel;
//}
//
//- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
//    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
//    if (_persistentStoreCoordinator != nil) {
//        return _persistentStoreCoordinator;
//    }
//    
//    // Create the coordinator and store
//    
//    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
//    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"eventsurvey.sqlite"];
//    NSError *error = nil;
//    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
//    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
//        // Report any error we got.
//        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
//        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
//        dict[NSUnderlyingErrorKey] = error;
//        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
//        // Replace this with code to handle the error appropriately.
//        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//        abort();
//    }
//    
//    return _persistentStoreCoordinator;
//}
//
//
//- (NSManagedObjectContext *)managedObjectContext {
//    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
//    if (_managedObjectContext != nil) {
//        return _managedObjectContext;
//    }
//    
//    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
//    if (!coordinator) {
//        return nil;
//    }
//    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
//    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
//    return _managedObjectContext;
//}
//
//#pragma mark - Core Data Saving support
//
//- (void)saveContext {
//    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
//    if (managedObjectContext != nil) {
//        NSError *error = nil;
//        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
//            // Replace this implementation with code to handle the error appropriately.
//            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
//            abort();
//        }
//    }
//}


#pragma mark - Split view

//- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
//    if ([secondaryViewController isKindOfClass:[UINavigationController class]] && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]] && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
//        // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//        return YES;
//    } else {
//        return NO;
//    }
//}


//- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    return UIInterfaceOrientationMaskAll;
//}


- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken
{
    NSLog(@"My token is: %@", deviceToken);
    
    NSString *devToken = [[deviceToken description] stringByTrimmingCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    devToken = [devToken stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"My Device token is ---%@", devToken);
    
    [[NSUserDefaults standardUserDefaults] setObject:devToken forKey:@"deviceToken"];
    
    //NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    
    //[[FIRInstanceID instanceID] setAPNSToken:deviceToken type:FIRInstanceIDAPNSTokenTypeSandbox];
    
}


- (void)tokenRefreshNotification:(NSNotification *)notification {
  // Note that this callback will be fired everytime a new token is generated, including the first
  // time. So if you need to retrieve the token as soon as it is available this is where that
  // should be done.
  //NSString *refreshedToken = [[FIRInstanceID instanceID] token];
  //NSLog(@"InstanceID token: %@", refreshedToken);

  // Connect to FCM since connection may have failed when attempted before having a token.
  //[self connectToFcm];

  // TODO: If necessary send token to application server.
}

//// With "FirebaseAppDelegateProxyEnabled": NO
//- (void)application:(UIApplication *)application
//    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
//             [FIRInstanceID instanceID] setAPNSToken:deviceToken
//                                                type:FIRInstanceIDAPNSTokenTypeSandbox];
//}

//- (void)connectToFcm {
//  [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
//    if (error != nil) {
//      NSLog(@"Unable to connect to FCM. %@", error);
//    } else {
//      NSLog(@"Connected to FCM.");
//    }
//  }];
//}

//- (void)applicationDidEnterBackground:(UIApplication *)application {
//  [[FIRMessaging messaging] disconnect];
//  NSLog(@"Disconnected from FCM");
//}



@end
