//
//  CommonUtils.m
//  TechElite
//
//  Created by Sai Kiran Gandham on 4/23/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import "SingletonClass.h"
#import <UIKit/UIKit.h>
#import "CommonUtils.h"




@implementation CommonUtils

//@synthesize activityIndicator;



//+(NSString*)checkWifi
//{
//        Reachability *reachability = [Reachability reachabilityForInternetConnection];
//        [reachability startNotifier];
//    
//    NSString *message;
//
//        NetworkStatus status = [reachability currentReachabilityStatus];
//    
//
//        if(status == NotReachable)
//        {
//            //No internet
//            message=@"Internet connection not available";
//        }
//        else if (status == ReachableViaWiFi)
//        {
//            //WiFi
//            message=@"WiFi/Data connection not available!";
//            
//        }
//        else if (status != ReachableViaWWAN)
//        {
//            //3G
//            message=@"WWAN connection not available!";
//        }
//    
//    return message;
//}

+ (NSString *)removeSpaces:(NSString *)string
{
    
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
}

+ (BOOL)checkEmptyString:(NSString *)string
{
    
    if([string length] <= 0 || string == nil || [string  isEqual:@""] == TRUE)
        return YES;
    else
        return NO;
    
}

//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller
//{
//    
//    return [self connectHost:methodAction :jsonDictionary :viewcontroller :@"N" :nil:@""];
//    
//}
//
////used in login screen
//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) password: successResponse : (void (^)(NSDictionary *))successResponse
//{
//    
//    return [self connectHost:methodAction :jsonDictionary :viewcontroller :@"N" :nil:password:successResponse : (void (^)(NSDictionary *))successResponse];
//    
//}
//
//+ (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) multiJSON :(NSMutableArray *) jsonMutableArray
//{
//    return [self connectHost:methodAction :jsonDictionary :viewcontroller :multiJSON :jsonMutableArray:@""];
//}

//


+ (void) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (NSString *) multiJSON :(NSMutableArray *) jsonMutableArray :(NSString *) password :  (void (^)(NSDictionary *))successResponse

