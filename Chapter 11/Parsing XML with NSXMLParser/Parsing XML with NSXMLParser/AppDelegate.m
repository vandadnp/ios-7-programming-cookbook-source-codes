//
//  AppDelegate.m
//  Parsing XML with NSXMLParser
//
//  Created by Vandad NP on 24/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"
#import "XMLElement.h"

@interface AppDelegate () <NSXMLParserDelegate>
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) XMLElement *rootElement;
@property (nonatomic, strong) XMLElement *currentElementPointer;
@end

@implementation AppDelegate

/* 1 */
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"MyXML"
//                                                            ofType:@"xml"];
//    
//    NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFilePath];
//    
//    self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
//    self.xmlParser.delegate = self;
//    if ([self.xmlParser parse]){
//        NSLog(@"The XML is parsed.");
//    } else{
//        NSLog(@"Failed to parse the XML");
//    }
//    
//    self.window = [[UIWindow alloc] initWithFrame:
//                   [[UIScreen mainScreen] bounds]];
//    
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//}

/* 2 */

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    self.rootElement = nil;
    self.currentElementPointer = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    self.currentElementPointer = nil;
}

- (void)        parser:(NSXMLParser *)parser
       didStartElement:(NSString *)elementName
          namespaceURI:(NSString *)namespaceURI
         qualifiedName:(NSString *)qName
            attributes:(NSDictionary *)attributeDict{
    
    if (self.rootElement == nil){
        /* We don't have a root element. Create it and point to it */
        self.rootElement = [[XMLElement alloc] init];
        self.currentElementPointer = self.rootElement;
    } else {
        /* Already have root. Create new element and add it as one of
         the subelements of the current element */
        XMLElement *newElement = [[XMLElement alloc] init];
        newElement.parent = self.currentElementPointer;
        [self.currentElementPointer.subElements addObject:newElement];
        self.currentElementPointer = newElement;
    }
    
    self.currentElementPointer.name = elementName;
    self.currentElementPointer.attributes = attributeDict;
    
}

- (void)        parser:(NSXMLParser *)parser
         didEndElement:(NSString *)elementName
          namespaceURI:(NSString *)namespaceURI
         qualifiedName:(NSString *)qName{
    
    self.currentElementPointer = self.currentElementPointer.parent;
    
}

- (void)        parser:(NSXMLParser *)parser
       foundCharacters:(NSString *)string{
    
    if ([self.currentElementPointer.text length] > 0){
        self.currentElementPointer.text =
        [self.currentElementPointer.text stringByAppendingString:string];
    } else {
        self.currentElementPointer.text = string;
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"MyXML"
                                                            ofType:@"xml"];
    
    NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFilePath];
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
    self.xmlParser.delegate = self;
    if ([self.xmlParser parse]){
        NSLog(@"The XML is parsed.");
        
        /* self.rootElement is now the root element in the XML */
        XMLElement *element = self.rootElement.subElements[1];
        NSLog(@"%@", element.subElements);
        
    } else{
        NSLog(@"Failed to parse the XML");
    }
    
    self.window = [[UIWindow alloc] initWithFrame:
                   [[UIScreen mainScreen] bounds]];
    
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
