//
//  FISShoppingCart.m
//  iOShoppingCart
//
//  Created by Flatiron School on 6/9/16.
//  Copyright © 2016 FIS. All rights reserved.
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart


-(NSUInteger)calculateTotalPriceInCents {
    NSLog(@"This is the items array: %@", self.items);
    NSUInteger totalPriceInCents = 0;
    for (FISItem *item in self.items) {
        totalPriceInCents = totalPriceInCents + item.priceInCents;
    }
    return totalPriceInCents;
}


-(void)addItem:(FISItem *)item {
    [self.items addObject:item];
}


-(void)removeItem:(FISItem *)item {
    NSUInteger indexOfItem = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:indexOfItem];
}


-(void)removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObject:item];
}


-(void)sortItemsByNameAsc {
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)];
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
    
}


-(void)sortItemsByNameDesc {
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:NO selector:@selector(caseInsensitiveCompare:)];
    [self.items sortUsingDescriptors:@[sortByNameDesc]];
}


-(void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:YES];
    [self.items sortUsingDescriptors:@[sortByPriceAsc]];
}


-(void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents" ascending:NO];
    [self.items sortUsingDescriptors:@[sortByPriceDesc]];
}


-(NSArray *)allItemsWithName:(NSString *)name {
    NSMutableArray *allItemsWithName = [[NSMutableArray alloc]init];
    for (FISItem *item in self.items) {
        if ([item.name isEqualToString:name]) {
            [allItemsWithName addObject:item];
        }
    }
    return allItemsWithName;
}


-(NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price {
    NSMutableArray *allItemsPricedGreaterThanInput = [[NSMutableArray alloc]init];
    for (FISItem *item in self.items) {
        if (item.priceInCents >= price) {
            [allItemsPricedGreaterThanInput addObject:item];
        }
    }
    return allItemsPricedGreaterThanInput;
}


-(NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price {
    NSMutableArray *allItemsPricedLessThanInput = [[NSMutableArray alloc]init];
    for (FISItem *item in self.items) {
        if (item.priceInCents <= price) {
            [allItemsPricedLessThanInput addObject:item];
        }
    }
    return allItemsPricedLessThanInput;
}


@end
