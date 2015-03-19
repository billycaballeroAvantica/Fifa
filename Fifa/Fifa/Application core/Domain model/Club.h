//
//  Club.h
//  Fifa
//
//  Created by Billy.Caballero on 3/18/15.
//  Copyright (c) 2015 Avantica Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Club : NSManagedObject

@property (nonatomic, retain) NSString * clubId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * resourceId;
@property (nonatomic, retain) NSSet *players;

-(id)initWithJson: (id) json;

@end

@interface Club (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(NSManagedObject *)value;
- (void)removePlayersObject:(NSManagedObject *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

@end