{
    
    
    
    @try {
        
            NSDictionary *jsonDictionaryProfile;
        
        
            NSLog(@"connectHost userid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"]);
            NSLog(@"connectHost password %@",password);
            NSLog(@"sessionid %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]);
            NSLog(@"deviceToken %@",[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"]);
        
        
            NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789"];

            NSString *sessionid = ([[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"sessionid"]);
        
            sessionid=[sessionid stringByAddingPercentEncodingWithAllowedCharacters:set];

            jsonDictionaryProfile= @{@"userid":[[NSUserDefaults standardUserDefaults] stringForKey:@"userid"],
                                        @"password":([password length]==0?@"":password),
                                        @"sessionid":sessionid,
                                        @"deviceToken":([[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"] length]==0?@"":[[NSUserDefaults standardUserDefaults] stringForKey:@"deviceToken"])
                                        };

        
        
        
        
            NSError *errorOut;
            NSString *jsonString;
            NSString *jsonStringProfile;
            NSData *jsonData;
        
            if([multiJSON isEqualToString:@"Y"])
            {
                jsonData = [NSJSONSerialization dataWithJSONObject:jsonMutableArray
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&errorOut];
                
            }
            else
            {
                jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&errorOut];
            }
            NSData *jsonDataProfile = [NSJSONSerialization dataWithJSONObject:jsonDictionaryProfile
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&errorOut];

        
        
            if (! jsonData) {
                NSLog(@"Got an error in json creation: %@", errorOut);
            } else {
                jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                jsonStringProfile = [[NSString alloc] initWithData:jsonDataProfile encoding:NSUTF8StringEncoding];
            }
        
            NSLog(@"methodAction %@",methodAction);
            NSLog(@"jsondata %@",jsonString);
            NSLog(@"jsondataprofile %@",jsonStringProfile);
            
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
        
   



//            //allocate a new operation queue
//            NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//            //Loads the data for a URL request and executes a handler block on an
//            //operation queue when the request completes or fails.
//        
//            if([methodAction isEqualToString:@"fetchImageDetails"])
//            {
//                __block NSData *returnData;
//                
//                [NSURLConnection
//                 sendAsynchronousRequest:urlRequest
//                 queue:queue
//                 completionHandler:^(NSURLResponse *response,
//                 NSData *data,
//                 NSError *error) {
//                 if ([data length] >0 && error == nil){
//                     //process the JSON response
//                     //use the main queue so that we can interact with the screen
//                     dispatch_async(dispatch_get_main_queue(), ^{
//                        returnData=data;
//                     });
//                 }
//                 else if ([data length] == 0 && error == nil){
//                     NSLog(@"Empty Response, not sure why?");
//                     [self showMessage:@"No response from host system":viewcontroller];
//                     return;
//                 }
//                 else if (error != nil){
//                     NSLog(@"Not again, what is the error = %@", error);
//                     [self showError:error:viewcontroller:@"connectHost"];
//                     return;
//                 }
//                 }];
//                
//                
//                
//            }
//            else
//            {
        
 //               NSURLResponse *response = nil;
 //               NSError *error = nil;
                //getting the data
 //               NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
 
                //NSDictionary *returnDictionary;
        
                
                NSURLSession *session = [NSURLSession sharedSession];
                NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest
                          completionHandler:^(NSData *data,
                                              NSURLResponse *response,
                                              NSError *error) {
                            // handle response
                            
                            
                        //NSLog(@"Got response %@ with error %@.\n", response, error);
                        //NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                        
                        NSLog(@"HTTP status code: %ld", (long)[httpResponse statusCode]);
                            
                        if (httpResponse.statusCode==200 && [data length] >0 && error == nil){
                            //process the JSON response
                            //use the main queue so that we can interact with the screen
                            
                            
                            //return newData;
                            
                            
                            
                                    //NSLog(@"get validate user %@",userid);
        
        
                                    //----------start parsing response---------//
                                    NSString *myData = [[NSString alloc] initWithData:data
                                                                             encoding:NSUTF8StringEncoding];
                                    NSLog(@"JSON data = %@", myData);
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
                                        
                                        
                                        
                                                NSDictionary *dataDictionary =[jsonObject objectForKey:methodAction];
                                                
                                                NSLog(@"Dictionary: %@", [dataDictionary description]);
                                                
                                                
                                                /*for(NSString *key in [dataDictionary allKeys]) {
                                                    NSLog(@"key code: %@",key);
                                                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                                                    
                                                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                                                    
                                                }*/
                                            
                                                 NSNumber *validSession = [dataDictionary objectForKey:@"validSession"];
                                            
                                                NSLog(@"validSession: %@", validSession);
                                            
                                                if([validSession boolValue]==YES)
                                                {

                                                    //[NSMutableDictionary dictionaryWithDictionary:returnDictionary];
                                                    successResponse(dataDictionary);

                                                }
                                                else
                                                {
                                                    NSLog(@"Session is invalid...");
                                                    
                                                    [self showMessage:@"Invalid Session":viewcontroller];
                                                    
                                                    
                                                }
                                            
                                        
                                                        
                                        }
                                        else {
                                            NSLog(@"Success is invalid...");
                                            
                                            [self showMessage:@"Invalid userid or password":viewcontroller];
                                            
                                            
                                        }
                                        
                                    }
                                    else{
                                        
                                        [self showError:error:viewcontroller:@"parseResponse"];
                                        
                                    }
                        
                            
                        }
                        else if (httpResponse.statusCode==200 && [data length] == 0 && error == nil){
                            NSLog(@"Empty Response, not sure why?");
                            [self showMessage:@"No response from host system":viewcontroller];
                        }
                        else if (httpResponse.statusCode!=200 ){
                            NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
                            NSLog(@"response status description: %@", [httpResponse description]);
                            [self showMessage:[NSString stringWithFormat: @"Due to network issue unable to connect to server, please retry again %ld",(long)[httpResponse statusCode]]:viewcontroller];
                            
                        }
                        else if (error != nil){
                            NSLog(@"Not again, what is the error = %@", error);
                            
                            [self showMessage:@"Due to network issue unable to connect to server, please retry again":viewcontroller];
                            //[self showError:error:viewcontroller:@"connectHost"];
                            
                        }


                  }];
        
                  [dataTask resume];
        

                

        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
        [self showMessage:[exception reason] :viewcontroller];
        
    }
    @finally {
        
        NSLog(@"finally in connectHost Code");
    }
    
    
    
    //return nil;
    
    
}


+(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}


//+(void) popoverData: (UITextField *)sender :(NSString *)dateField :(NSString *)tableName :(UIViewController *) viewController
//{
//    @try
//    {
//        
//        NSLog(@"dateField %@",dateField);
//        
//        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
//        //popoverViewController.actionCode=actionCode;
//        popoverViewController.dateField=dateField;
//        popoverViewController.tableName=tableName;
//        popoverViewController.fieldTag=(int)sender.tag;
//        popoverViewController.delegate=self;
//        
//        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
//        [popoverController setPopoverContentSize:CGSizeMake(viewController.view.frame.size.width/4, viewController.view.frame.size.height/4)];
//        
//        
//        if(popoverController.popoverVisible==NO){
//            
//            //NSLog(@" test %lf",sender.frame.origin.x);
//            //NSLog(@" test %lf",sender.frame.origin.y);
//            
//            [popoverController presentPopoverFromRect:CGRectMake(50, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else{
//            [popoverController dismissPopoverAnimated:YES];
//        }
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in popoverData code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :viewController];
//    }
//    @finally {
//        
//        NSLog(@"finally in popoverData  Code");
//    }
//    
//    
//}



+(void) showMessage:(NSString * ) msg :(UIViewController *) viewController{
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
    // code here

        UIAlertController * alertController=   [UIAlertController
                                                alertControllerWithTitle:@"message"
                                                message:msg
                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       //Do some thing here
                                       //[self.navigationController popViewControllerAnimated:YES];
                                       
                                   }];
        
        [alertController addAction:okAction];
        [viewController presentViewController:alertController animated:YES completion:nil];
    
    });
    
}

