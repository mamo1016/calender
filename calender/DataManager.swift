//
//  DataManager.swift
//  calender
//
//  Created by 上田　護 on 2018/01/12.
//  Copyright © 2018年 上田　護. All rights reserved.
//

import Foundation
var currentMonthOfDates = [NSDate]() //表記する月の配列
var selectedDate = NSDate()
let daysPerWeek: Int = 7
var numberOfItems: Int!

//月ごとのセルの数を返すメソッド
func daysAcquisition() -> Int {
    let rangeOfWeeks = NSCalendar.currentCalendar().rangeOfUnit(NSCalendar.Unit.WeekOfMonth, inUnit: NSCalendarUnit.Month, forDate: firstDateOfMonth())
    let numberOfWeeks = rangeOfWeeks.length //月が持つ週の数
    numberOfItems = numberOfWeeks * daysPerWeek //週の数×列の数
    return numberOfItems
}
//月の初日を取得
func firstDateOfMonth() -> NSDate {
    let components = NSCalendar.currentCalendar.components([.Year, .Month, .Day],
                                                             fromDate: selectedDate)
    components.day = 1
    let firstDateMonth = NSCalendar.currentCalendar().dateFromComponents(components)!
    return firstDateMonth
}   
