jQuery(document).ready( function(){
    $('#calendar').fullCalendar({
        editable: true,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay',
            defaultView: "month",
            height: 500,
            slotMinutes: 15,
            timeFormat: "h:mm t{ - h:mm t} ",
            dragOpacity: "0.5"
        }
    });
});