
import Foundation
import SwiftUI


extension Font {
    static let font_regular = "Inter 18pt"

    
    
    static func regular(size: CGFloat, weight: Font.Weight = .regular) -> Font {
         Font.custom(Font.font_regular, size: size).weight(weight)
     }
     
     static func semiBold(size: CGFloat) -> Font {
         Font.custom(Font.font_regular, size: size).weight(.semibold)
     }
     
     static func bold(size: CGFloat) -> Font {
         Font.custom(Font.font_regular, size: size).weight(.bold)
     }

     static func light(size: CGFloat) -> Font {
         Font.custom(Font.font_regular, size: size).weight(.light)
     }
    static func medium(size: CGFloat) -> Font {
        Font.custom(Font.font_regular, size: size).weight(.medium)
    }

//    static func thinitalic(size: CGFloat) -> Font {
//        Font.custom(Font.font_regular, size: size).weight(.thin).italic()
//    }
    
}