+(void) showError:(NSError *)error :(UIViewController *)viewController :(NSString *)functionName{
    
    NSString  *msg=[NSString stringWithFormat:@"%@  %ld  %@",functionName,(long)error.code,error.debugDescription];
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"error"
                                            message:msg
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   //[self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    
    [alertController addAction:okAction];
    [viewController presentViewController:alertController animated:YES completion:nil];
    
    
    
    
}




+(void) loadActivityIndicator: (UIViewController *)viewController
{
    //----activity indicator
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    activityIndicator.center = CGPointMake(viewController.view.frame.size.width / 2, viewController.view.frame.size.height / 2);
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    activityIndicator.hidden=NO;
    activityIndicator.color=[UIColor grayColor];
    [activityIndicator setHidesWhenStopped:YES];
    
    
    
//    //-----label loading----
//    lblLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+30.0f)];
//    lblLoading.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    lblLoading.font = [UIFont boldSystemFontOfSize:12.0f];
//    lblLoading.numberOfLines = 1;
//    lblLoading.textAlignment=NSTextAlignmentCenter;
//    lblLoading.backgroundColor = [UIColor clearColor];
//    lblLoading.textColor = [UIColor grayColor];
    
    
    //[viewController.view addSubview:lblLoading];
//    [lblLoading bringSubviewToFront:activityIndicator];
//    [lblLoading addSubview:activityIndicator];
     [viewController.view addSubview:activityIndicator];
    
}

+(void)startActivityIndicator:(UIViewController *)viewController
{
    //lblLoading.text = @"Loading...";
    
    
    for (UIView *view in viewController.view.subviews)
    {
        if([view isKindOfClass:[UIActivityIndicatorView class]])
        {
            UIActivityIndicatorView *activityIndicator=(UIActivityIndicatorView *)view;
            
            activityIndicator.hidden=NO;
            [activityIndicator startAnimating];
        }
        
        
    }
    
    
}

+(void)stopActivityIndicator:(UIViewController *)viewController
{
    //lblLoading.text = @"";
    //UIActivityIndicatorView *activityIndicator=activityIndicatorView;
    
    
    for (UIView *view in viewController.view.subviews)
    {
        if([view isKindOfClass:[UIActivityIndicatorView class]])
        {
            UIActivityIndicatorView *activityIndicator=(UIActivityIndicatorView *)view;
            
            [activityIndicator stopAnimating];
            activityIndicator.hidden=YES;
        }
        
        
    }

    
    
}
+(void) logout:(id) sender :(UIViewController *)viewController
{
    
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"sessionid"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"userGroup"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"lastLoginDate"];

    [viewController.navigationController popToRootViewControllerAnimated:YES];
    return;
}



