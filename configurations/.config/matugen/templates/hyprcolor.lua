hl.config({
  general = {
    col = {
      active_border = {
        colors = {
          "rgba({{colors.primary.default.hex_stripped}}ff)",
          "rgba({{colors.primary_container.default.hex_stripped}}ff)"
        }, angle = 45 },
      inactive_border = "rgba({{colors.outline.default.hex_stripped}}55)"
}}})

hl.config({
  group = {
    col = {
      border_active = "rgba({{colors.secondary.default.hex_stripped}}ff)",
      border_inactive = "rgba({{colors.outline.default.hex_stripped}}ff)",
    },
    groupbar = {
      text_color = "rgb({{colors.on_surface.default.hex_stripped}})",
      col = {
        inactive = "rgba({{colors.surface_variant.default.hex_stripped}}ff)",
        active = "rgba({{colors.surface.default.hex_stripped}}ff)",
      },
    }
}})

