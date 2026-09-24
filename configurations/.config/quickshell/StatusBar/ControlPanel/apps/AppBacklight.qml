import "../common"
import "../../../API/"

ExtendableSlider {
    id: root

    function getBacklightTier(_p) {
        if (_p < 0.3)
            return "low";
        if (_p < 0.65)
            return "mid";
        return "high";
    }

    tooltip: `${Math.round(Backlight.value * 100)}%`
    iconSrc: {
        return `../assets/actioncenter/backlight/sun-${getBacklightTier(Backlight.value)}.svg`;
    }

    value: Backlight.value
    onValueChanged: Backlight.value = value
}
