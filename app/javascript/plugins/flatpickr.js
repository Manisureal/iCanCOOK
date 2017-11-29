import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {
   mode: "multiple"
})

flatpickr(".time-picker", {

    enableTime: true,
    noCalendar: true,

    enableSeconds: false, // disabled by default

    time_24hr: false, // AM/PM time picker is used by default

    // default format
    // dateFormat: "H:i",

    // initial values for time. don't use these to preload a date
    defaultHour: 12,
    defaultMinute: 0

    // Preload time with defaultDate instead:
    // defaultDate: "3:30"

})

flatpickr(".home-date", {
   altInput: true
})
