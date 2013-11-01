//
//  PersonsListTableViewController.m
//  Boosting Data Access in Table Views
//
//  Created by Vandad NP on 25/06/2013.
//  Copyright (c) 2013 Pixolity Ltd. All rights reserved.
//

#import "PersonsListTableViewController.h"
#import "AppDelegate.h"
#import "Person.h"
#import "AddPersonViewController.h"

static NSString *PersonTableViewCell = @"PersonTableViewCell";

@interface PersonsListTableViewController ()
<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UIBarButtonItem *barButtonAddPerson;
@property (nonatomic, strong) NSFetchedResultsController *frc;

@end

@implementation PersonsListTableViewController

- (NSManagedObjectContext *) managedObjectContext{
    
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    return appDelegate.managedObjectContext;
    
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    id <NSFetchedResultsSectionInfo> sectionInfo =
        self.frc.sections[section];
    return sectionInfo.numberOfObjects;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:PersonTableViewCell
                                             forIndexPath:indexPath];
    
    Person *person = [self.frc objectAtIndexPath:indexPath];
    
    cell.textLabel.text =
    [person.firstName stringByAppendingFormat:@" %@", person.lastName];
    
    cell.detailTextLabel.text =
    [NSString stringWithFormat:@"Age: %lu",
     (unsigned long)[person.age unsignedIntegerValue]];
    
    return cell;
}

- (void) addNewPerson:(id)paramSender{
    
    [self performSegueWithIdentifier:@"addPerson" sender:self];
    
}

- (void) controllerWillChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView beginUpdates];
}

- (void) controller:(NSFetchedResultsController *)controller
    didChangeObject:(id)anObject
        atIndexPath:(NSIndexPath *)indexPath
      forChangeType:(NSFetchedResultsChangeType)type
       newIndexPath:(NSIndexPath *)newIndexPath{
    
    if (type == NSFetchedResultsChangeDelete){
        [self.tableView
         deleteRowsAtIndexPaths:@[indexPath]
         withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
    else if (type == NSFetchedResultsChangeInsert){
        [self.tableView
         insertRowsAtIndexPaths:@[newIndexPath]
         withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}

- (void) controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView endUpdates];
}

- (void)    tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Person *personToDelete = [self.frc objectAtIndexPath:indexPath];
    
    [[self managedObjectContext] deleteObject:personToDelete];
    
    if ([personToDelete isDeleted]){
        NSError *savingError = nil;
        if ([[self managedObjectContext] save:&savingError]){
            NSLog(@"Successfully deleted the object");
        } else {
            NSLog(@"Failed to save the context with error = %@", savingError);
        }
    }
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void) setEditing:(BOOL)paramEditing
           animated:(BOOL)paramAnimated{
    
    [super setEditing:paramEditing
             animated:paramAnimated];
    
    if (paramEditing){
        [self.navigationItem setRightBarButtonItem:nil
                                          animated:YES];
    } else {
        [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson
                                          animated:YES];
    }
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"Persons";
    
    self.barButtonAddPerson =
    [[UIBarButtonItem alloc]
     initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
     target:self
     action:@selector(addNewPerson:)];
    
    [self.navigationItem setLeftBarButtonItem:self.editButtonItem
                                     animated:NO];
    [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson
                                      animated:NO];
    
    /* Create the fetch request first */
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                    initWithEntityName:@"Person"];
    
    NSSortDescriptor *ageSort =
    [[NSSortDescriptor alloc] initWithKey:@"age"
                                ascending:YES];
    
    NSSortDescriptor *firstNameSort =
    [[NSSortDescriptor alloc] initWithKey:@"firstName"
                                ascending:YES];
    
    fetchRequest.sortDescriptors = @[ageSort, firstNameSort];
    
    self.frc =
    [[NSFetchedResultsController alloc]
     initWithFetchRequest:fetchRequest
     managedObjectContext:[self managedObjectContext]
     sectionNameKeyPath:nil
     cacheName:nil];
    
    self.frc.delegate = self;
    NSError *fetchingError = nil;
    if ([self.frc performFetch:&fetchingError]){
        NSLog(@"Successfully fetched.");
    } else {
        NSLog(@"Failed to fetch.");
    }
    
}


@end
