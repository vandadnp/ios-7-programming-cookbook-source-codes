//
//  AppDelegate.m
//  Adding Object Subscripting Support to Your Own Classes
//
//  Created by Vandad NP on 06/07/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "Person.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /* 1 */
//NSString *const kFirstNameKey = @"firstName";
//NSString *const kLastNameKey = @"lastName";
//
//NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
//
//[dictionary setValue:@"Tim" forKey:kFirstNameKey];
//[dictionary setValue:@"Cook" forKey:kLastNameKey];
//
//__unused NSString *firstName = [dictionary valueForKey:kFirstNameKey];
//__unused NSString *lastName = [dictionary valueForKey:kLastNameKey];

    /* 2 */
//NSString *const kFirstNameKey = @"firstName";
//NSString *const kLastNameKey = @"lastName";
//
//NSDictionary *dictionary = @{
//                             kFirstNameKey : @"Tim",
//                             kLastNameKey : @"Cook",
//                             };
//
//__unused NSString *firstName = dictionary[kFirstNameKey];
//__unused NSString *lastName = dictionary[kLastNameKey];
    
    /* 3 */
//NSArray *array = [[NSArray alloc] initWithObjects:@"Tim", @"Cook", nil];
//__unused NSString *firstItem = [array objectAtIndex:0];
//__unused NSString *secondObject = [array objectAtIndex:1];
    
    /* 4 */
//NSArray *array = @[@"Tim", @"Cook"];
//__unused NSString *firstItem = array[0];
//__unused NSString *secondObject = array[0];

    /* 5 */
//Person *person = [Person new];
//person[kFirstNameKey] = @"Tim";
//person[kLastNameKey] = @"Cook";
//__unused NSString *firstName = person[kFirstNameKey];
//__unused NSString *lastName = person[kLastNameKey];
    
    /* 6 */
//Person *person = [Person new];
//person.firstName = @"Tim";
//person.lastName = @"Cook";
//__unused NSString *firstName = person.firstName;
//__unused NSString *lastName = person.lastName;

    /* 7 */
Person *person = [Person new];
person[kFirstNameKey] = @"Tim";
person[kLastNameKey] = @"Cook";
NSString *firstNameByKey = person[kFirstNameKey];
NSString *lastNameByKey = person[kLastNameKey];

NSString *firstNameByIndex = person[0];
NSString *lastNameByIndex = person[1];

if ([firstNameByKey isEqualToString:firstNameByIndex] &&
    [lastNameByKey isEqualToString:lastNameByIndex]){
    NSLog(@"Success");
} else {
    NSLog(@"Something is not right");
}
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

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
