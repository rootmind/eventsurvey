//
//  ImagePageChildViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 10/28/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "ImagePageChildViewController.h"



@interface ImagePageChildViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red





@implementation ImagePageChildViewController


//@synthesize screenNumber;
@synthesize actionMode;

@synthesize menuName;

@synthesize dataDictionary;

@synthesize dataArray;


@synthesize refNo;
@synthesize cifNumber;

@synthesize docID;
@synthesize popoverCodeValue;

@synthesize  imageArray;
@synthesize  imageData;


//@synthesize  imageFileArray;
//@synthesize  imageFileData;

@synthesize imageView;
@synthesize recordStatus;

@synthesize imageFileName;
@synthesize imageFileFolder;
@synthesize imageId;
@synthesize pageCount;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
    //self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    //    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
    //    [self.splitViewController.displayModeButtonItem action];
    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Image Upload"];
    self.navigationItem.title=@"Image Upload";

    
    
    [CommonUtils loadActivityIndicator:self];
    
//    //---initialize during load
//    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    [self doValidate];
    
    imageView = [[UIImageView alloc]init];
    imageView.layer.borderWidth=1.0;
    imageView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    imageView.layer.shadowRadius=10.0;
    imageView.backgroundColor = [UIColor whiteColor];
    imageView.layer.shadowOffset = CGSizeMake(0, 3);
    imageView.layer.shadowRadius = 10.0;
    imageView.layer.shadowColor = [UIColor blackColor].CGColor;
    imageView.layer.shadowOpacity = 0.8;
    imageView.layer.cornerRadius = 15.0;
    imageView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:imageView];
    
    //------image view
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
//    
//    CommonLabel *lblSeleDoc=[[CommonLabel alloc]initWithFrame:CGRectZero];
//    lblSeleDoc.text=@"Select Document";
//    lblSeleDoc.font = [UIFont systemFontOfSize:14];
//    lblSeleDoc.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:lblSeleDoc];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.8 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.15 constant:0]];
//    
//    
//    docID= [[CommonTextField alloc] init];
//    docID.tag=1;
//    docID.delegate=self;
//    docID.placeholder=@"Select Document ID";
//    docID.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:docID];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
//    


    


    
    
//    UIPageControl *pgCtr = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 264, self.view.frame.size.width, self.view.frame.size.width/1.5)];
//    [pgCtr setTag:12];
//    pgCtr.numberOfPages=pageCount;
//    pgCtr.autoresizingMask=UIViewAutoresizingNone;
//    pgCtr.pageIndicatorTintColor=[UIColor grayColor];
//    pgCtr.currentPageIndicatorTintColor=[UIColor blueColor];
//    pgCtr.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:pgCtr];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.8 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:pgCtr attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    
//    screenNumber = [[UILabel alloc] init];//WithFrame:headerView.frame];
//    screenNumber.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:50];//[UIFont systemFontOfSize:64.0f];
//    screenNumber.textAlignment =  NSTextAlignmentLeft;
//    screenNumber.textColor = [UIColor blackColor];
//    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
//    //lblCustomerNumber.layer.borderWidth = 1.0;
//    screenNumber.text=[NSString stringWithFormat:@"%@",@"10"];
//    screenNumber.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:screenNumber];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//
//    
//    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    
    
    CommonLabel *lblSeleDoc=[[CommonLabel alloc]initWithFrame:CGRectZero];
    lblSeleDoc.text=@"Document";
    lblSeleDoc.font = [UIFont systemFontOfSize:14];
    lblSeleDoc.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblSeleDoc];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSeleDoc  attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.15 constant:0]];

    
    docID= [[UITextField alloc] init];
    docID.tag=1;
    docID.enabled=false;
    docID.delegate=self;
    //docID.placeholder=@"Select Document";
    docID.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:docID];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.24 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:docID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.04 constant:0]];
    
    
   

    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
    
    
    [CommonUtils loadActivityIndicator:self];
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    [self buildJSON];
    
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}


