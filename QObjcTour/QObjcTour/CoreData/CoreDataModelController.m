//
//  CoreDataModelController.m
//  QObjcTour
//
//  Created by cdzdev on 2017/7/10.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#import "CoreDataModelController.h"
#import "CoreDataManager.h"
#import "Person.h"
#import "Person+Functions.h"
#import "AppDelegate.h"

typedef void(^CoreDataAction)(NSString * name,NSString * age);


@interface CoreDataModelController ()
@property (strong,nonatomic)CoreDataManager * manager;
@end

@implementation CoreDataModelController


- (CoreDataManager *)manager{
    if (!_manager) {
        _manager = [[CoreDataManager alloc] init];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AppDelegate * delegate = [[UIApplication sharedApplication] delegate];
    delegate.manager = self.manager;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)queryAll:(id)sender {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:[Person entityName] inManagedObjectContext:self.manager.managedObjectContext];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                   ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObjects:sortDescriptor, nil]];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.manager.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"It is empty");
    }else{
        NSLog(@"%@",fetchedObjects.description);
    }
}


- (IBAction)update:(id)sender {
    [self AlertTextFieldWithTitle:@"Update" Action:^(NSString *name, NSString *age) {
        Person * person = [self personExistWithName:name];
        if (person != nil) {
            person.age = @(age.integerValue);
            [self.manager saveContext];
            NSLog(@"Update Successfully");
        }else{
            NSLog(@"Person does not exist,can not update");
        }
    }];
}
- (IBAction)Create:(id)sender {
    [self AlertTextFieldWithTitle:@"Create" Action:^(NSString *name, NSString *age) {
        if ([self personExistWithName:name] == nil) {
            Person * person = [Person insertNewObjectInManagedObjectContext:self.manager.managedObjectContext];
            person.name = name;
            person.age =  @(age.integerValue);
            [self.manager saveContext];
            NSLog(@"Create Successfully.Id is %@",person.objectID.description);
            
        }else{
            NSLog(@"This peson  exist before,can not create");
        }
    }];
}
- (IBAction)Delete:(id)sender {
    [self AlertTextFieldWithTitle:@"Delete" Action:^(NSString *name, NSString *age) {
        Person * person = [self personExistWithName:name];
        if (person != nil) {
            [self.manager.managedObjectContext deleteObject:person];
            NSLog(@"Delete successfully");
        }else{
            NSLog(@"This does not exist before,can not delete");
        }
    }];
}


-(Person *)personExistWithName:(NSString *)name{
    NSFetchRequest * fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[Person entityName]];
    //This is an array
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"name =  %@",name];
    NSError *error = nil;
    NSArray *fetchedObjects = [self.manager.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        return nil;
    }else{
        return [fetchedObjects lastObject];
    }
}



-(void)AlertTextFieldWithTitle:(NSString *)actionTitle Action:(CoreDataAction) actionBlock {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:actionTitle message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Name";
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"age";
    }];
    [alert addAction:[UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray * textfields = alert.textFields;
        UITextField * nameTextfields = textfields[0];
        UITextField * ageTextFields = textfields[1];
        actionBlock(nameTextfields.text,ageTextFields.text);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end


