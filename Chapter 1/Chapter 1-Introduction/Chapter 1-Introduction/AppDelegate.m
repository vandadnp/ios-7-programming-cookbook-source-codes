//
//  AppDelegate.m
//  Chapter 1-Introduction
//
//  Created by Vandad Nahavandipoor on 05/04/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)                application:(UIApplication *)application
      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
NSCountedSet *setOfNumbers = [NSCountedSet setWithObjects:
                              @10, @20, @10, @10, @30, nil];

[setOfNumbers addObject:@20];
[setOfNumbers removeObject:@10];

NSLog(@"Count for object @10 = %lu",
      (unsigned long)[setOfNumbers countForObject:@10]);

NSLog(@"Count for object @20 = %lu",
      (unsigned long)[setOfNumbers countForObject:@20]);

    
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
    return YES;
}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSMutableOrderedSet *setOfNumbers =
//    [NSMutableOrderedSet orderedSetWithArray:@[@3, @4, @1, @5, @10]];
//
//[setOfNumbers removeObject:@5];
//[setOfNumbers addObject:@0];
//[setOfNumbers exchangeObjectAtIndex:1 withObjectAtIndex:2];
//
//NSLog(@"Set of numbers = %@", setOfNumbers);
//
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSOrderedSet *setOfNumbers = [NSOrderedSet orderedSetWithArray
//                              :@[@3, @4, @1, @5, @10]];
//
//NSLog(@"Orderd set of numbers = %@", setOfNumbers);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}


//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSSet *setOfNumbers = [NSSet setWithArray:@[@3, @4, @1, @5, @10]];
//NSLog(@"Set of numbers = %@", setOfNumbers);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSSet *shoppingList = [[NSSet alloc] initWithObjects:
//                       @"Milk",
//                       @"Bananas",
//                       @"Bread",
//                       @"Milk", nil];
//
//NSMutableSet *mutableList = [NSMutableSet setWithSet:shoppingList];
//
//[mutableList addObject:@"Yogurt"];
//[mutableList removeObject:@"Bread"];
//
//NSLog(@"Original list = %@", shoppingList);
//NSLog(@"Mutable list = %@", mutableList);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSSet *shoppingList = [[NSSet alloc] initWithObjects:
//                       @"Milk",
//                       @"Bananas",
//                       @"Bread",
//                       @"Milk", nil];
//
//NSLog(@"Shopping list = %@", shoppingList);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSDictionary *personInformation =
//@{
//  @"firstName" : @"Mark",
//  @"lastName" : @"Tremonti",
//  @"age" : @30,
//  @"sex" : @"Male"
//  };
//
//NSMutableDictionary *mutablePersonInformation =
//    [[NSMutableDictionary alloc] initWithDictionary:personInformation];
//
//mutablePersonInformation[@"age"] = @32;
//
//NSLog(@"Information = %@", mutablePersonInformation);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSDictionary *personInformation =
//@{
//  @"firstName" : @"Mark",
//  @"lastName" : @"Tremonti",
//  @"age" : @30,
//  @"sex" : @"Male"
//  };
//
//NSString *firstName = personInformation[@"firstName"];
//NSString *lastName = personInformation[@"lastName"];
//NSNumber *age = personInformation[@"age"];
//NSString *sex = personInformation[@"sex"];
//
//NSLog(@"Full name = %@ %@", firstName, lastName);
//NSLog(@"Age = %@, Sex = %@", age, sex);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSString *string1 = @"String 1";
//NSString *string2 = @"String 2";
//NSString *string3 = @"String 3";
//
//NSArray *immutableArray = @[string1, string2, string3];
//
//NSMutableArray *mutableArray = [[NSMutableArray alloc]
//                                initWithArray:immutableArray];
//
//[mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:1];
//[mutableArray removeObjectAtIndex:1];
//[mutableArray setObject:string1 atIndexedSubscript:0];
//
//NSLog(@"Immutalbe array = %@", immutableArray);
//NSLog(@"Mutable Array = %@", mutableArray);
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//- (BOOL)                application:(UIApplication *)application
//      didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//NSArray *stringsArray = @[
//                          @"String 1",
//                          @"String 2",
//                          @"String 3"
//                          ];
//
//__unused NSString *firstString = stringsArray[0];
//__unused NSString *secondString = stringsArray[1];
//__unused NSString *thirdString = stringsArray[2];
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//    return YES;
//}

//#import "AppDelegate.h"
//#import "Person.h"
//
//@implementation AppDelegate
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    Person *steveJobs = [[Person alloc] init];
//    steveJobs.firstName = @"Steve";
//    steveJobs.lastName = @"Jobs";
//    steveJobs.currentHeight = 175.0f; /* Centimeters */
//    
//    if (steveJobs.currentHeight >= [Person minimumHeightInCentimeters] &&
//        steveJobs.currentHeight <= [Person maximumHeightInCentimeters]){
//        /* The height of this particular person is in the acceptable range */
//    } else {
//        /* This person's height is not in the acceptable range */
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

//#import "AppDelegate.h"
//#import "Person.h"
//
//@implementation AppDelegate
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    Person *person = [[Person alloc] init];
//    
//    [person walkAtKilometersPerHour:3.0f];
//    [person runAt10KilometersPerHour];
//    
//    /* If you uncomment this line of code, the compiler will give
//     you an error telling you this method doesn't exist on the Person class */
//    //[person singSong:nil loudly:YES];
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

//#import "AppDelegate.h"
//
//@implementation AppDelegate
//
//- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
//{
//    
///* Set the myFloat variable to PI */
//CGFloat myFloat = M_PI;
//
///* Create a pointer variable that points to the myFloat variable */
//CGFloat *pointerFloat = &myFloat;
//
///* To get the value of myFloat through the pointerFloat variable,
// you will need to use this syntax:
// 
// *pointerFloat
// 
// but to read the floating point value out of the myFloat variable,
// you would simply do this:
// 
// myFloat
// 
// */
//    
//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    // Override point for customization after application launch.
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
