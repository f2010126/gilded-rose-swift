//
//  GildedRose.swift
//  GildedRose
//
//  Created by Tom Heinan on 8/31/15.
//  Copyright © 2015 Tom Heinan. All rights reserved.
//

struct Constants {
    //App Constants
    static let CHEESE = "Aged Brie"
    static let CONCERT = "Backstage passes to a TAFKAL80ETC concert"
    static let HAND = "Sulfuras, Hand of Ragnaros"
    static let CONJURED = "Conjured"
    
}
public class GildedRose {
    //SOLID Principle. 1 function does only 1 thing.
    public static func updateQuality(items: Array<Item>) -> [Item] {
        var items = items
        for i in 0 ..< items.count {
            switch(items[i].name){
            case Constants.CHEESE: let cheeseItem = CheeseModifier(setItem: items[i]).updateItem()
                items[i] = cheeseItem
            case Constants.CONCERT: let concertItem = BackStageModifier(setItem: items[i]).updateItem()
                items[i] = concertItem
            case Constants.HAND: //do nothing
               continue
            case let str where str.contains(Constants.CONJURED):
                let conjuredItem = ConjuredModifier(setItem: items[i]).updateItem()
                items[i] = conjuredItem
            default:
                let normalItem = ItemModifier(setItem: items[i]).updateItem()
                items[i] = normalItem
            }
        }
        return items
    }
    
}