+ (void) connectHostImage:(NSString *)methodAction :(NSDictionary *) jsonDictionary :(UIViewController *) viewcontroller : (UIImage *)imageToPost :(NSString *) targetFileName  :(NSString *) folderName :  (void (^)(NSDictionary *))successResponse
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
        NSLog(@"jsondataImage %@",jsonString);
        NSLog(@"jsondata Image profile %@",jsonStringProfile);
        
        

        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];

      
        // Dictionary that holds post parameters. You can set your post parameters that your server accepts or programmed to accept.
        NSMutableDictionary* _params = [[NSMutableDictionary alloc] init];
        [_params setObject:jsonStringProfile forKey:@"userProfile"];
        [_params setObject:methodAction forKey:@"methodAction"];
        [_params setObject:jsonString forKey:@"message"];
        [_params setObject:[NSString stringWithFormat:@"/data/appdata/onboard/images/%@",folderName] forKey:@"destination"];

        //@"C://onboard//images//%@"
        
        // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
        NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
        
        // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
        NSString* FileParamConstant = @"file";
        
        // the server url to which the image (or the media) is uploaded. Use your server url here
        NSURL* requestURL = [NSURL URLWithString:myUrlString];
        
        // create request
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [request setHTTPShouldHandleCookies:NO];
        [request setTimeoutInterval:30];
        [request setHTTPMethod:@"POST"];
        
        // set Content-Type in HTTP header
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
        [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        // post body
        NSMutableData *body = [NSMutableData data];
        
        // add params (all params are strings)
        for (NSString *param in _params) {
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"%@\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
        }
        
        //NSLog(@"body %@",body);
        
        // add image data
        //imageToPost=[self resizeImage:imageToPost];
        
        //NSData *imageData = [self resizeImage:imageToPost];
        NSData *imageData =UIImageJPEGRepresentation(imageToPost, 1.0);  //reducing 100% of image quality
        if (imageData) {
            [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@.jpg\"\r\n", FileParamConstant,targetFileName] dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:imageData];
            [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        }
        
        [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        
        
        //NSLog(@"body1 %d",[body length]);
        
        NSLog(@"body length %d",[body length]);
        
        
        // setting the body of the post to the reqeust
        [request setHTTPBody:body];
        
        // set the content-length
        NSString *postLength = [NSString stringWithFormat:@"%d", [body length]];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        // set URL
        [request setURL:requestURL];
        
        
        //NSLog(@"Request body %@", [[NSString alloc] initWithData:[urlRequest HTTPBody] encoding:NSUTF8StringEncoding]);
        
        //allocate a new operation queue
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        /*[NSURLConnection
         sendAsynchronousRequest:urlRequest
         queue:queue
         completionHandler:^(NSURLResponse *response,
         NSData *data,
         NSError *error) {
         if ([data length] >0 && error == nil){
         //process the JSON response
         //use the main queue so that we can interact with the screen
         dispatch_async(dispatch_get_main_queue(), ^{
         [self parseResponse:data];
         });
         }
         else if ([data length] == 0 && error == nil){
         NSLog(@"Empty Response, not sure why?");
         }
         else if (error != nil){
         NSLog(@"Not again, what is the error = %@", error);
         }
         }];*/
        
        
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            
//            return newData;
//            
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [self showMessage:@"No response from host system":viewcontroller];
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [self showError:error:viewcontroller:@"connectHost"];
//            
//        }
        

                NSURLSession *session = [NSURLSession sharedSession];
                NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                          completionHandler:^(NSData *data,
                                              NSURLResponse *response,
                                              NSError *error) {
                            // handle response
                            
                            
                        NSLog(@"Got response %@ with error %@.\n", response, error);
                        NSLog(@"DATA:\n%@\nEND DATA\n", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        
                            
                                                        
                        if ([data length] >0 && error == nil){
                            //process the JSON response
                            //use the main queue so that we can interact with the screen
                            
                            
                            //return newData;
                            
                            
                            
                                    //NSLog(@"get validate user %@",userid);
        
        
                                    //----------start parsing response---------//
                                    NSString *myData = [[NSString alloc] initWithData:data
                                                                             encoding:NSUTF8StringEncoding];
                                    NSLog(@"JSON data = %@", myData);
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
                                        
                                        
                                        
                                                NSDictionary *dataDictionary =[jsonObject objectForKey:methodAction];
                                                
                                                NSLog(@"Dictionary: %@", [dataDictionary description]);
                                                
                                                
                                                for(NSString *key in [dataDictionary allKeys]) {
                                                    NSLog(@"key code: %@",key);
                                                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                                                    
                                                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                                                    
                                                }
                                            
                                                //[NSMutableDictionary dictionaryWithDictionary:returnDictionary];
                                                successResponse(dataDictionary);
                                            

                                        
                                                        
                                        }
                                        else {
                                            NSLog(@"Success is invalid...");
                                            
                                            [self showMessage:@"Invalid userid or password":viewcontroller];
                                            
                                            
                                        }
                                        
                                    }
                                    else{
                                        
                                        [self showError:error:viewcontroller:@"parseResponse"];
                                        
                                    }
                        
                            
                        }
                        else if ([data length] == 0 && error == nil){
                            NSLog(@"Empty Response, not sure why?");
                            [self showMessage:@"No response from host system":viewcontroller];
                        }
                        else if (error != nil){
                            NSLog(@"Not again, what is the error = %@", error);
                            
                            [self showMessage:@"Due to network issue unable to connect to server, please retry again":viewcontroller];
                            //[self showError:error:viewcontroller:@"connectHost"];
                            
                        }


                  }];
        
                  [dataTask resume];
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
        [self showMessage:[exception reason] :viewcontroller];
        
    }
    @finally {
        
        NSLog(@"finally in connectHost Code");
    }
    
    
    
}

