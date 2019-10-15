//
//  ComplicationController.swift
//  MonthDate WatchKit Extension
//
//  Created by Justin Allen on 10/12/19.
//  Copyright © 2019 Justin Allen. All rights reserved.
//

import ClockKit


extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var day: String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
}

class ComplicationController: NSObject, CLKComplicationDataSource {
    // MARK: Template Customization
    
    func getTemplate(complication: CLKComplication) -> CLKComplicationTemplate? {
        // TODO here
        
        let month = CLKSimpleTextProvider(text: Date().month , shortText: Date().month)
        month.tintColor = monthColor
        let day = CLKSimpleTextProvider(text: Date().day, shortText: Date().day)
        day.tintColor = dayColor        
        
        // var template: CLKComplicationTemplate? = nil
        switch(complication.family){
            case .modularSmall:
                let template = CLKComplicationTemplateModularSmallStackText()
                template.line1TextProvider = month
                template.line2TextProvider = day
                return template
                break
            case .circularSmall:
                let template = CLKComplicationTemplateCircularSmallStackText()
                template.line1TextProvider = month
                template.line2TextProvider = day
                return template
                break
            case .modularLarge:
                let template = CLKComplicationTemplateModularLargeStandardBody()
                template.headerTextProvider = month
                template.body1TextProvider = day
                return template
                break
            case .graphicCircular:
                let template = CLKComplicationTemplateGraphicCircularStackText()
                template.line1TextProvider = month
                template.line2TextProvider = day
                return template
                break
            default: return nil
        }
        // return template
    }
    
    let monthColor = UIColor.green
    let dayColor = UIColor.white
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry        
//        getTemplate(complication)
        let template = getTemplate(complication: complication)
        if let tmp = template {
            let entry = CLKComplicationTimelineEntry(date: Date(), complicationTemplate: tmp)
            handler(entry)
        } else {
            print("ERROR")
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        /*
        let template = getTemplate(complication)
        if let tmp = template {
            // loop thru days until then.
        } 
        */       
        
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        let template = getTemplate(complication: complication)
        if let tmp = template {
            handler(template)
        }
    }
    
}