- (void) buildJSON {
    
    
    
    
    
    
    @try{
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        

        
        //---------------
        

        
               //-------
        
        
//        NSDictionary *jsonDictionary = @{@"refNo": emptyStringIfNil(self.refNo),
//                                         @"imageStatus":emptyStringIfNil(@"ACTIVE")
//                                         };
        
        
//        //NSString *jsonString = [container JSONRepresentation];
//        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
//        
//        
//
//        NSData *newData=[CommonUtils connectHost :@"fetchImageFileNames" :jsonDictionary:self];
//        [self parseResponse:newData:@"fetchImageFileNames":@"imageDetailsWrapper"];
        
        
//        if([imageFileArray count]>0)
//        {
            //imageFileData=[imageFileArray objectAtIndex:0];
        
            NSDictionary *jsonDictionary = @{@"refNo":emptyStringIfNil(self.refNo),
                                             @"imageFileName":imageFileName,
                                             @"imageFileFolder":imageFileFolder,
                                             @"imageId":imageId
                                             };
            
            
            //NSString *jsonString = [container JSONRepresentation];
            NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
            
            //NSData *newData=
        
         [CommonUtils loadActivityIndicator:self];
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
            
            [self connectHost :@"fetchImageDetails" :jsonDictionary:self];
        
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        //}
        
        
       
                                       
                                       

        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        
        NSLog(@"finally in buildJSON Code");
    }
    
}




//- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"get validate user ");
//        
//        
//        
//        NSString *myData = [[NSString alloc] initWithData:data
//                                                 encoding:NSUTF8StringEncoding];
//        NSLog(@"JSON data = %@", myData);
//        NSError *error = nil;
//        
//        //parsing the JSON response
//        id jsonObject = [NSJSONSerialization
//                         JSONObjectWithData:data
//                         options:NSJSONReadingAllowFragments
//                         error:&error];
//        if (jsonObject != nil && error == nil){
//            NSLog(@"Successfully deserialized...");
//            
//            //check if the customer code was valid
//            //userid = [jsonObject objectForKey:@"userid"];
//            //sessionid = [jsonObject objectForKey:@"sessionid"];
//            
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
//                //set the customer object of the second view controller
//                dataDictionary =[jsonObject objectForKey:methodAction];
//                
//                NSLog(@"Dictionary: %@", [dataDictionary description]);
//                
//                
//                for(NSString *key in [dataDictionary allKeys]) {
//                    NSLog(@"key code: %@",key);
//                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
//                    
//                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
//                    
//                }
//                
//                // Create a new array to hold the locations
//                imageFileArray = [[NSMutableArray alloc] init];
//                
//                
//                // Get an array of dictionaries with the key "locations"
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    
//                    
//                    
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    
//                    
//                    imageFileData = [[ImageData alloc] initWithJSONDictionary:dict];
//                    
//                    NSLog(@" image upload status %@",imageFileData.imageUploadStatus);
//                    
//                    // Add the Location object to the array
//                    [imageFileArray addObject:imageFileData];
//                    
//                    
//                    
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)imageFileArray.count);
//                
//                
//                
//                
//                
//                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                //[CommonUtils showMessage:@"Invalid userid or password":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
//            
//        }
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}

- (void) parseResponseImageLoad:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"in parseResponseImageLoad");
        
        
        
        //NSString *myData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        //NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                imageArray = [[NSMutableArray alloc] init];
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    
                    
                    
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    
                    
                    imageData = [[ImageData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" image upload status %@",imageData.imageUploadStatus);
                    
                    // Add the Location object to the array
                    [imageArray addObject:imageData];
                    
                    
                }
                
                if([imageData.imageFoundStatus boolValue] == YES)
                {
                    NSString *base64String=[jsonObject objectForKey:@"image"];
                    
                    //NSLog(@"base64String %@", base64String);
                    
                    NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
                    //NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
                    //NSLog(@"decodedString %@", decodedString); // foo
                    
                    [self.imageView setImage:[UIImage imageWithData:decodedData]];
                    
                    self.imageView.contentMode=UIViewContentModeScaleAspectFit; //to get original size
   
                    
                    NSLog(@"imageData.docIDValue %@",emptyStringIfNil(imageData.docIDValue));
                    self.docID.text=emptyStringIfNil(imageData.docIDValue);
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)imageArray.count);
                
                
                if([imageData.imageFoundStatus boolValue] == NO)
                {
                    [CommonUtils showMessage:@"Image couldn't find, please retry again":self];
                    
                }
                
                
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                //[CommonUtils showMessage:@"Invalid userid or password":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponseImageLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponseImageLoad Code");
    }
    
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)startActivityIndicator
{
    //    lblLoading.text = @"Loading...";
    //    activityIndicator.hidden=NO;
    //    [activityIndicator startAnimating];
    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{
    //    lblLoading.text = @"";
    //    [activityIndicator stopAnimating];
    //    activityIndicator.hidden=YES;
    
    [CommonUtils stopActivityIndicator:self];
    
}

static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}