+(NSData *)resizeImage:(UIImage *)image
{
    float actualHeight = image.size.height;
    float actualWidth = image.size.width;
    float maxHeight = 300.0;
    float maxWidth = 400.0;
    float imgRatio = actualWidth/actualHeight;
    float maxRatio = maxWidth/maxHeight;
    float compressionQuality = 1.0;//50 percent compression
    
    if (actualHeight > maxHeight || actualWidth > maxWidth)
    {
        if(imgRatio < maxRatio)
        {
            //adjust width according to maxHeight
            imgRatio = maxHeight / actualHeight;
            actualWidth = imgRatio * actualWidth;
            actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio)
        {
            //adjust height according to maxWidth
            imgRatio = maxWidth / actualWidth;
            actualHeight = imgRatio * actualHeight;
            actualWidth = maxWidth;
        }
        else
        {
            actualHeight = maxHeight;
            actualWidth = maxWidth;
        }
    }
    
    CGRect rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight);
    UIGraphicsBeginImageContext(rect.size);
    [image drawInRect:rect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    NSData *imageData = UIImageJPEGRepresentation(img, compressionQuality);
    UIGraphicsEndImageContext();
    
    return imageData;
    
    //return [UIImage imageWithData:imageData];
    
}


+ (NSString *)getIPAddress {
    
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                    
                }
                
            }
            
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
    
}
//+(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat :(UIViewController *) viewController
//{
//    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat:viewController];
//}
//
//+(void) popoverData: (UITextField *)sender :(NSString *)tableName :(UIViewController *) viewController
//{
//    [self popoverData:sender :tableName:@"N":NULL:NULL:viewController];
//}
//
//+(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *) dateFormat :(UIViewController *) viewController
//{
//    @try
//    {
//        
//        NSLog(@"dateField %@",dateField);
//        
//        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
//        //popoverViewController.actionCode=actionCode;
//        popoverViewController.tableName=tableName;
//        popoverViewController.fieldTag=(int)sender.tag;
//        popoverViewController.dateField=dateField;
//        popoverViewController.dateRange=dateRange;
//        popoverViewController.dateFormat=dateFormat;
//        popoverViewController.delegate=self;
//        
//        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
//        [popoverController setPopoverContentSize:CGSizeMake(viewController.view.frame.size.width/4, viewController.view.frame.size.height/4)];
//        
//        
//        if(popoverController.popoverVisible==NO){
//            
//            //NSLog(@" test %lf",sender.frame.origin.x);
//            //NSLog(@" test %lf",sender.frame.origin.y);
//            
//            [popoverController presentPopoverFromRect:CGRectMake(0, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else{
//            [popoverController dismissPopoverAnimated:YES];
//        }
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in popoverData code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :viewController];
//    }
//    @finally {
//        
//        NSLog(@"finally in popoverData  Code");
//    }
//    
//    
//}



@end
