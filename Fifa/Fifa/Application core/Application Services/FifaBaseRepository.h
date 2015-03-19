//
//  FifaBaseRepository.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import "AVTBaseRepository.h"
#import <CoreData/CoreData.h>

@interface FifaBaseRepository : AVTBaseRepository

-(id)insertManagedObjectOfClass:(Class)aClass inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

-(BOOL)saveManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

-(NSArray*)fetchEntitiesForClass:(Class)aClass withPredicate:(NSPredicate*)predicate inManagedObjectContext:(NSManagedObjectContext*)managedObjectContext;

@end
