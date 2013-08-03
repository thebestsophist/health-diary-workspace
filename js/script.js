/*  Author:

	Basic media queries, set in pixels to better deal
	with images. I've included a basic image replacement
	examples for responsive images but you'll want to
	edit your own based on how the how the images work
	in your layout.

*/
	var	rooturl = "";
/* Ailments */
$('select#type').change(function(){
    var ailmentType = $('select#type option:selected').attr('value');
// New Ailment entry
    if (ailmentType == "Migraine") {
    	$('.step2').each(function(){
    		$(this).attr('href','#migraine').text('What kind of headache?');
    	});
    	$('.step2.back, .step1b.back, step1c.back').each(function(){
    		$(this).attr('href','#migraine');
    	});
    }
    if (ailmentType == "Neurological") {
    	$('.step2').each(function(){
    		$(this).attr('href','#neuro').text('What neurological symptoms?');
    	});
    	$('.step1b.back').each(function(){
    		$(this).attr('href','#start');
    	});
    	$('.step2.back, step1c.back').each(function(){
    		$(this).attr('href','#neuro');
    	});
    }
    if (ailmentType == "Illness") {
    	$('.step2').each(function(){
    		$(this).attr('href','#illness').text('How are you feeling?');
    	});

    }
    if (ailmentType == "Other") {
    	$('.step2').each(function(){
    		$(this).attr('href','#other').text('What body parts are affected?');
    	});
    	$('.step2.back').each(function(){
    		$(this).attr('href','#other');
    	});
    	$('.step1c.back').each(function(){
    		$(this).attr('href','#start');
    	});
    }
// New Wellness entry
    if (ailmentType == "Work") {
    	$('.step2').each(function(){
    		$(this).attr('href','#work').text('Work time');
    	});
    }
    if (ailmentType == "Off") {
    	$('.step2').each(function(){
    		$(this).attr('href','#activities').text('What are you doing?');
    	});
    }
});

// Switching between fieldsets for create and update forms (But ignores when editing for corrections
d3.selectAll('.new a[class^="step"], .update a[class^="step"]').on('click',function(){
    var chooseFieldset = d3.select(this).attr('href')
    d3.selectAll('fieldset').classed('active',false).classed('inactive',true);
    d3.select(chooseFieldset).classed('active',true).classed('inactive',false);
});

// Bind SVG selections with select[name="fields[body-parts][]"]
d3.selectAll('g.body-part, g.headachelocation').on('click',function(){
    var pathhasClass = d3.select(this).classed('selected'),
    	optionValue = d3.select(this).attr('value');

    d3.select(this).classed('selected', !pathhasClass);

    if ($('option[value="' + optionValue + '"]').attr('selected')) {
    	$('option[value="' + optionValue + '"]').removeAttr('selected');
    }
    else {
    	$('option[value="' + optionValue + '"]').attr('selected', 'selected');
    }
});

/* Only < 48em */
if (Modernizr.mq('only screen and (max-width: 767px)')) {
	$(function(){
	    $('input[type="datetime"], input[type="datetime-local"]').mobiscroll().datetime({
	        theme: 'android-ics light',
	        display: 'bottom',
	        mode: 'scroller',
	        dateOrder: 'M D d yy',
	        timeWheels: 'HH ii',
	        stepMinute: 5
	    });
	    $('input[type="date"]').mobiscroll().date({
	        theme: 'android-ics light',
	        display: 'bottom',
	        mode: 'scroller',
	        dateOrder: 'M D d yy'
	    });
	    $('input[type="time"]').mobiscroll().time({
	        theme: 'android-ics light',
	        display: 'bottom',
	        mode: 'scroller',
	        timeWheels: 'HH ii',
	        stepMinute: 5
	    });

	    $("input.timer").mobiscroll().time({
	        theme: 'android-ics light',
	        display: 'bottom',
	        mode: 'scroller',
	        timeWheels: 'HH ii',
	        timeFormat: 'HH:ii',
	        stepMinute: 5
	    });

	});
}

/* Anything >= 48em */
if (Modernizr.mq("only screen and (min-width: 768px)")) {

	/* Replaces a mobile full-width image at 768px into one at 960px

	   Similar to the ideas in
	 - https://github.com/joshje/Responsive-Enhance and
	 - https://github.com/filamentgroup/Responsive-Images
	   but takes advantage of the JIT image manipulation
	   extension that is included by default.
	*/

$(function(){
//	$("#now a, #daily a, #rare a").colorbox();

    $("input[type='datetime'], input[type='datetime-local']").mobiscroll().datetime({
        theme: 'android-ics light',
        display: 'bubble',
        animate: 'down',
        mode: 'mixed',
        dateOrder: 'MD dyy',
        timeWheels: 'HH ii',
        stepMinute: 5
    });

    $("input[type='date']").mobiscroll().date({
        theme: 'android-ics light',
        display: 'bubble',
        animate: 'down',
        mode: 'mixed',
        dateOrder: 'M D d yy'
    });

    $("input[type='time']").mobiscroll().time({
        theme: 'android-ics light',
        display: 'bubble',
        animate: 'down',
        mode: 'mixed',
        timeWheels: 'HH ii',
        stepMinute: 5
    });

    $("input.timer").mobiscroll().time({
        theme: 'android-ics light',
        display: 'bubble',
        animate: 'down',
        mode: 'mixed',
        timeWheels: 'HH ii',
        timeFormat: 'HH:ii',
        stepMinute: 5
    });
});

/*
	$('img').attr('src', function(index, attr) {
		return attr.replace('image/1/768', 'image/1/960');
	});
*/
}

/* Between 48em and 60em *
if (Modernizr.mq('only screen and (min-width: 768px) and (max-width: 960px)')) {

}

/* Anything > 60em *
if (Modernizr.mq('only screen and min-width: 960px)')) {

}


/* High pixel density *
if (window.devicePixelRatio >= 1.5) {

}

/* Portrait orientation *
if (window.orientation == 0 || 180) {

}

/* Landscape orientation *
if (window.orientation == 90 || 240) {

}
/*  */