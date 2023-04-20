//
//  FlipsForRightToLeftLayoutDirectionModifier.swift
//  LiveViewNative
//
//  Created by Dylan.Ginsburg on 4/18/23.
//

import SwiftUI

/// Sets whether this view mirrors its contents horizontally when the layout direction is right-to-left.
///
/// ```html
/// <Text modifiers={flips_for_right_to_left_layout_direction(@native, enabled: true)}>
///     Hello, world!
/// </Text>
/// ```
///
/// ## Arguments
/// * ``enabled``
#if swift(>=5.8)
@_documentation(visibility: public)
#endif
struct FlipsForRightToLeftLayoutDirectionModifier: ViewModifier, Decodable {
    #if swift(>=5.8)
    @_documentation(visibility: public)
    #endif
    private let enabled: Bool

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.enabled = try container.decode(Bool.self, forKey: .enabled)
    }

    func body(content: Content) -> some View {
        content.flipsForRightToLeftLayoutDirection(enabled)
    }

    enum CodingKeys: String, CodingKey {
        case enabled
    }
}