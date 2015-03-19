//
//  FifaBaseRepository.m
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "FifaBaseRepository.h"

@implementation FifaBaseRepository

-(id) insertManagedObjectOfClass:(Class)aClass inManagedObjectContext:(NSManagedObjectContext*) managedObjectContext{
    NSManagedObject* managedObject = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(aClass) inManagedObjectContext:managedObjectContext];
    return managedObject;
}

-(BOOL) saveManagedObjectContext:(NSManagedObjectContext*) managedObjectContext{
    NSError* error;
    
    if (![managedObjectContext save:&error]){
        NSLog(@"%@", [error localizedDescription]);
        return NO;
    }
    
    return YES;
}

-(NSArray*) fetchEntitiesForClass:(Class)aClass withPredicate:(NSPredicate*)predicate inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext{
    
    NSError* error;
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:NSStringFromClass(aClass) inManagedObjectContext:managedObjectContext];
    
    [fetchRequest setEntity:entityDescription];
    
    [fetchRequest setPredicate:predicate];
    
    NSArray* items = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error){
        NSLog(@"ERROR ==> %@", [error localizedDescription]);
        return nil;
    }
    
    return items;
}

@end
