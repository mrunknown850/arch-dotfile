pragma Singleton
import QtQuick

QtObject {
    // Base Colors
    readonly property color surface: "{{colors.surface.default.hex}}"
    readonly property color colorOnSurface: "{{colors.on_surface.default.hex}}"
    readonly property color surfaceVariant: "{{colors.surface_variant.default.hex}}"
    readonly property color colorOnSurfaceVariant: "{{colors.on_surface_variant.default.hex}}"
    // Module Colors
    readonly property color primary: "{{colors.primary.default.hex}}"
    readonly property color colorOnPrimary: "{{colors.on_primary.default.hex}}"
    readonly property color primaryContainer: "{{colors.primary_container.default.hex}}"
    readonly property color inversePrimary: "{{colors.inverse_primary.default.hex}}"

    readonly property color secondary: "{{colors.secondary.default.hex}}"
    readonly property color colorOnSecondary: "{{colors.on_secondary.default.hex}}"
    readonly property color secondaryContainer: "{{colors.secondary_container.default.hex}}"

    readonly property color tertiary: "{{colors.tertiary.default.hex}}"
    readonly property color colorOnTertiary: "{{colors.on_tertiary.default.hex}}"
    readonly property color tertiaryContainer: "{{colors.tertiary_container.default.hex}}"

    readonly property color outline: "{{colors.outline.default.hex}}"
    readonly property color outlineVariant: "{{colors.outline_variant.default.hex}}"

    readonly property color error: "{{colors.error.default.hex}}"
    readonly property color colorOnError: "{{colors.on_error.default.hex}}"

    readonly property color background: "{{colors.background.default.hex}}"
    readonly property color colorOnBackground: "{{colors.on_background.default.hex}}"

    readonly property color shadow: "{{colors.shadow.default.hex}}"
    readonly property color scrim: "{{colors.scrim.default.hex}}"

    // Global Font Configuration
    readonly property string fontFamily: "JetBrains Mono Nerd Font"
    readonly property int fontSize: 13
}
