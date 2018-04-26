//
//  ItemModifier.swift
//  GildedRose
//
//  Created by Sengupta, Dipti on 25/04/18.
//  Copyright © 2018 Tom Heinan. All rights reserved.
//

import Foundation
class ItemModifier{  //for regular items
    var myItem: Item
    init(setItem:Item) {
        self.myItem = setItem
    }
    func updateItem()->Item{
        handleQtyUpdate()
        handleSellInUpdate()
        handleItemExpiredUpdate()
        return myItem
    }
    func handleQtyUpdate(){
        if (myItem.quality > 0) {//&& (myItem.quality <= 50) {
            myItem.quality = myItem.quality - 1
        }
    }
    func handleItemExpiredUpdate(){
        if (myItem.sellIn < 0) && (myItem.quality > 0){
            myItem.quality = myItem.quality - 1
        }
    }
    func handleSellInUpdate(){
        myItem.sellIn = myItem.sellIn - 1
    }
    
}


class CheeseModifier: ItemModifier{
    override func handleQtyUpdate(){
        if myItem.quality < 50 {
            myItem.quality = myItem.quality + 1
        }
    }
    override func handleItemExpiredUpdate(){
        if (myItem.sellIn < 0) {
            handleQtyUpdate()
        }
    }
}

class BackStageModifier: ItemModifier{
    
    override func handleQtyUpdate(){
        var increase = 1
        switch myItem.sellIn {
        case 0...5: increase = 3
        case 6...10: increase = 2
        default: increase = 1
        }
        if myItem.quality + increase > 50{
            myItem.quality = 50
        }else{
            myItem.quality = myItem.quality + increase
        }
    }
    
    override func handleItemExpiredUpdate(){
        if (myItem.sellIn < 0){
            myItem.quality = 0
        }
    }
}

class SulfurasModifier: ItemModifier{ //do nothing
    
    
}

class ConjuredModifier: ItemModifier{
    override func handleQtyUpdate() {
        myItem.quality = myItem.quality - 2
        if (myItem.quality < 0){
            myItem.quality = 0
        }
        
    }
    override func handleItemExpiredUpdate() {
        if (myItem.sellIn < 0) {
            handleQtyUpdate()
        }
    }
    
}
