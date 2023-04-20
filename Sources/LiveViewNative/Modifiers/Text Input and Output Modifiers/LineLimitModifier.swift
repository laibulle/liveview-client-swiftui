//
//  LineLimitModifier.swift
//  LiveViewNative
//
//  Created by Dylan.Ginsburg on 4/18/23.
//

import SwiftUI

/// Sets the maximum number of lines that text can occupy in this view.
///
/// ```html
/// <Text
///     modifiers={
///         line_limit(@native, number: 2)
///     }
/// >Hello World!</Text>
/// ```
///
/// ## Arguments
/// * ``number``
#if swift(>=5.8)
@_documentation(visibility: public)
#endif
struct LineLimitModifier: ViewModifier, Decodable, Equatable {
    /// The line limit. If nil, no line limit applies.
    #if swift(>=5.8)
    @_documentation(visibility: public)
    #endif
    private let number: Int?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
    }
    
    func body(content: Content) -> some View {
        content.lineLimit(number)
    }
    
    enum CodingKeys: String, CodingKey {
        case number
    }
}