- (void) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller
{
    
    
    
    @try {
        
        NSDictionary *jsonDictionaryProfile;
        
        
        NSLog(@"connectHost userid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"]);
        NSLog(@"sessionid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]);
        NSLog(@"deviceToken %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"]);
        
        
        jsonDictionaryProfile= @{@"userid":[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],
                                 @"sessionid":([[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]),
                                 @"deviceToken":([[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"])
                                 };
        
        
        
        
        
        NSError *errorOut;
        NSString *jsonString;
        NSString *jsonStringProfile;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&errorOut];
        NSData *jsonDataProfile = [NSJSONSerialization dataWithJSONObject:jsonDictionaryProfile
                                                                  options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                                    error:&errorOut];
        
        
        
        if (! jsonData) {
            NSLog(@"Got an error in json creation: %@", errorOut);
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            jsonStringProfile = [[NSString alloc] initWithData:jsonDataProfile encoding:NSUTF8StringEncoding];
        }
        
        NSLog(@"methodAction %@",methodAction);
        NSLog(@"jsondata %@",jsonString);
        NSLog(@"jsondata profile%@",jsonStringProfile);
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://192.168.1.37:8083";
        //create string for parameters that we need to send in the HTTP POST body
        //NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=%@&message=%@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"],methodAction,jsonString];
        NSString *body =  [NSString stringWithFormat:@"userProfile=%@&methodAction=%@&message=%@",jsonStringProfile,methodAction,jsonString];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:120.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        // set Content-Type in HTTP header
        NSString *contentType = [NSString stringWithFormat:@"application/x-www-form-urlencoded"];
        [urlRequest setValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        //allocate a new operation queue
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        
        //if([methodAction isEqualToString:@"fetchImageDetails"])
        //{
        //__block NSData *returnData;
        
//        [NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//                             NSData *data,
//                             NSError *error) {
//             if ([data length] >0 && error == nil){
//                 //process the JSON response
//                 //use the main queue so that we can interact with the screen
//                 dispatch_async(dispatch_get_main_queue(), ^{
//                     
//                     [self parseResponseImageLoad:data:@"fetchImageDetails":@"imageDetailsWrapper"];
//                     
//                 });
//             }
//             else if ([data length] == 0 && error == nil){
//                 NSLog(@"Empty Response, not sure why?");
//                 [CommonUtils showMessage:@"No response from host system":self];
//                 return;
//             }
//             else if (error != nil){
//                 NSLog(@"Not again, what is the error = %@", error);
//                 //[CommonUtils showError:error:self:@"connectHost"];
//                [CommonUtils showMessage:@"Due to network issue unable to connect to server, please retry again":self];
//                 return;
//             }
//         }];
        
        
                NSURLSession *session = [NSURLSession sharedSession];
                NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                          completionHandler:^(NSData *data,
                                              NSURLResponse *response,
                                              NSError *error) {
                            // handle response
                            
                            
                        NSLog(@"Got response %@ with error %@.\n", response, error);
                        NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
                            
                                                        
                        if ([data length] >0 && error == nil){
                            //process the JSON response
                            //use the main queue so that we can interact with the screen
                            
                            
                             dispatch_async(dispatch_get_main_queue(), ^{
                     
                                [self parseResponseImageLoad:data:@"fetchImageDetails":@"imageDetailsWrapper"];
                     
                            });
                            
                        }
                        else if ([data length] == 0 && error == nil){
                            NSLog(@"Empty Response, not sure why?");
                            [CommonUtils showMessage:@"No response from host system":viewcontroller];
                        }
                        else if (error != nil){
                            NSLog(@"Not again, what is the error = %@", error);
                            
                            [CommonUtils showMessage:@"Due to network issue unable to connect to server, please retry again":viewcontroller];
                            //[self showError:error:viewcontroller:@"connectHost"];
                            
                        }


                  }];
        
                  [dataTask resume];
        
        
        
        
        

        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
    }
    @finally {
        
        NSLog(@"finally in connectHost Code");
    }
    
    
    
    return ;
    
    
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

@end

