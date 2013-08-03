
// usage: log('inside coolFunc', this, arguments);
// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function(){
  log.history = log.history || [];   // store logs to an array for reference
  log.history.push(arguments);
  if(this.console) {
	arguments.callee = arguments.callee.caller;
	var newarr = [].slice.call(arguments);
	(typeof console.log === 'object' ? log.apply.call(console.log, console, newarr) : console.log.apply(console, newarr));
  }
};

// make it safe to use console.log always
(function(b){function c(){}for(var d="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,timeStamp,profile,profileEnd,time,timeEnd,trace,warn".split(","),a;a=d.pop();){b[a]=b[a]||c}})((function(){try
{console.log();return window.console;}catch(err){return window.console={};}})());

// This requires jQuery to function properly
// Sets window properties as cookies for server-side optimizations

function getDevicePixelRatio() {
	if(window.devicePixelRatio === undefined) return 1; // No pixel ratio available. Assume 1:1.
	return window.devicePixelRatio;
}

function getWindowOrientation() {
	if(window.orientation === undefined) return 0;
	return window.orientation;
}

function getWindowProperties() {
	document.cookie = "window-width=" + $(window).width() + "; path=/";
	document.cookie = "window-height=" + $(window).height() + "; path=/";
	document.cookie = 'screen-orientation=' + getWindowOrientation() + '; path=/';
}

function getScreenProperties() {
	document.cookie = "screen-width=" + screen.width + "; path=/";
	document.cookie = "screen-height=" + screen.height + "; path=/";
	document.cookie = "pixel-density=" + getDevicePixelRatio() + "; path=/";

}

// Sets window properties as cookies for server-side optimizations
$(document).ready(function(){
	getWindowProperties();
	getScreenProperties();
	$("html").removeClass('no-js');
});
$(window).resize(getWindowProperties);
$(screen).resize(getScreenProperties);
// place any jQuery/helper plugins in here, instead of separate, slower script files.
/*!
	jQuery Colorbox v1.4.13 - 2013-04-11
	(c) 2013 Jack Moore - jacklmoore.com/colorbox
	license: http://www.opensource.org/licenses/mit-license.php
*/
(function ($, document, window) {
	var
	// Default settings object.
	// See http://jacklmoore.com/colorbox for details.
	defaults = {
		transition: "elastic",
		speed: 300,
		width: false,
		initialWidth: "480",
		innerWidth: false,
		maxWidth: false,
		height: false,
		initialHeight: "450",
		innerHeight: false,
		maxHeight: false,
		scalePhotos: true,
		scrolling: true,
		inline: false,
		html: false,
		iframe: false,
		fastIframe: true,
		photo: false,
		href: false,
		title: false,
		rel: false,
		opacity: 0.9,
		preloading: true,
		className: false,

		// alternate image paths for high-res displays
		retinaImage: false,
		retinaUrl: false,
		retinaSuffix: '@2x.$1',

		// internationalization
		current: "image {current} of {total}",
		previous: "previous",
		next: "next",
		close: "close",
		xhrError: "This content failed to load.",
		imgError: "This image failed to load.",

		open: false,
		returnFocus: true,
		reposition: true,
		loop: true,
		slideshow: false,
		slideshowAuto: true,
		slideshowSpeed: 2500,
		slideshowStart: "start slideshow",
		slideshowStop: "stop slideshow",
		photoRegex: /\.(gif|png|jp(e|g|eg)|bmp|ico)((#|\?).*)?$/i,

		onOpen: false,
		onLoad: false,
		onComplete: false,
		onCleanup: false,
		onClosed: false,
		overlayClose: true,
		escKey: true,
		arrowKey: true,
		top: false,
		bottom: false,
		left: false,
		right: false,
		fixed: false,
		data: undefined
	},

	// Abstracting the HTML and event identifiers for easy rebranding
	colorbox = 'colorbox',
	prefix = 'cbox',
	boxElement = prefix + 'Element',

	// Events
	event_open = prefix + '_open',
	event_load = prefix + '_load',
	event_complete = prefix + '_complete',
	event_cleanup = prefix + '_cleanup',
	event_closed = prefix + '_closed',
	event_purge = prefix + '_purge',

	// Cached jQuery Object Variables
	$overlay,
	$box,
	$wrap,
	$content,
	$topBorder,
	$leftBorder,
	$rightBorder,
	$bottomBorder,
	$related,
	$window,
	$loaded,
	$loadingBay,
	$loadingOverlay,
	$title,
	$current,
	$slideshow,
	$next,
	$prev,
	$close,
	$groupControls,
	$events = $('<a/>'),

	// Variables for cached values or use across multiple functions
	settings,
	interfaceHeight,
	interfaceWidth,
	loadedHeight,
	loadedWidth,
	element,
	index,
	photo,
	open,
	active,
	closing,
	loadingTimer,
	publicMethod,
	div = "div",
	className,
	requests = 0,
	init;

	// ****************
	// HELPER FUNCTIONS
	// ****************

	// Convience function for creating new jQuery objects
	function $tag(tag, id, css) {
		var element = document.createElement(tag);

		if (id) {
			element.id = prefix + id;
		}

		if (css) {
			element.style.cssText = css;
		}

		return $(element);
	}

	// Get the window height using innerHeight when available to avoid an issue with iOS
	// http://bugs.jquery.com/ticket/6724
	function winheight() {
		return window.innerHeight ? window.innerHeight : $(window).height();
	}

	// Determine the next and previous members in a group.
	function getIndex(increment) {
		var
		max = $related.length,
		newIndex = (index + increment) % max;

		return (newIndex < 0) ? max + newIndex : newIndex;
	}

	// Convert '%' and 'px' values to integers
	function setSize(size, dimension) {
		return Math.round((/%/.test(size) ? ((dimension === 'x' ? $window.width() : winheight()) / 100) : 1) * parseInt(size, 10));
	}

	// Checks an href to see if it is a photo.
	// There is a force photo option (photo: true) for hrefs that cannot be matched by the regex.
	function isImage(settings, url) {
		return settings.photo || settings.photoRegex.test(url);
	}

	function retinaUrl(settings, url) {
		return settings.retinaUrl && window.devicePixelRatio > 1 ? url.replace(settings.photoRegex, settings.retinaSuffix) : url;
	}

	function trapFocus(e) {
		if ('contains' in $box[0] && !$box[0].contains(e.target)) {
			e.stopPropagation();
			$box.focus();
		}
	}

	// Assigns function results to their respective properties
	function makeSettings() {
		var i,
			data = $.data(element, colorbox);

		if (data == null) {
			settings = $.extend({}, defaults);
			if (console && console.log) {
				console.log('Error: cboxElement missing settings object');
			}
		} else {
			settings = $.extend({}, data);
		}

		for (i in settings) {
			if ($.isFunction(settings[i]) && i.slice(0, 2) !== 'on') { // checks to make sure the function isn't one of the callbacks, they will be handled at the appropriate time.
				settings[i] = settings[i].call(element);
			}
		}

		settings.rel = settings.rel || element.rel || $(element).data('rel') || 'nofollow';
		settings.href = settings.href || $(element).attr('href');
		settings.title = settings.title || element.title;

		if (typeof settings.href === "string") {
			settings.href = $.trim(settings.href);
		}
	}

	function trigger(event, callback) {
		// for external use
		$(document).trigger(event);

		// for internal use
		$events.trigger(event);

		if ($.isFunction(callback)) {
			callback.call(element);
		}
	}

	// Slideshow functionality
	function slideshow() {
		var
		timeOut,
		className = prefix + "Slideshow_",
		click = "click." + prefix,
		clear,
		set,
		start,
		stop;

		if (settings.slideshow && $related[1]) {
			clear = function () {
				clearTimeout(timeOut);
			};

			set = function () {
				if (settings.loop || $related[index + 1]) {
					timeOut = setTimeout(publicMethod.next, settings.slideshowSpeed);
				}
			};

			start = function () {
				$slideshow
					.html(settings.slideshowStop)
					.unbind(click)
					.one(click, stop);

				$events
					.bind(event_complete, set)
					.bind(event_load, clear)
					.bind(event_cleanup, stop);

				$box.removeClass(className + "off").addClass(className + "on");
			};

			stop = function () {
				clear();

				$events
					.unbind(event_complete, set)
					.unbind(event_load, clear)
					.unbind(event_cleanup, stop);

				$slideshow
					.html(settings.slideshowStart)
					.unbind(click)
					.one(click, function () {
						publicMethod.next();
						start();
					});

				$box.removeClass(className + "on").addClass(className + "off");
			};

			if (settings.slideshowAuto) {
				start();
			} else {
				stop();
			}
		} else {
			$box.removeClass(className + "off " + className + "on");
		}
	}

	function launch(target) {
		if (!closing) {

			element = target;

			makeSettings();

			$related = $(element);

			index = 0;

			if (settings.rel !== 'nofollow') {
				$related = $('.' + boxElement).filter(function () {
					var data = $.data(this, colorbox),
						relRelated;

					if (data) {
						relRelated =  $(this).data('rel') || data.rel || this.rel;
					}

					return (relRelated === settings.rel);
				});
				index = $related.index(element);

				// Check direct calls to Colorbox.
				if (index === -1) {
					$related = $related.add(element);
					index = $related.length - 1;
				}
			}

			$overlay.css({
				opacity: parseFloat(settings.opacity),
				cursor: settings.overlayClose ? "pointer" : "auto",
				visibility: 'visible'
			}).show();


			if (className) {
				$box.add($overlay).removeClass(className);
			}
			if (settings.className) {
				$box.add($overlay).addClass(settings.className);
			}
			className = settings.className;

			$close.html(settings.close).show();

			if (!open) {
				open = active = true; // Prevents the page-change action from queuing up if the visitor holds down the left or right keys.

				// Show colorbox so the sizes can be calculated in older versions of jQuery
				$box.css({visibility:'hidden', display:'block'});

				$loaded = $tag(div, 'LoadedContent', 'width:0; height:0; overflow:hidden').appendTo($content);

				// Cache values needed for size calculations
				interfaceHeight = $topBorder.height() + $bottomBorder.height() + $content.outerHeight(true) - $content.height();
				interfaceWidth = $leftBorder.width() + $rightBorder.width() + $content.outerWidth(true) - $content.width();
				loadedHeight = $loaded.outerHeight(true);
				loadedWidth = $loaded.outerWidth(true);


				// Opens inital empty Colorbox prior to content being loaded.
				settings.w = setSize(settings.initialWidth, 'x');
				settings.h = setSize(settings.initialHeight, 'y');
				publicMethod.position();

				slideshow();

				trigger(event_open, settings.onOpen);

				$groupControls.add($title).hide();

				$box.focus();

				// Confine focus to the modal
				// Uses event capturing that is not supported in IE8-
				if (document.addEventListener) {

					document.addEventListener('focus', trapFocus, true);

					$events.one(event_closed, function () {
						document.removeEventListener('focus', trapFocus, true);
					});
				}

				// Return focus on closing
				if (settings.returnFocus) {
					$events.one(event_closed, function () {
						$(element).focus();
					});
				}
			}

			load();
		}
	}

	// Colorbox's markup needs to be added to the DOM prior to being called
	// so that the browser will go ahead and load the CSS background images.
	function appendHTML() {
		if (!$box && document.body) {
			init = false;
			$window = $(window);
			$box = $tag(div).attr({
				id: colorbox,
				'class': $.support.opacity === false ? prefix + 'IE' : '', // class for optional IE8 & lower targeted CSS.
				role: 'dialog',
				tabindex: '-1'
			}).hide();
			$overlay = $tag(div, "Overlay").hide();
			$loadingOverlay = $tag(div, "LoadingOverlay").add($tag(div, "LoadingGraphic"));
			$wrap = $tag(div, "Wrapper");
			$content = $tag(div, "Content").append(
				$title = $tag(div, "Title"),
				$current = $tag(div, "Current"),
				$prev = $('<button type="button"/>').attr({id:prefix+'Previous'}),
				$next = $('<button type="button"/>').attr({id:prefix+'Next'}),
				$slideshow = $tag('button', "Slideshow"),
				$loadingOverlay,
				$close = $('<button type="button"/>').attr({id:prefix+'Close'})
			);

			$wrap.append( // The 3x3 Grid that makes up Colorbox
				$tag(div).append(
					$tag(div, "TopLeft"),
					$topBorder = $tag(div, "TopCenter"),
					$tag(div, "TopRight")
				),
				$tag(div, false, 'clear:left').append(
					$leftBorder = $tag(div, "MiddleLeft"),
					$content,
					$rightBorder = $tag(div, "MiddleRight")
				),
				$tag(div, false, 'clear:left').append(
					$tag(div, "BottomLeft"),
					$bottomBorder = $tag(div, "BottomCenter"),
					$tag(div, "BottomRight")
				)
			).find('div div').css({'float': 'left'});

			$loadingBay = $tag(div, false, 'position:absolute; width:9999px; visibility:hidden; display:none');

			$groupControls = $next.add($prev).add($current).add($slideshow);

			$(document.body).append($overlay, $box.append($wrap, $loadingBay));
		}
	}

	// Add Colorbox's event bindings
	function addBindings() {
		function clickHandler(e) {
			// ignore non-left-mouse-clicks and clicks modified with ctrl / command, shift, or alt.
			// See: http://jacklmoore.com/notes/click-events/
			if (!(e.which > 1 || e.shiftKey || e.altKey || e.metaKey || e.control)) {
				e.preventDefault();
				launch(this);
			}
		}

		if ($box) {
			if (!init) {
				init = true;

				// Anonymous functions here keep the public method from being cached, thereby allowing them to be redefined on the fly.
				$next.click(function () {
					publicMethod.next();
				});
				$prev.click(function () {
					publicMethod.prev();
				});
				$close.click(function () {
					publicMethod.close();
				});
				$overlay.click(function () {
					if (settings.overlayClose) {
						publicMethod.close();
					}
				});

				// Key Bindings
				$(document).bind('keydown.' + prefix, function (e) {
					var key = e.keyCode;
					if (open && settings.escKey && key === 27) {
						e.preventDefault();
						publicMethod.close();
					}
					if (open && settings.arrowKey && $related[1] && !e.altKey) {
						if (key === 37) {
							e.preventDefault();
							$prev.click();
						} else if (key === 39) {
							e.preventDefault();
							$next.click();
						}
					}
				});

				if ($.isFunction($.fn.on)) {
					// For jQuery 1.7+
					$(document).on('click.'+prefix, '.'+boxElement, clickHandler);
				} else {
					// For jQuery 1.3.x -> 1.6.x
					// This code is never reached in jQuery 1.9, so do not contact me about 'live' being removed.
					// This is not here for jQuery 1.9, it's here for legacy users.
					$('.'+boxElement).live('click.'+prefix, clickHandler);
				}
			}
			return true;
		}
		return false;
	}

	// Don't do anything if Colorbox already exists.
	if ($.colorbox) {
		return;
	}

	// Append the HTML when the DOM loads
	$(appendHTML);


	// ****************
	// PUBLIC FUNCTIONS
	// Usage format: $.colorbox.close();
	// Usage from within an iframe: parent.jQuery.colorbox.close();
	// ****************

	publicMethod = $.fn[colorbox] = $[colorbox] = function (options, callback) {
		var $this = this;

		options = options || {};

		appendHTML();

		if (addBindings()) {
			if ($.isFunction($this)) { // assume a call to $.colorbox
				$this = $('<a/>');
				options.open = true;
			} else if (!$this[0]) { // colorbox being applied to empty collection
				return $this;
			}

			if (callback) {
				options.onComplete = callback;
			}

			$this.each(function () {
				$.data(this, colorbox, $.extend({}, $.data(this, colorbox) || defaults, options));
			}).addClass(boxElement);

			if (($.isFunction(options.open) && options.open.call($this)) || options.open) {
				launch($this[0]);
			}
		}

		return $this;
	};

	publicMethod.position = function (speed, loadedCallback) {
		var
		css,
		top = 0,
		left = 0,
		offset = $box.offset(),
		scrollTop,
		scrollLeft;

		$window.unbind('resize.' + prefix);

		// remove the modal so that it doesn't influence the document width/height
		$box.css({top: -9e4, left: -9e4});

		scrollTop = $window.scrollTop();
		scrollLeft = $window.scrollLeft();

		if (settings.fixed) {
			offset.top -= scrollTop;
			offset.left -= scrollLeft;
			$box.css({position: 'fixed'});
		} else {
			top = scrollTop;
			left = scrollLeft;
			$box.css({position: 'absolute'});
		}

		// keeps the top and left positions within the browser's viewport.
		if (settings.right !== false) {
			left += Math.max($window.width() - settings.w - loadedWidth - interfaceWidth - setSize(settings.right, 'x'), 0);
		} else if (settings.left !== false) {
			left += setSize(settings.left, 'x');
		} else {
			left += Math.round(Math.max($window.width() - settings.w - loadedWidth - interfaceWidth, 0) / 2);
		}

		if (settings.bottom !== false) {
			top += Math.max(winheight() - settings.h - loadedHeight - interfaceHeight - setSize(settings.bottom, 'y'), 0);
		} else if (settings.top !== false) {
			top += setSize(settings.top, 'y');
		} else {
			top += Math.round(Math.max(winheight() - settings.h - loadedHeight - interfaceHeight, 0) / 2);
		}

		$box.css({top: offset.top, left: offset.left, visibility:'visible'});

		// setting the speed to 0 to reduce the delay between same-sized content.
		speed = ($box.width() === settings.w + loadedWidth && $box.height() === settings.h + loadedHeight) ? 0 : speed || 0;

		// this gives the wrapper plenty of breathing room so it's floated contents can move around smoothly,
		// but it has to be shrank down around the size of div#colorbox when it's done.  If not,
		// it can invoke an obscure IE bug when using iframes.
		$wrap[0].style.width = $wrap[0].style.height = "9999px";

		function modalDimensions(that) {
			$topBorder[0].style.width = $bottomBorder[0].style.width = $content[0].style.width = (parseInt(that.style.width,10) - interfaceWidth)+'px';
			$content[0].style.height = $leftBorder[0].style.height = $rightBorder[0].style.height = (parseInt(that.style.height,10) - interfaceHeight)+'px';
		}

		css = {width: settings.w + loadedWidth + interfaceWidth, height: settings.h + loadedHeight + interfaceHeight, top: top, left: left};

		if(speed===0){ // temporary workaround to side-step jQuery-UI 1.8 bug (http://bugs.jquery.com/ticket/12273)
			$box.css(css);
		}
		$box.dequeue().animate(css, {
			duration: speed,
			complete: function () {
				modalDimensions(this);

				active = false;

				// shrink the wrapper down to exactly the size of colorbox to avoid a bug in IE's iframe implementation.
				$wrap[0].style.width = (settings.w + loadedWidth + interfaceWidth) + "px";
				$wrap[0].style.height = (settings.h + loadedHeight + interfaceHeight) + "px";

				if (settings.reposition) {
					setTimeout(function () {  // small delay before binding onresize due to an IE8 bug.
						$window.bind('resize.' + prefix, publicMethod.position);
					}, 1);
				}

				if (loadedCallback) {
					loadedCallback();
				}
			},
			step: function () {
				modalDimensions(this);
			}
		});
	};

	publicMethod.resize = function (options) {
		if (open) {
			options = options || {};

			if (options.width) {
				settings.w = setSize(options.width, 'x') - loadedWidth - interfaceWidth;
			}
			if (options.innerWidth) {
				settings.w = setSize(options.innerWidth, 'x');
			}
			$loaded.css({width: settings.w});

			if (options.height) {
				settings.h = setSize(options.height, 'y') - loadedHeight - interfaceHeight;
			}
			if (options.innerHeight) {
				settings.h = setSize(options.innerHeight, 'y');
			}
			if (!options.innerHeight && !options.height) {
				$loaded.css({height: "auto"});
				settings.h = $loaded.height();
			}
			$loaded.css({height: settings.h});

			publicMethod.position(settings.transition === "none" ? 0 : settings.speed);
		}
	};

	publicMethod.prep = function (object) {
		if (!open) {
			return;
		}

		var callback, speed = settings.transition === "none" ? 0 : settings.speed;

		$loaded.empty().remove(); // Using empty first may prevent some IE7 issues.

		$loaded = $tag(div, 'LoadedContent').append(object);

		function getWidth() {
			settings.w = settings.w || $loaded.width();
			settings.w = settings.mw && settings.mw < settings.w ? settings.mw : settings.w;
			return settings.w;
		}
		function getHeight() {
			settings.h = settings.h || $loaded.height();
			settings.h = settings.mh && settings.mh < settings.h ? settings.mh : settings.h;
			return settings.h;
		}

		$loaded.hide()
		.appendTo($loadingBay.show())// content has to be appended to the DOM for accurate size calculations.
		.css({width: getWidth(), overflow: settings.scrolling ? 'auto' : 'hidden'})
		.css({height: getHeight()})// sets the height independently from the width in case the new width influences the value of height.
		.prependTo($content);

		$loadingBay.hide();

		// floating the IMG removes the bottom line-height and fixed a problem where IE miscalculates the width of the parent element as 100% of the document width.

		$(photo).css({'float': 'none'});

		callback = function () {
			var total = $related.length,
				iframe,
				frameBorder = 'frameBorder',
				allowTransparency = 'allowTransparency',
				complete;

			if (!open) {
				return;
			}

			function removeFilter() { // Needed for IE7 & IE8 in versions of jQuery prior to 1.7.2
				if ($.support.opacity === false) {
					$box[0].style.removeAttribute('filter');
				}
			}

			complete = function () {
				clearTimeout(loadingTimer);
				$loadingOverlay.hide();
				trigger(event_complete, settings.onComplete);
			};


			$title.html(settings.title).add($loaded).show();

			if (total > 1) { // handle grouping
				if (typeof settings.current === "string") {
					$current.html(settings.current.replace('{current}', index + 1).replace('{total}', total)).show();
				}

				$next[(settings.loop || index < total - 1) ? "show" : "hide"]().html(settings.next);
				$prev[(settings.loop || index) ? "show" : "hide"]().html(settings.previous);

				if (settings.slideshow) {
					$slideshow.show();
				}

				// Preloads images within a rel group
				if (settings.preloading) {
					$.each([getIndex(-1), getIndex(1)], function(){
						var src,
							img,
							i = $related[this],
							data = $.data(i, colorbox);

						if (data && data.href) {
							src = data.href;
							if ($.isFunction(src)) {
								src = src.call(i);
							}
						} else {
							src = $(i).attr('href');
						}

						if (src && isImage(data, src)) {
							src = retinaUrl(data, src);
							img = new Image();
							img.src = src;
						}
					});
				}
			} else {
				$groupControls.hide();
			}

			if (settings.iframe) {
				iframe = $tag('iframe')[0];

				if (frameBorder in iframe) {
					iframe[frameBorder] = 0;
				}

				if (allowTransparency in iframe) {
					iframe[allowTransparency] = "true";
				}

				if (!settings.scrolling) {
					iframe.scrolling = "no";
				}

				$(iframe)
					.attr({
						src: settings.href,
						name: (new Date()).getTime(), // give the iframe a unique name to prevent caching
						'class': prefix + 'Iframe',
						allowFullScreen : true, // allow HTML5 video to go fullscreen
						webkitAllowFullScreen : true,
						mozallowfullscreen : true
					})
					.one('load', complete)
					.appendTo($loaded);

				$events.one(event_purge, function () {
					iframe.src = "//about:blank";
				});

				if (settings.fastIframe) {
					$(iframe).trigger('load');
				}
			} else {
				complete();
			}

			if (settings.transition === 'fade') {
				$box.fadeTo(speed, 1, removeFilter);
			} else {
				removeFilter();
			}
		};

		if (settings.transition === 'fade') {
			$box.fadeTo(speed, 0, function () {
				publicMethod.position(0, callback);
			});
		} else {
			publicMethod.position(speed, callback);
		}
	};

	function load () {
		var href, setResize, prep = publicMethod.prep, $inline, request = ++requests;

		active = true;

		photo = false;

		element = $related[index];

		makeSettings();

		trigger(event_purge);

		trigger(event_load, settings.onLoad);

		settings.h = settings.height ?
				setSize(settings.height, 'y') - loadedHeight - interfaceHeight :
				settings.innerHeight && setSize(settings.innerHeight, 'y');

		settings.w = settings.width ?
				setSize(settings.width, 'x') - loadedWidth - interfaceWidth :
				settings.innerWidth && setSize(settings.innerWidth, 'x');

		// Sets the minimum dimensions for use in image scaling
		settings.mw = settings.w;
		settings.mh = settings.h;

		// Re-evaluate the minimum width and height based on maxWidth and maxHeight values.
		// If the width or height exceed the maxWidth or maxHeight, use the maximum values instead.
		if (settings.maxWidth) {
			settings.mw = setSize(settings.maxWidth, 'x') - loadedWidth - interfaceWidth;
			settings.mw = settings.w && settings.w < settings.mw ? settings.w : settings.mw;
		}
		if (settings.maxHeight) {
			settings.mh = setSize(settings.maxHeight, 'y') - loadedHeight - interfaceHeight;
			settings.mh = settings.h && settings.h < settings.mh ? settings.h : settings.mh;
		}

		href = settings.href;

		loadingTimer = setTimeout(function () {
			$loadingOverlay.show();
		}, 100);

		if (settings.inline) {
			// Inserts an empty placeholder where inline content is being pulled from.
			// An event is bound to put inline content back when Colorbox closes or loads new content.
			$inline = $tag(div).hide().insertBefore($(href)[0]);

			$events.one(event_purge, function () {
				$inline.replaceWith($loaded.children());
			});

			prep($(href));
		} else if (settings.iframe) {
			// IFrame element won't be added to the DOM until it is ready to be displayed,
			// to avoid problems with DOM-ready JS that might be trying to run in that iframe.
			prep(" ");
		} else if (settings.html) {
			prep(settings.html);
		} else if (isImage(settings, href)) {

			href = retinaUrl(settings, href);

			$(photo = new Image())
			.addClass(prefix + 'Photo')
			.bind('error',function () {
				settings.title = false;
				prep($tag(div, 'Error').html(settings.imgError));
			})
			.one('load', function () {
				var percent;

				if (request !== requests) {
					return;
				}

				photo.alt = $(element).attr('alt') || $(element).attr('data-alt') || '';
				photo.longdesc = $(element).attr('longdesc');

				if (settings.retinaImage && window.devicePixelRatio > 1) {
					photo.height = photo.height / window.devicePixelRatio;
					photo.width = photo.width / window.devicePixelRatio;
				}

				if (settings.scalePhotos) {
					setResize = function () {
						photo.height -= photo.height * percent;
						photo.width -= photo.width * percent;
					};
					if (settings.mw && photo.width > settings.mw) {
						percent = (photo.width - settings.mw) / photo.width;
						setResize();
					}
					if (settings.mh && photo.height > settings.mh) {
						percent = (photo.height - settings.mh) / photo.height;
						setResize();
					}
				}

				if (settings.h) {
					photo.style.marginTop = Math.max(settings.mh - photo.height, 0) / 2 + 'px';
				}

				if ($related[1] && (settings.loop || $related[index + 1])) {
					photo.style.cursor = 'pointer';
					photo.onclick = function () {
						publicMethod.next();
					};
				}

				photo.style.width = photo.width + 'px';
				photo.style.height = photo.height + 'px';

				setTimeout(function () { // A pause because Chrome will sometimes report a 0 by 0 size otherwise.
					prep(photo);
				}, 1);
			});

			setTimeout(function () { // A pause because Opera 10.6+ will sometimes not run the onload function otherwise.
				photo.src = href;
			}, 1);
		} else if (href) {
			$loadingBay.load(href, settings.data, function (data, status) {
				if (request === requests) {
					prep(status === 'error' ? $tag(div, 'Error').html(settings.xhrError) : $(this).contents());
				}
			});
		}
	}

	// Navigates to the next page/image in a set.
	publicMethod.next = function () {
		if (!active && $related[1] && (settings.loop || $related[index + 1])) {
			index = getIndex(1);
			launch($related[index]);
		}
	};

	publicMethod.prev = function () {
		if (!active && $related[1] && (settings.loop || index)) {
			index = getIndex(-1);
			launch($related[index]);
		}
	};

	// Note: to use this within an iframe use the following format: parent.jQuery.colorbox.close();
	publicMethod.close = function () {
		if (open && !closing) {

			closing = true;

			open = false;

			trigger(event_cleanup, settings.onCleanup);

			$window.unbind('.' + prefix);

			$overlay.fadeTo(200, 0);

			$box.stop().fadeTo(300, 0, function () {

				$box.add($overlay).css({'opacity': 1, cursor: 'auto'}).hide();

				trigger(event_purge);

				$loaded.empty().remove(); // Using empty first may prevent some IE7 issues.

				setTimeout(function () {
					closing = false;
					trigger(event_closed, settings.onClosed);
				}, 1);
			});
		}
	};

	// Removes changes Colorbox made to the document, but does not remove the plugin.
	publicMethod.remove = function () {
		if (!$box) { return; }

		$box.stop();
		$.colorbox.close();
		$box.stop().remove();
		$overlay.remove();
		closing = false;
		$box = null;
		$('.' + boxElement)
			.removeData(colorbox)
			.removeClass(boxElement);

		$(document).unbind('click.'+prefix);
	};

	// A method for fetching the current element Colorbox is referencing.
	// returns a jQuery object.
	publicMethod.element = function () {
		return $(element);
	};

	publicMethod.settings = defaults;

}(jQuery, document, window));

$( document ).ready( function()
{

	function maybeCall(thing, ctx) {
		return (typeof thing == 'function') ? (thing.call(ctx)) : thing;
	}

	// CAUTION the current implementation does not allow for tipsied elements to stay out of DOM (in between events)
	// i.e. don't remove, store, then re-insert tipsied elements (and why would you want to do that anyway?)
	var garbageCollect = (function() {
		var currentInterval;
		var to = null;
		var tipsies = [];

		function _do() {
			for (var i = 0; i < tipsies.length;) {
				var t = tipsies[i];
				// FIXME? the 2nd (non-paranoid) check is from the link below, it should be replaced if a better way is found
				// http://stackoverflow.com/questions/4040715/check-if-cached-jquery-object-is-still-in-dom
				if (t.options.gcInterval === 0 || t.$element.closest('body').length === 0) {
					t.hoverState = 'out';
					t.hide();
					tipsies.splice(i,1);
				} else {
					i++;
				}
			}
		}
		function _loop() {
			to = setTimeout(function() { _do(); _loop(); }, currentInterval);
		}

		return function(t) {
			if (t.options.gcInterval === 0) return;

			if (to && t.options.gcInterval < currentInterval) {
				clearTimeout(to); to = null;
				currentInterval = t.options.gcInterval;
			}
			tipsies.push(t);
			if (!to) _loop();
		};
	})();

	function Tipsy(element, options) {
		this.$element = $(element);
		this.options = options;
		this.enabled = true;
		this.fixTitle();
		garbageCollect(this);
	}


	Tipsy.prototype = {
		show: function() {
			var title = this.getTitle();
			if (title && this.enabled) {
				var $tip = this.tip();

				$tip.find('.tipsy-inner')[this.options.html ? 'html' : 'text'](title);
				$tip[0].className = 'tipsy'; // reset classname in case of dynamic gravity
				$tip.remove().css({top: 0, left: 0, visibility: 'hidden', display: 'block'}).prependTo(document.body);

				var pos = $.extend({}, this.$element.offset(), {
					width: this.$element[0].offsetWidth || 0,
					height: this.$element[0].offsetHeight || 0
				});

				if (typeof this.$element[0].nearestViewportElement == 'svg') {
					// SVG
					var el = this.$element[0];
					var rect = el.getBoundingClientRect();
					pos.width = rect.width;
					pos.height = rect.height;
				}


				var actualWidth = $tip[0].offsetWidth,
					actualHeight = $tip[0].offsetHeight,
					gravity = maybeCall(this.options.gravity, this.$element[0]);

				var tp;
				switch (gravity.charAt(0)) {
					case 'n':
						tp = {top: pos.top + pos.height + this.options.offset, left: pos.left + pos.width / 2 - actualWidth / 2};
						break;
					case 's':
						tp = {top: pos.top - actualHeight - this.options.offset, left: pos.left + pos.width / 2 - actualWidth / 2};
						break;
					case 'e':
						tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left - actualWidth - this.options.offset};
						break;
					case 'w':
						tp = {top: pos.top + pos.height / 2 - actualHeight / 2, left: pos.left + pos.width + this.options.offset};
						break;
				}

				if (gravity.length == 2) {
					if (gravity.charAt(1) == 'w') {
						tp.left = pos.left + pos.width / 2 - 15;
					} else {
						tp.left = pos.left + pos.width / 2 - actualWidth + 15;
					}
				}

				$tip.css(tp).addClass('tipsy-' + gravity);
				$tip.find('.tipsy-arrow')[0].className = 'tipsy-arrow tipsy-arrow-' + gravity.charAt(0);
				if (this.options.className) {
					$tip.addClass(maybeCall(this.options.className, this.$element[0]));
				}

				if (this.options.fade) {
					$tip.stop().css({opacity: 0, display: 'block', visibility: 'visible'}).animate({opacity: this.options.opacity});
				} else {
					$tip.css({visibility: 'visible', opacity: this.options.opacity});
				}

				$tip.css({'z-index':this.options.zIndex});

				var t = this;
				var set_hovered  = function(set_hover){
					return function(){
						t.$tip.stop();
						t.tipHovered = set_hover;
						if (!set_hover){
							if (t.options.delayOut === 0 && t.options.trigger != 'manual') {
								t.hide();
							} else {
								setTimeout(function() {
									if (t.hoverState == 'out') t.hide(); }, t.options.delayOut);
							}
						}
					};
				};
   			$tip.hover(set_hovered(true), set_hovered(false));
			}
		},

		hide: function() {
			if (this.options.fade) {
				this.tip().stop().fadeOut(function() { $(this).remove(); });
			} else {
				if (this.options.cancelHide == null || !this.options.cancelHide()){
						this.tip().remove();
				}
			}
		},

		fixTitle: function() {
			var $e = this.$element;

			if ($e.attr('title') || typeof($e.attr('original-title')) != 'string') {
				$e.attr('original-title', $e.attr('title') || '').removeAttr('title');
			}
			if (typeof $e.context.nearestViewportElement == 'object'){
				if ($e.children('title').length){
					$e.append('<original-title>' + ($e.children('title').text() || '') + '</original-title>')
						.children('title').remove();
				}
			}
		},

		getTitle: function() {

			var title, $e = this.$element, o = this.options;
			this.fixTitle();

			if (typeof o.title == 'string') {
				var title_name = o.title == 'title' ? 'original-title' : o.title;
				if ($e.children(title_name).length){
					title = $e.children(title_name).html();
				} else{
					title = $e.attr(title_name);
					if (typeof title == 'undefined') title = ''
				}

			} else if (typeof o.title == 'function') {
				title = o.title.call($e[0]);
			}
			title = ('' + title).replace(/(^\s*|\s*$)/, "");
			return title || o.fallback;
		},

		tip: function() {
			if (!this.$tip) {
				this.$tip = $('<div class="tipsy"></div>').html('<div class="tipsy-arrow"></div><div class="tipsy-inner"></div>');
			}
			return this.$tip;
		},

		validate: function() {
			if (!this.$element[0].parentNode) {
				this.hide();
				this.$element = null;
				this.options = null;
			}
		},

		enable: function() { this.enabled = true; },
		disable: function() { this.enabled = false; },
		toggleEnabled: function() { this.enabled = !this.enabled; }
	};

	$.fn.tipsy = function(options) {

		if (options === true) {
			return this.data('tipsy');
		} else if (typeof options == 'string') {
			$(this).each(function(i,el){
  			if ($(el).data('tipsy')) {
  				tipsy = $(el).data('tipsy')
  				tipsy[options]();
  			}
			});
			return this;
		}

		options = $.extend({}, $.fn.tipsy.defaults, options);

		if (options.hoverlock && options.delayOut === 0) {
			options.delayOut = 100;
		}

		function get(ele) {
			var tipsy = $.data(ele, 'tipsy');
			if (!tipsy) {
				tipsy = new Tipsy(ele, $.fn.tipsy.elementOptions(ele, options));
				$.data(ele, 'tipsy', tipsy);
			}
			return tipsy;
		}

		function enter() {
			var tipsy = get(this);
			tipsy.hoverState = 'in';
			if (options.delayIn === 0) {
				tipsy.show();
			} else {
				tipsy.fixTitle();
				setTimeout(function() { if (tipsy.hoverState == 'in') tipsy.show(); }, options.delayIn);
			}
		}

		function leave() {
			var tipsy = get(this);
			tipsy.hoverState = 'out';
			if (options.delayOut === 0) {
				tipsy.hide();
			} else {
				var to = function() {
					if (!tipsy.tipHovered || !options.hoverlock){
						if (tipsy.hoverState == 'out') tipsy.hide();
					}
				};
				setTimeout(to, options.delayOut);
			}
		}

		if (!options.live) this.each(function() { get(this); });

		if (options.trigger != 'manual') {
			var binder = options.live ? 'live' : 'bind',
				eventIn = options.trigger == 'hover' ? 'mouseenter' : 'focus',
				eventOut = options.trigger == 'hover' ? 'mouseleave' : 'blur';
			this[binder](eventIn, enter)[binder](eventOut, leave);
		}

		return this;

	};

	$.fn.tipsy.defaults = {
		className: null,
		delayIn: 0,
		delayOut: 0,
		fade: false,
		'zIndex': 100000,
		fallback: '',
		cancelHide: null,
		gcInterval: 0,
		gravity: 'n',
		html: false,
		live: false,
		offset: 0,
		opacity: 0.8,
		title: 'title',
		trigger: 'hover',
		hoverlock: false
	};

	// Overwrite this method to provide options on a per-element basis.
	// For example, you could store the gravity in a 'tipsy-gravity' attribute:
	// return $.extend({}, options, {gravity: $(ele).attr('tipsy-gravity') || 'n' });
	// (remember - do not modify 'options' in place!)
	$.fn.tipsy.elementOptions = function(ele, options) {
		return $.metadata ? $.extend({}, options, $(ele).metadata()) : options;
	};

	$.fn.tipsy.autoNS = function() {
		return $(this).offset().top > ($(document).scrollTop() + $(window).height() / 2) ? 's' : 'n';
	};

	$.fn.tipsy.autoWE = function() {
		return $(this).offset().left > ($(document).scrollLeft() + $(window).width() / 2) ? 'e' : 'w';
	};
	$.fn.tipsy.autoNWNE = function() {
		return $(this).offset().left > ($(document).scrollLeft() + $(window).width() / 2) ? 'ne' : 'nw';
	};
	$.fn.tipsy.autoSWSE = function() {
		return $(this).offset().left > ($(document).scrollLeft() + $(window).width() / 2) ? 'se' : 'sw';
	};


	/**
 	* yields a closure of the supplied parameters, producing a function that takes
 	* no arguments and is suitable for use as an autogravity function like so:
 	*
 	* @param margin (int) - distance from the viewable region edge that an
 	*		element should be before setting its tooltip's gravity to be away
 	*		from that edge.
 	* @param prefer (string, e.g. 'n', 'sw', 'w') - the direction to prefer
 	*		if there are no viewable region edges effecting the tooltip's
 	*		gravity. It will try to vary from this minimally, for example,
 	*		if 'sw' is preferred and an element is near the right viewable
 	*		region edge, but not the top edge, it will set the gravity for
 	*		that element's tooltip to be 'se', preserving the southern
 	*		component.
 	*/
 	$.fn.tipsy.autoBounds = function(margin, prefer) {
		return function() {
			var dir = {ns: prefer[0], ew: (prefer.length > 1 ? prefer[1] : false)},
				boundTop = $(document).scrollTop() + margin,
				boundLeft = $(document).scrollLeft() + margin,
				$this = $(this);

			if ($this.offset().top < boundTop) dir.ns = 'n';
			if ($this.offset().left < boundLeft) dir.ew = 'w';
			if ($(window).width() + $(document).scrollLeft() - $this.offset().left < margin) dir.ew = 'e';
			if ($(window).height() + $(document).scrollTop() - $this.offset().top < margin) dir.ns = 's';

			return dir.ns + (dir.ew ? dir.ew : '');
		};
	};

});
/*jslint eqeq: true, plusplus: true, undef: true, sloppy: true, vars: true, forin: true, nomen: true */
/*!
 * jQuery MobiScroll v2.6.2
 * http://mobiscroll.com
 *
 * Copyright 2010-2013, Acid Media
 * Licensed under the MIT license.
 *
 */
(function ($) {

	function Scroller(elem, settings) {
		var m,
			hi,
			v,
			dw,
			ww, // Window width
			wh, // Window height
			rwh,
			mw, // Modal width
			mh, // Modal height
			lock,
			anim,
			debounce,
			theme,
			lang,
			click,
			scrollable,
			moved,
			start,
			startTime,
			stop,
			p,
			min,
			max,
			target,
			index,
			timer,
			readOnly,
			preventShow,
			that = this,
			ms = $.mobiscroll,
			e = elem,
			elm = $(e),
			s = extend({}, defaults),
			pres = {},
			iv = {},
			pos = {},
			pixels = {},
			wheels = [],
			input = elm.is('input'),
			visible = false,
			onStart = function (e) {
				// Scroll start
				if (testTouch(e) && !move && !isReadOnly(this) && !click) {
					// Prevent scroll
					e.preventDefault();

					move = true;
					scrollable = s.mode != 'clickpick';
					target = $('.dw-ul', this);
					setGlobals(target);
					moved = iv[index] !== undefined; // Don't allow tap, if still moving
					p = moved ? getCurrentPosition(target) : pos[index];
					start = getCoord(e, 'Y');
					startTime = new Date();
					stop = start;
					scroll(target, index, p, 0.001);

					if (scrollable) {
						target.closest('.dwwl').addClass('dwa');
					}

					$(document).on(MOVE_EVENT, onMove).on(END_EVENT, onEnd);
				}
			},
			onMove = function (e) {
				if (scrollable) {
					e.preventDefault();
					e.stopPropagation();
					stop = getCoord(e, 'Y');
					scroll(target, index, constrain(p + (start - stop) / hi, min - 1, max + 1));
				}
				moved = true;
			},
			onEnd = function (e) {
				var time = new Date() - startTime,
					val = constrain(p + (start - stop) / hi, min - 1, max + 1),
					speed,
					dist,
					tindex,
					ttop = target.offset().top;

				if (time < 300) {
					speed = (stop - start) / time;
					dist = (speed * speed) / s.speedUnit;
					if (stop - start < 0) {
						dist = -dist;
					}
				} else {
					dist = stop - start;
				}

				tindex = Math.round(p - dist / hi);

				if (!dist && !moved) { // this is a "tap"
					var idx = Math.floor((stop - ttop) / hi),
						li = $('.dw-li', target).eq(idx),
						hl = scrollable;

					if (event('onValueTap', [li]) !== false) {
						tindex = idx;
					} else {
						hl = true;
					}

					if (hl) {
						li.addClass('dw-hl'); // Highlight
						setTimeout(function () {
							li.removeClass('dw-hl');
						}, 200);
					}
				}

				if (scrollable) {
					calc(target, tindex, 0, true, Math.round(val));
				}

				move = false;
				target = null;

				$(document).off(MOVE_EVENT, onMove).off(END_EVENT, onEnd);
			},
			onBtnStart = function (e) {
				var btn = $(this);
				$(document).on(END_EVENT, onBtnEnd);
				// Active button
				if (!btn.hasClass('dwb-d')) {
					btn.addClass('dwb-a');
				}
				setTimeout(function () { btn.blur(); }, 10);
				// +/- buttons
				if (btn.hasClass('dwwb')) {
					if (testTouch(e)) {
						step(e, btn.closest('.dwwl'), btn.hasClass('dwwbp') ? plus : minus);
					}
				}
			},
			onBtnEnd = function (e) {
				if (click) {
					clearInterval(timer);
					click = false;
				}
				$(document).off(END_EVENT, onBtnEnd);
				$('.dwb-a', dw).removeClass('dwb-a');
			},
			onKeyDown = function (e) {
				if (e.keyCode == 38) { // up
					step(e, $(this), minus);
				} else if (e.keyCode == 40) { // down
					step(e, $(this), plus);
				}
			},
			onKeyUp = function (e) {
				if (click) {
					clearInterval(timer);
					click = false;
				}
			},
			onScroll = function (e) {
				if (!isReadOnly(this)) {
					e.preventDefault();
					e = e.originalEvent || e;
					var delta = e.wheelDelta ? (e.wheelDelta / 120) : (e.detail ? (-e.detail / 3) : 0),
						t = $('.dw-ul', this);

					setGlobals(t);
					calc(t, Math.round(pos[index] - delta), delta < 0 ? 1 : 2);
				}
			};

		// Private functions

		function step(e, w, func) {
			e.stopPropagation();
			e.preventDefault();
			if (!click && !isReadOnly(w) && !w.hasClass('dwa')) {
				click = true;
				// + Button
				var t = w.find('.dw-ul');

				setGlobals(t);
				clearInterval(timer);
				timer = setInterval(function () { func(t); }, s.delay);
				func(t);
			}
		}

		function isReadOnly(wh) {
			if ($.isArray(s.readonly)) {
				var i = $('.dwwl', dw).index(wh);
				return s.readonly[i];
			}
			return s.readonly;
		}

		function generateWheelItems(i) {
			var html = '<div class="dw-bf">',
				ww = wheels[i],
				w = ww.values ? ww : convert(ww),
				l = 1,
				labels = w.labels || [],
				values = w.values,
				keys = w.keys || values;

			$.each(values, function (j, v) {
				if (l % 20 == 0) {
					html += '</div><div class="dw-bf">';
				}
				html += '<div role="option" aria-selected="false" class="dw-li dw-v" data-val="' + keys[j] + '"' + (labels[j] ? ' aria-label="' + labels[j] + '"' : '') + ' style="height:' + hi + 'px;line-height:' + hi + 'px;"><div class="dw-i">' + v + '</div></div>';
				l++;
			});

			html += '</div>';
			return html;
		}

		function setGlobals(t) {
			min = $('.dw-li', t).index($('.dw-v', t).eq(0));
			max = $('.dw-li', t).index($('.dw-v', t).eq(-1));
			index = $('.dw-ul', dw).index(t);
		}

		function formatHeader(v) {
			var t = s.headerText;
			return t ? (typeof t === 'function' ? t.call(e, v) : t.replace(/\{value\}/i, v)) : '';
		}

		function read() {
			that.temp = ((input && that.val !== null && that.val != elm.val()) || that.values === null) ? s.parseValue(elm.val() || '', that) : that.values.slice(0);
			setVal();
		}

		function getCurrentPosition(t) {
			var style = window.getComputedStyle ? getComputedStyle(t[0]) : t[0].style,
				matrix,
				px;

			if (has3d) {
				$.each(['t', 'webkitT', 'MozT', 'OT', 'msT'], function (i, v) {
					if (style[v + 'ransform'] !== undefined) {
						matrix = style[v + 'ransform'];
						return false;
					}
				});
				matrix = matrix.split(')')[0].split(', ');
				px = matrix[13] || matrix[5];
			} else {
				px = style.top.replace('px', '');
			}

			return Math.round(m - (px / hi));
		}

		function ready(t, i) {
			clearTimeout(iv[i]);
			delete iv[i];
			t.closest('.dwwl').removeClass('dwa');
		}

		function scroll(t, index, val, time, active) {

			var px = (m - val) * hi,
				style = t[0].style,
				i;

			if (px == pixels[index] && iv[index]) {
				return;
			}

			if (time && px != pixels[index]) {
				// Trigger animation start event
				event('onAnimStart', [dw, index, time]);
			}

			pixels[index] = px;

			style[pr + 'Transition'] = 'all ' + (time ? time.toFixed(3) : 0) + 's ease-out';

			if (has3d) {
				style[pr + 'Transform'] = 'translate3d(0,' + px + 'px,0)';
			} else {
				style.top = px + 'px';
			}

			if (iv[index]) {
				ready(t, index);
			}

			if (time && active) {
				t.closest('.dwwl').addClass('dwa');
				iv[index] = setTimeout(function () {
					ready(t, index);
				}, time * 1000);
			}

			pos[index] = val;
		}

		function scrollToPos(time, index, manual, dir, active) {

			// Call validation event
			if (event('validate', [dw, index, time]) !== false) {

				// Set scrollers to position
				$('.dw-ul', dw).each(function (i) {
					var t = $(this),
						cell = $('.dw-li[data-val="' + that.temp[i] + '"]', t),
						cells = $('.dw-li', t),
						v = cells.index(cell),
						l = cells.length,
						sc = i == index || index === undefined;

					// Scroll to a valid cell
					if (!cell.hasClass('dw-v')) {
						var cell1 = cell,
							cell2 = cell,
							dist1 = 0,
							dist2 = 0;

						while (v - dist1 >= 0 && !cell1.hasClass('dw-v')) {
							dist1++;
							cell1 = cells.eq(v - dist1);
						}

						while (v + dist2 < l && !cell2.hasClass('dw-v')) {
							dist2++;
							cell2 = cells.eq(v + dist2);
						}

						// If we have direction (+/- or mouse wheel), the distance does not count
						if (((dist2 < dist1 && dist2 && dir !== 2) || !dist1 || (v - dist1 < 0) || dir == 1) && cell2.hasClass('dw-v')) {
							cell = cell2;
							v = v + dist2;
						} else {
							cell = cell1;
							v = v - dist1;
						}
					}

					if (!(cell.hasClass('dw-sel')) || sc) {
						// Set valid value
						that.temp[i] = cell.attr('data-val');

						// Add selected class to cell
						$('.dw-sel', t).removeClass('dw-sel');

						if (!s.multiple) {
							$('.dw-sel', t).removeAttr('aria-selected');
							cell.attr('aria-selected', 'true');
						}

						cell.addClass('dw-sel');

						// Scroll to position
						scroll(t, i, v, sc ? time : 0.1, sc ? active : false);
					}
				});

				// Reformat value if validation changed something
				v = s.formatResult(that.temp);
				if (s.display == 'inline') {
					setVal(manual, 0, true);
				} else {
					$('.dwv', dw).html(formatHeader(v));
				}

				if (manual) {
					event('onChange', [v]);
				}
			}

		}

		function event(name, args) {
			var ret;
			args.push(that);
			$.each([theme.defaults, pres, settings], function (i, v) {
				if (v[name]) { // Call preset event
					ret = v[name].apply(e, args);
				}
			});
			return ret;
		}

		function calc(t, val, dir, anim, orig) {
			val = constrain(val, min, max);

			var cell = $('.dw-li', t).eq(val),
				o = orig === undefined ? val : orig,
				idx = index,
				time = anim ? (val == o ? 0.1 : Math.abs((val - o) * s.timeUnit)) : 0;

			// Set selected scroller value
			that.temp[idx] = cell.attr('data-val');

			scroll(t, idx, val, time, orig);

			setTimeout(function () {
				// Validate
				scrollToPos(time, idx, true, dir, orig !== undefined);
			}, 10);
		}

		function plus(t) {
			var val = pos[index] + 1;
			calc(t, val > max ? min : val, 1, true);
		}

		function minus(t) {
			var val = pos[index] - 1;
			calc(t, val < min ? max : val, 2, true);
		}

		function setVal(fill, time, noscroll, temp) {

			if (visible && !noscroll) {
				scrollToPos(time);
			}

			v = s.formatResult(that.temp);

			if (!temp) {
				that.values = that.temp.slice(0);
				that.val = v;
			}

			if (fill) {
				if (input) {
					elm.val(v).trigger('change');
				}
			}
		}

		// Public functions

		that.position = function (check) {

			if (s.display == 'inline' || (ww === $(window).width() && rwh === $(window).height() && check) || (event('onPosition', [dw]) === false)) {
				return;
			}

			var w,
				l,
				t,
				aw, // anchor width
				ah, // anchor height
				ap, // anchor position
				at, // anchor top
				al, // anchor left
				arr, // arrow
				arrw, // arrow width
				arrl, // arrow left
				scroll,
				totalw = 0,
				minw = 0,
				st = $(window).scrollTop(),
				wr = $('.dwwr', dw),
				d = $('.dw', dw),
				css = {},
				anchor = s.anchor === undefined ? elm : s.anchor;

			ww = $(window).width();
			rwh = $(window).height();
			wh = window.innerHeight; // on iOS we need innerHeight
			wh = wh || rwh;

			if (/modal|bubble/.test(s.display)) {
				$('.dwc', dw).each(function () {
					w = $(this).outerWidth(true);
					totalw += w;
					minw = (w > minw) ? w : minw;
				});
				w = totalw > ww ? minw : totalw;
				wr.width(w).css('white-space', totalw > ww ? '' : 'nowrap');
			}

			mw = d.outerWidth();
			mh = d.outerHeight(true);

			lock = mh <= wh && mw <= ww;

			if (s.display == 'modal') {
				l = (ww - mw) / 2;
				t = st + (wh - mh) / 2;
			} else if (s.display == 'bubble') {
				scroll = true;
				arr = $('.dw-arrw-i', dw);
				ap = anchor.offset();
				at = ap.top;
				al = ap.left;

				// horizontal positioning
				aw = anchor.outerWidth();
				ah = anchor.outerHeight();
				l = al - (d.outerWidth(true) - aw) / 2;
				l = l > (ww - mw) ? (ww - (mw + 20)) : l;
				l = l >= 0 ? l : 20;

				// vertical positioning
				t = at - mh; // above the input
				if ((t < st) || (at > st + wh)) { // if doesn't fit above or the input is out of the screen
					d.removeClass('dw-bubble-top').addClass('dw-bubble-bottom');
					t = at + ah; // below the input
				} else {
					d.removeClass('dw-bubble-bottom').addClass('dw-bubble-top');
				}

				// Calculate Arrow position
				arrw = arr.outerWidth();
				arrl = al + aw / 2 - (l + (mw - arrw) / 2);

				// Limit Arrow position
				$('.dw-arr', dw).css({ left: constrain(arrl, 0, arrw) });
			} else {
				css.width = '100%';
				if (s.display == 'top') {
					t = st;
				} else if (s.display == 'bottom') {
					t = st + wh - mh;
				}
			}

			css.top = t < 0 ? 0 : t;
			css.left = l;
			d.css(css);

			// If top + modal height > doc height, increase doc height
			$('.dw-persp', dw).height(0).height(t + mh > $(document).height() ? t + mh : $(document).height());

			// Scroll needed
			if (scroll && ((t + mh > st + wh) || (at > st + wh))) {
				$(window).scrollTop(t + mh - wh);
			}
		};

		/**
		* Enables the scroller and the associated input.
		*/
		that.enable = function () {
			s.disabled = false;
			if (input) {
				elm.prop('disabled', false);
			}
		};

		/**
		* Disables the scroller and the associated input.
		*/
		that.disable = function () {
			s.disabled = true;
			if (input) {
				elm.prop('disabled', true);
			}
		};

		/**
		* Gets the selected wheel values, formats it, and set the value of the scroller instance.
		* If input parameter is true, populates the associated input element.
		* @param {Array} values - Wheel values.
		* @param {Boolean} [fill=false] - Also set the value of the associated input element.
		* @param {Number} [time=0] - Animation time
		* @param {Boolean} [temp=false] - If true, then only set the temporary value.(only scroll there but not set the value)
		*/
		that.setValue = function (values, fill, time, temp) {
			that.temp = $.isArray(values) ? values.slice(0) : s.parseValue.call(e, values + '', that);
			setVal(fill, time, false, temp);
		};

		that.getValue = function () {
			return that.values;
		};

		that.getValues = function () {
			var ret = [],
				i;

			for (i in that._selectedValues) {
				ret.push(that._selectedValues[i]);
			}
			return ret;
		};

		/**
		* Changes the values of a wheel, and scrolls to the correct position
		*/
		that.changeWheel = function (idx, time) {
			if (dw) {
				var i = 0,
					nr = idx.length;

				$.each(s.wheels, function (j, wg) {
					$.each(wg, function (k, w) {
						if ($.inArray(i, idx) > -1) {
							wheels[i] = w;
							$('.dw-ul', dw).eq(i).html(generateWheelItems(i));
							nr--;
							if (!nr) {
								that.position();
								scrollToPos(time, undefined, true);
								return false;
							}
						}
						i++;
					});
					if (!nr) {
						return false;
					}
				});
			}
		};

		/**
		* Return true if the scroller is currently visible.
		*/
		that.isVisible = function () {
			return visible;
		};

		that.tap = function (el, handler) {
			var startX,
				startY;

			if (s.tap) {
				el.on('touchstart.dw', function (e) {
					e.preventDefault();
					startX = getCoord(e, 'X');
					startY = getCoord(e, 'Y');
				}).on('touchend.dw', function (e) {
					// If movement is less than 20px, fire the click event handler
					if (Math.abs(getCoord(e, 'X') - startX) < 20 && Math.abs(getCoord(e, 'Y') - startY) < 20) {
						handler.call(this, e);
					}
					tap = true;
					setTimeout(function () {
						tap = false;
					}, 300);
				});
			}

			el.on('click.dw', function (e) {
				if (!tap) {
					// If handler was not called on touchend, call it on click;
					handler.call(this, e);
				}
			});

		};

		/**
		* Shows the scroller instance.
		* @param {Boolean} prevAnim - Prevent animation if true
		*/
		that.show = function (prevAnim) {
			if (s.disabled || visible) {
				return false;
			}

			if (s.display == 'top') {
				anim = 'slidedown';
			}

			if (s.display == 'bottom') {
				anim = 'slideup';
			}

			// Parse value from input
			read();

			event('onBeforeShow', []);

			// Create wheels
			var lbl,
				l = 0,
				mAnim = '';

			if (anim && !prevAnim) {
				mAnim = 'dw-' + anim + ' dw-in';
			}
			// Create wheels containers
			var html = '<div role="dialog" class="' + s.theme + ' dw-' + s.display + (prefix ? ' dw' + prefix : '') + '">' + (s.display == 'inline' ? '<div class="dw dwbg dwi"><div class="dwwr">' : '<div class="dw-persp"><div class="dwo"></div><div class="dw dwbg ' + mAnim + '"><div class="dw-arrw"><div class="dw-arrw-i"><div class="dw-arr"></div></div></div><div class="dwwr"><div aria-live="assertive" class="dwv' + (s.headerText ? '' : ' dw-hidden') + '"></div>') + '<div class="dwcc">';

			$.each(s.wheels, function (i, wg) { // Wheel groups
				html += '<div class="dwc' + (s.mode != 'scroller' ? ' dwpm' : ' dwsc') + (s.showLabel ? '' : ' dwhl') + '"><div class="dwwc dwrc"><table cellpadding="0" cellspacing="0"><tr>';
				$.each(wg, function (j, w) { // Wheels
					wheels[l] = w;
					lbl = w.label !== undefined ? w.label : j;
					html += '<td><div class="dwwl dwrc dwwl' + l + '">' + (s.mode != 'scroller' ? '<div class="dwb-e dwwb dwwbp" style="height:' + hi + 'px;line-height:' + hi + 'px;"><span>+</span></div><div class="dwb-e dwwb dwwbm" style="height:' + hi + 'px;line-height:' + hi + 'px;"><span>&ndash;</span></div>' : '') + '<div class="dwl">' + lbl + '</div><div tabindex="0" aria-live="off" aria-label="' + lbl + '" role="listbox" class="dwww"><div class="dww" style="height:' + (s.rows * hi) + 'px;min-width:' + s.width + 'px;"><div class="dw-ul">';
					// Create wheel values
					html += generateWheelItems(l);
					html += '</div><div class="dwwol"></div></div><div class="dwwo"></div></div><div class="dwwol"></div></div></td>';
					l++;
				});

				html += '</tr></table></div></div>';
			});

			html += '</div>' + (s.display != 'inline' ? '<div class="dwbc' + (s.button3 ? ' dwbc-p' : '') + '"><span class="dwbw dwb-s"><span class="dwb dwb-e" role="button" tabindex="0">' + s.setText + '</span></span>' + (s.button3 ? '<span class="dwbw dwb-n"><span class="dwb dwb-e" role="button" tabindex="0">' + s.button3Text + '</span></span>' : '') + '<span class="dwbw dwb-c"><span class="dwb dwb-e" role="button" tabindex="0">' + s.cancelText + '</span></span></div></div>' : '') + '</div></div></div>';
			dw = $(html);

			scrollToPos();

			event('onMarkupReady', [dw]);

			// Show
			if (s.display != 'inline') {
				dw.appendTo('body');
				if (anim && !prevAnim) {
					dw.addClass('dw-trans');
					// Remove animation class
					setTimeout(function () {
						dw.removeClass('dw-trans').find('.dw').removeClass(mAnim);
					}, 350);
				}
			} else if (elm.is('div')) {
				elm.html(dw);
			} else {
				dw.insertAfter(elm);
			}

			event('onMarkupInserted', [dw]);

			visible = true;

			// Theme init
			theme.init(dw, that);

			if (s.display != 'inline') {
				// Init buttons
				that.tap($('.dwb-s span', dw), function () {
					that.select();
				});

				that.tap($('.dwb-c span', dw), function () {
					that.cancel();
				});

				if (s.button3) {
					that.tap($('.dwb-n span', dw), s.button3);
				}

				// Enter / ESC
				$(window).on('keydown.dw', function (e) {
					if (e.keyCode == 13) {
						that.select();
					} else if (e.keyCode == 27) {
						that.cancel();
					}
				});

				// Prevent scroll if not specified otherwise
				if (s.scrollLock) {
					dw.on('touchmove touchstart', function (e) {
						if (lock) {
							e.preventDefault();
						}
					});
				}

				// Disable inputs to prevent bleed through (Android bug) and set autocomplete to off (for Firefox)
				$('input,select,button').each(function () {
					if (!this.disabled) {
						if ($(this).attr('autocomplete')) {
							$(this).data('autocomplete', $(this).attr('autocomplete'));
						}
						$(this).addClass('dwtd').prop('disabled', true).attr('autocomplete', 'off');
					}
				});

				// Set position
				that.position();
				$(window).on('orientationchange.dw resize.dw scroll.dw', function (e) {
					// Sometimes scrollTop is not correctly set, so we wait a little
					clearTimeout(debounce);
					debounce = setTimeout(function () {
						var scroll = e.type == 'scroll';
						if ((scroll && lock) || !scroll) {
							that.position(!scroll);
						}
					}, 100);
				});

				that.alert(s.ariaDesc);
			}

			// Events
			$('.dwwl', dw)
				.on('DOMMouseScroll mousewheel', onScroll)
				.on(START_EVENT, onStart)
				.on('keydown', onKeyDown)
				.on('keyup', onKeyUp);

			dw.on(START_EVENT, '.dwb-e', onBtnStart).on('keydown', '.dwb-e', function (e) {
				if (e.keyCode == 32) { // Space
					e.preventDefault();
					e.stopPropagation();
					$(this).click();
				}
			});

			event('onShow', [dw, v]);
		};

		/**
		* Hides the scroller instance.
		*/
		that.hide = function (prevAnim, btn) {
			// If onClose handler returns false, prevent hide
			if (!visible || event('onClose', [v, btn]) === false) {
				return false;
			}

			// Re-enable temporary disabled fields
			$('.dwtd').each(function () {
				$(this).prop('disabled', false).removeClass('dwtd');
				if ($(this).data('autocomplete')) {
					$(this).attr('autocomplete', $(this).data('autocomplete'));
				} else {
					$(this).removeAttr('autocomplete');
				}
			});

			// Hide wheels and overlay
			if (dw) {
				if (s.display != 'inline' && anim && !prevAnim) {
					dw.addClass('dw-trans').find('.dw').addClass('dw-' + anim + ' dw-out');
					setTimeout(function () {
						dw.remove();
						dw = null;
					}, 350);
				} else {
					dw.remove();
					dw = null;
				}

				// Stop positioning on window resize
				$(window).off('.dw');
			}

			pixels = {};
			visible = false;
			preventShow = true;

			elm.focus();
		};

		that.select = function () {
			if (that.hide(false, 'set') !== false) {
				setVal(true, 0, true);
				event('onSelect', [that.val]);
			}
		};

		that.alert = function (txt) {
			aria.text(txt);
			clearTimeout(alertTimer);
			alertTimer = setTimeout(function () {
				aria.text('');
			}, 5000);
		};

		/**
		* Cancel and hide the scroller instance.
		*/
		that.cancel = function () {
			if (that.hide(false, 'cancel') !== false) {
				event('onCancel', [that.val]);
			}
		};

		/**
		* Scroller initialization.
		*/
		that.init = function (ss) {
			// Get theme defaults
			theme = extend({ defaults: {}, init: empty }, ms.themes[ss.theme || s.theme]);

			// Get language defaults
			lang = ms.i18n[ss.lang || s.lang];

			extend(settings, ss); // Update original user settings
			extend(s, theme.defaults, lang, settings);

			that.settings = s;

			// Unbind all events (if re-init)
			elm.off('.dw');

			var preset = ms.presets[s.preset];

			if (preset) {
				pres = preset.call(e, that);
				extend(s, pres, settings); // Load preset settings
			}

			// Set private members
			m = Math.floor(s.rows / 2);
			hi = s.height;
			anim = s.animate;

			if (visible) {
				that.hide();
			}

			if (s.display == 'inline') {
				that.show();
			} else {
				read();
				if (input) {
					// Set element readonly, save original state
					if (readOnly === undefined) {
						readOnly = e.readOnly;
					}
					e.readOnly = true;
					// Init show datewheel
					if (s.showOnFocus) {
						elm.on('focus.dw', function () {
							if (!preventShow) {
								that.show();
							}
							preventShow = false;
						});
					}
				}
				if (s.showOnTap) {
					that.tap(elm, function () {
						that.show();
					});
				}
			}
		};

		that.trigger = function (name, params) {
			return event(name, params);
		};

		that.option = function (opt, value) {
			var obj = {};
			if (typeof opt === 'object') {
				obj = opt;
			} else {
				obj[opt] = value;
			}
			that.init(obj);
		};

		that.destroy = function () {
			that.hide();
			elm.off('.dw');
			delete scrollers[e.id];
			if (input) {
				e.readOnly = readOnly;
			}
		};

		that.getInst = function () {
			return that;
		};

		that.values = null;
		that.val = null;
		that.temp = null;
		that._selectedValues = {};

		that.init(settings);
	}

	function testProps(props) {
		var i;
		for (i in props) {
			if (mod[props[i]] !== undefined) {
				return true;
			}
		}
		return false;
	}

	function testPrefix() {
		var prefixes = ['Webkit', 'Moz', 'O', 'ms'],
			p;

		for (p in prefixes) {
			if (testProps([prefixes[p] + 'Transform'])) {
				return '-' + prefixes[p].toLowerCase();
			}
		}
		return '';
	}

	function testTouch(e) {
		if (e.type === 'touchstart') {
			touch = true;
			/*setTimeout(function () {
				touch = false; // Reset if mouse event was not fired
			}, 500);*/
		} else if (touch) {
			touch = false;
			return false;
		}
		return true;
	}

	function getCoord(e, c) {
		var org = e.originalEvent,
			ct = e.changedTouches;
		return ct || (org && org.changedTouches) ? (org ? org.changedTouches[0]['page' + c] : ct[0]['page' + c]) : e['page' + c];

	}

	function constrain(val, min, max) {
		return Math.max(min, Math.min(val, max));
	}

	function convert(w) {
		var ret = {
			values: [],
			keys: []
		};
		$.each(w, function (k, v) {
			ret.keys.push(k);
			ret.values.push(v);
		});
		return ret;
	}

	function init(that, options, args) {
		var ret = that;

		// Init
		if (typeof options === 'object') {
			return that.each(function () {
				if (!this.id) {
					uuid += 1;
					this.id = 'mobiscroll' + uuid;
				}
				scrollers[this.id] = new Scroller(this, options);
			});
		}

		// Method call
		if (typeof options === 'string') {
			that.each(function () {
				var r,
					inst = scrollers[this.id];

				if (inst && inst[options]) {
					r = inst[options].apply(this, Array.prototype.slice.call(args, 1));
					if (r !== undefined) {
						ret = r;
						return false;
					}
				}
			});
		}

		return ret;
	}

	var move,
		tap,
		touch,
		alertTimer,
		aria,
		date = new Date(),
		uuid = date.getTime(),
		scrollers = {},
		empty = function () {},
		mod = document.createElement('modernizr').style,
		has3d = testProps(['perspectiveProperty', 'WebkitPerspective', 'MozPerspective', 'OPerspective', 'msPerspective']),
		prefix = testPrefix(),
		pr = prefix.replace(/^\-/, '').replace('moz', 'Moz'),
		extend = $.extend,
		START_EVENT = 'touchstart mousedown',
		MOVE_EVENT = 'touchmove mousemove',
		END_EVENT = 'touchend mouseup',
		defaults = {
			// Options
			width: 70,
			height: 40,
			rows: 3,
			delay: 300,
			disabled: false,
			readonly: false,
			showOnFocus: true,
			showOnTap: true,
			showLabel: true,
			wheels: [],
			theme: '',
			headerText: '{value}',
			display: 'modal',
			mode: 'scroller',
			preset: '',
			lang: 'en-US',
			setText: 'Set',
			cancelText: 'Cancel',
			ariaDesc: 'Select a value',
			scrollLock: true,
			tap: true,
			speedUnit: 0.0012,
			timeUnit: 0.1,
			formatResult: function (d) {
				return d.join(' ');
			},
			parseValue: function (value, inst) {
				var val = value.split(' '),
					ret = [],
					i = 0,
					keys;

				$.each(inst.settings.wheels, function (j, wg) {
					$.each(wg, function (k, w) {
						w = w.values ? w : convert(w);
						keys = w.keys || w.values;
						if ($.inArray(val[i], keys) !== -1) {
							ret.push(val[i]);
						} else {
							ret.push(keys[0]);
						}
						i++;
					});
				});
				return ret;
			}
		};

	$(function () {
		aria = $('<div class="dw-hidden" role="alert"></div>').appendTo('body');
	});

	$(document).on('mouseover mouseup mousedown click', function (e) { // Prevent standard behaviour on body click
		if (tap) {
			e.stopPropagation();
			e.preventDefault();
			return false;
		}
	});

	$.fn.mobiscroll = function (method) {
		extend(this, $.mobiscroll.shorts);
		return init(this, method, arguments);
	};

	$.mobiscroll = $.mobiscroll || {
		/**
		* Set settings for all instances.
		* @param {Object} o - New default settings.
		*/
		setDefaults: function (o) {
			extend(defaults, o);
		},
		presetShort: function (name) {
			this.shorts[name] = function (method) {
				return init(this, extend(method, { preset: name }), arguments);
			};
		},
		has3d: has3d,
		shorts: {},
		presets: {},
		themes: {},
		i18n: {}
	};

	$.scroller = $.scroller || $.mobiscroll;
	$.fn.scroller = $.fn.scroller || $.fn.mobiscroll;

})(jQuery);

/*jslint eqeq: true, plusplus: true, undef: true, sloppy: true, vars: true, forin: true */
(function ($) {

	var ms = $.mobiscroll,
		date = new Date(),
		defaults = {
			dateFormat: 'mm/dd/yy',
			dateOrder: 'mmddy',
			timeWheels: 'hhiiA',
			timeFormat: 'hh:ii A',
			startYear: date.getFullYear() - 100,
			endYear: date.getFullYear() + 1,
			monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
			monthNamesShort: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
			dayNames: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'],
			dayNamesShort: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
			shortYearCutoff: '+10',
			monthText: 'Month',
			dayText: 'Day',
			yearText: 'Year',
			hourText: 'Hours',
			minuteText: 'Minutes',
			secText: 'Seconds',
			ampmText: '&nbsp;',
			nowText: 'Now',
			showNow: false,
			stepHour: 1,
			stepMinute: 1,
			stepSecond: 1,
			separator: ' '
		},
		preset = function (inst) {
			var that = $(this),
				html5def = {},
				format;
			// Force format for html5 date inputs (experimental)
			if (that.is('input')) {
				switch (that.attr('type')) {
				case 'date':
					format = 'yy-mm-dd';
					break;
				case 'datetime':
					format = 'yy-mm-ddTHH:ii:ssZ';
					break;
				case 'datetime-local':
					format = 'yy-mm-ddTHH:ii:ss';
					break;
				case 'month':
					format = 'yy-mm';
					html5def.dateOrder = 'mmyy';
					break;
				case 'time':
					format = 'HH:ii:ss';
					break;
				}
				// Check for min/max attributes
				var min = that.attr('min'),
					max = that.attr('max');
				if (min) {
					html5def.minDate = ms.parseDate(format, min);
				}
				if (max) {
					html5def.maxDate = ms.parseDate(format, max);
				}
			}

			// Set year-month-day order
			var i,
				k,
				keys,
				values,
				wg,
				start,
				end,
				orig = $.extend({}, inst.settings),
				s = $.extend(inst.settings, defaults, html5def, orig),
				offset = 0,
				wheels = [],
				ord = [],
				o = {},
				f = { y: 'getFullYear', m: 'getMonth', d: 'getDate', h: getHour, i: getMinute, s: getSecond, a: getAmPm },
				p = s.preset,
				dord = s.dateOrder,
				tord = s.timeWheels,
				regen = dord.match(/D/),
				ampm = tord.match(/a/i),
				hampm = tord.match(/h/),
				hformat = p == 'datetime' ? s.dateFormat + s.separator + s.timeFormat : p == 'time' ? s.timeFormat : s.dateFormat,
				defd = new Date(),
				stepH = s.stepHour,
				stepM = s.stepMinute,
				stepS = s.stepSecond,
				mind = s.minDate || new Date(s.startYear, 0, 1),
				maxd = s.maxDate || new Date(s.endYear, 11, 31, 23, 59, 59);

			format = format || hformat;

			if (p.match(/date/i)) {

				// Determine the order of year, month, day wheels
				$.each(['y', 'm', 'd'], function (j, v) {
					i = dord.search(new RegExp(v, 'i'));
					if (i > -1) {
						ord.push({ o: i, v: v });
					}
				});
				ord.sort(function (a, b) { return a.o > b.o ? 1 : -1; });
				$.each(ord, function (i, v) {
					o[v.v] = i;
				});

				wg = [];
				for (k = 0; k < 3; k++) {
					if (k == o.y) {
						offset++;
						values = [];
						keys = [];
						start = mind.getFullYear();
						end = maxd.getFullYear();
						for (i = start; i <= end; i++) {
							keys.push(i);
							values.push(dord.match(/yy/i) ? i : (i + '').substr(2, 2));
						}
						addWheel(wg, keys, values, s.yearText);
					} else if (k == o.m) {
						offset++;
						values = [];
						keys = [];
						for (i = 0; i < 12; i++) {
							var str = dord.replace(/[dy]/gi, '').replace(/mm/, i < 9 ? '0' + (i + 1) : i + 1).replace(/m/, (i + 1));
							keys.push(i);
							values.push(str.match(/MM/) ? str.replace(/MM/, '<span class="dw-mon">' + s.monthNames[i] + '</span>') : str.replace(/M/, '<span class="dw-mon">' + s.monthNamesShort[i] + '</span>'));
						}
						addWheel(wg, keys, values, s.monthText);
					} else if (k == o.d) {
						offset++;
						values = [];
						keys = [];
						for (i = 1; i < 32; i++) {
							keys.push(i);
							values.push(dord.match(/dd/i) && i < 10 ? '0' + i : i);
						}
						addWheel(wg, keys, values, s.dayText);
					}
				}
				wheels.push(wg);
			}

			if (p.match(/time/i)) {

				// Determine the order of hours, minutes, seconds wheels
				ord = [];
				$.each(['h', 'i', 's', 'a'], function (i, v) {
					i = tord.search(new RegExp(v, 'i'));
					if (i > -1) {
						ord.push({ o: i, v: v });
					}
				});
				ord.sort(function (a, b) {
					return a.o > b.o ? 1 : -1;
				});
				$.each(ord, function (i, v) {
					o[v.v] = offset + i;
				});

				wg = [];
				for (k = offset; k < offset + 4; k++) {
					if (k == o.h) {
						offset++;
						values = [];
						keys = [];
						for (i = 0; i < (hampm ? 12 : 24); i += stepH) {
							keys.push(i);
							values.push(hampm && i == 0 ? 12 : tord.match(/hh/i) && i < 10 ? '0' + i : i);
						}
						addWheel(wg, keys, values, s.hourText);
					} else if (k == o.i) {
						offset++;
						values = [];
						keys = [];
						for (i = 0; i < 60; i += stepM) {
							keys.push(i);
							values.push(tord.match(/ii/) && i < 10 ? '0' + i : i);
						}
						addWheel(wg, keys, values, s.minuteText);
					} else if (k == o.s) {
						offset++;
						values = [];
						keys = [];
						for (i = 0; i < 60; i += stepS) {
							keys.push(i);
							values.push(tord.match(/ss/) && i < 10 ? '0' + i : i);
						}
						addWheel(wg, keys, values, s.secText);
					} else if (k == o.a) {
						offset++;
						var upper = tord.match(/A/);
						addWheel(wg, [0, 1], upper ? ['AM', 'PM'] : ['am', 'pm'], s.ampmText);
					}
				}

				wheels.push(wg);
			}

			function get(d, i, def) {
				if (o[i] !== undefined) {
					return +d[o[i]];
				}
				if (def !== undefined) {
					return def;
				}
				return defd[f[i]] ? defd[f[i]]() : f[i](defd);
			}

			function addWheel(wg, k, v, lbl) {
				wg.push({
					values: v,
					keys: k,
					label: lbl
				});
			}

			function step(v, st) {
				return Math.floor(v / st) * st;
			}

			function getHour(d) {
				var hour = d.getHours();
				hour = hampm && hour >= 12 ? hour - 12 : hour;
				return step(hour, stepH);
			}

			function getMinute(d) {
				return step(d.getMinutes(), stepM);
			}

			function getSecond(d) {
				return step(d.getSeconds(), stepS);
			}

			function getAmPm(d) {
				return ampm && d.getHours() > 11 ? 1 : 0;
			}

			function getDate(d) {
				var hour = get(d, 'h', 0);
				return new Date(get(d, 'y'), get(d, 'm'), get(d, 'd', 1), get(d, 'a') ? hour + 12 : hour, get(d, 'i', 0), get(d, 's', 0));
			}

			// Extended methods
			// ---

			/**
 			* Sets the selected date
 			*
 			* @param {Date} d Date to select.
 			* @param {Boolean} [fill=false] Also set the value of the associated input element. Default is true.
 			* @return {Object} jQuery object to maintain chainability
 			*/
			inst.setDate = function (d, fill, time, temp) {
				var i;

				// Set wheels
				for (i in o) {
					inst.temp[o[i]] = d[f[i]] ? d[f[i]]() : f[i](d);
				}
				inst.setValue(inst.temp, fill, time, temp);
			};

			/**
 			* Returns the currently selected date.
 			*
 			* @param {Boolean} [temp=false] If true, return the currently shown date on the picker, otherwise the last selected one
 			* @return {Date}
 			*/
			inst.getDate = function (temp) {
				return getDate(temp ? inst.temp : inst.values);
			};

			// ---

			return {
				button3Text: s.showNow ? s.nowText : undefined,
				button3: s.showNow ? function () { inst.setDate(new Date(), false, 0.3, true); } : undefined,
				wheels: wheels,
				headerText: function (v) {
					return ms.formatDate(hformat, getDate(inst.temp), s);
				},
				/**
				* Builds a date object from the wheel selections and formats it to the given date/time format
				* @param {Array} d - An array containing the selected wheel values
				* @return {String} - The formatted date string
				*/
				formatResult: function (d) {
					return ms.formatDate(format, getDate(d), s);
				},
				/**
				* Builds a date object from the input value and returns an array to set wheel values
				* @return {Array} - An array containing the wheel values to set
				*/
				parseValue: function (val) {
					var d = new Date(),
						i,
						result = [];
					try {
						d = ms.parseDate(format, val, s);
					} catch (e) {
					}
					// Set wheels
					for (i in o) {
						result[o[i]] = d[f[i]] ? d[f[i]]() : f[i](d);
					}
					return result;
				},
				/**
				* Validates the selected date to be in the minDate / maxDate range and sets unselectable values to disabled
				* @param {Object} dw - jQuery object containing the generated html
				* @param {Integer} [i] - Index of the changed wheel, not set for initial validation
				*/
				validate: function (dw, i) {
					var temp = inst.temp, //.slice(0),
						mins = { y: mind.getFullYear(), m: 0, d: 1, h: 0, i: 0, s: 0, a: 0 },
						maxs = { y: maxd.getFullYear(), m: 11, d: 31, h: step(hampm ? 11 : 23, stepH), i: step(59, stepM), s: step(59, stepS), a: 1 },
						minprop = true,
						maxprop = true;
					$.each(['y', 'm', 'd', 'a', 'h', 'i', 's'], function (x, i) {
						if (o[i] !== undefined) {
							var min = mins[i],
								max = maxs[i],
								maxdays = 31,
								val = get(temp, i),
								t = $('.dw-ul', dw).eq(o[i]),
								y,
								m;
							if (i == 'd') {
								y = get(temp, 'y');
								m = get(temp, 'm');
								maxdays = 32 - new Date(y, m, 32).getDate();
								max = maxdays;
								if (regen) {
									$('.dw-li', t).each(function () {
										var that = $(this),
											d = that.data('val'),
											w = new Date(y, m, d).getDay(),
											str = dord.replace(/[my]/gi, '').replace(/dd/, d < 10 ? '0' + d : d).replace(/d/, d);
										$('.dw-i', that).html(str.match(/DD/) ? str.replace(/DD/, '<span class="dw-day">' + s.dayNames[w] + '</span>') : str.replace(/D/, '<span class="dw-day">' + s.dayNamesShort[w] + '</span>'));
									});
								}
							}
							if (minprop && mind) {
								min = mind[f[i]] ? mind[f[i]]() : f[i](mind);
							}
							if (maxprop && maxd) {
								max = maxd[f[i]] ? maxd[f[i]]() : f[i](maxd);
							}
							if (i != 'y') {
								var i1 = $('.dw-li', t).index($('.dw-li[data-val="' + min + '"]', t)),
									i2 = $('.dw-li', t).index($('.dw-li[data-val="' + max + '"]', t));
								$('.dw-li', t).removeClass('dw-v').slice(i1, i2 + 1).addClass('dw-v');
								if (i == 'd') { // Hide days not in month
									$('.dw-li', t).removeClass('dw-h').slice(maxdays).addClass('dw-h');
								}
							}
							if (val < min) {
								val = min;
							}
							if (val > max) {
								val = max;
							}
							if (minprop) {
								minprop = val == min;
							}
							if (maxprop) {
								maxprop = val == max;
							}
							// Disable some days
							if (s.invalid && i == 'd') {
								var idx = [];
								// Disable exact dates
								if (s.invalid.dates) {
									$.each(s.invalid.dates, function (i, v) {
										if (v.getFullYear() == y && v.getMonth() == m) {
											idx.push(v.getDate() - 1);
										}
									});
								}
								// Disable days of week
								if (s.invalid.daysOfWeek) {
									var first = new Date(y, m, 1).getDay(),
										j;
									$.each(s.invalid.daysOfWeek, function (i, v) {
										for (j = v - first; j < maxdays; j += 7) {
											if (j >= 0) {
												idx.push(j);
											}
										}
									});
								}
								// Disable days of month
								if (s.invalid.daysOfMonth) {
									$.each(s.invalid.daysOfMonth, function (i, v) {
										v = (v + '').split('/');
										if (v[1]) {
											if (v[0] - 1 == m) {
												idx.push(v[1] - 1);
											}
										} else {
											idx.push(v[0] - 1);
										}
									});
								}
								$.each(idx, function (i, v) {
									$('.dw-li', t).eq(v).removeClass('dw-v');
								});
							}

							// Set modified value
							temp[o[i]] = val;
						}
					});
				}
			};
		};

	$.each(['date', 'time', 'datetime'], function (i, v) {
		ms.presets[v] = preset;
		ms.presetShort(v);
	});

	/**
	* Format a date into a string value with a specified format.
	* @param {String} format - Output format.
	* @param {Date} date - Date to format.
	* @param {Object} settings - Settings.
	* @return {String} - Returns the formatted date string.
	*/
	ms.formatDate = function (format, date, settings) {
		if (!date) {
			return null;
		}
		var s = $.extend({}, defaults, settings),
			look = function (m) { // Check whether a format character is doubled
				var n = 0;
				while (i + 1 < format.length && format.charAt(i + 1) == m) {
					n++;
					i++;
				}
				return n;
			},
			f1 = function (m, val, len) { // Format a number, with leading zero if necessary
				var n = '' + val;
				if (look(m)) {
					while (n.length < len) {
						n = '0' + n;
					}
				}
				return n;
			},
			f2 = function (m, val, s, l) { // Format a name, short or long as requested
				return (look(m) ? l[val] : s[val]);
			},
			i,
			output = '',
			literal = false;

		for (i = 0; i < format.length; i++) {
			if (literal) {
				if (format.charAt(i) == "'" && !look("'")) {
					literal = false;
				} else {
					output += format.charAt(i);
				}
			} else {
				switch (format.charAt(i)) {
				case 'd':
					output += f1('d', date.getDate(), 2);
					break;
				case 'D':
					output += f2('D', date.getDay(), s.dayNamesShort, s.dayNames);
					break;
				case 'o':
					output += f1('o', (date.getTime() - new Date(date.getFullYear(), 0, 0).getTime()) / 86400000, 3);
					break;
				case 'm':
					output += f1('m', date.getMonth() + 1, 2);
					break;
				case 'M':
					output += f2('M', date.getMonth(), s.monthNamesShort, s.monthNames);
					break;
				case 'y':
					output += (look('y') ? date.getFullYear() : (date.getYear() % 100 < 10 ? '0' : '') + date.getYear() % 100);
					break;
				case 'h':
					var h = date.getHours();
					output += f1('h', (h > 12 ? (h - 12) : (h == 0 ? 12 : h)), 2);
					break;
				case 'H':
					output += f1('H', date.getHours(), 2);
					break;
				case 'i':
					output += f1('i', date.getMinutes(), 2);
					break;
				case 's':
					output += f1('s', date.getSeconds(), 2);
					break;
				case 'a':
					output += date.getHours() > 11 ? 'pm' : 'am';
					break;
				case 'A':
					output += date.getHours() > 11 ? 'PM' : 'AM';
					break;
				case "'":
					if (look("'")) {
						output += "'";
					} else {
						literal = true;
					}
					break;
				default:
					output += format.charAt(i);
				}
			}
		}
		return output;
	};

	/**
	* Extract a date from a string value with a specified format.
	* @param {String} format - Input format.
	* @param {String} value - String to parse.
	* @param {Object} settings - Settings.
	* @return {Date} - Returns the extracted date.
	*/
	ms.parseDate = function (format, value, settings) {
		var def = new Date();

		if (!format || !value) {
			return def;
		}

		value = (typeof value == 'object' ? value.toString() : value + '');

		var s = $.extend({}, defaults, settings),
			shortYearCutoff = s.shortYearCutoff,
			year = def.getFullYear(),
			month = def.getMonth() + 1,
			day = def.getDate(),
			doy = -1,
			hours = def.getHours(),
			minutes = def.getMinutes(),
			seconds = 0, //def.getSeconds(),
			ampm = -1,
			literal = false, // Check whether a format character is doubled
			lookAhead = function (match) {
				var matches = (iFormat + 1 < format.length && format.charAt(iFormat + 1) == match);
				if (matches) {
					iFormat++;
				}
				return matches;
			},
			getNumber = function (match) { // Extract a number from the string value
				lookAhead(match);
				var size = (match == '@' ? 14 : (match == '!' ? 20 : (match == 'y' ? 4 : (match == 'o' ? 3 : 2)))),
					digits = new RegExp('^\\d{1,' + size + '}'),
					num = value.substr(iValue).match(digits);

				if (!num) {
					return 0;
				}
				//throw 'Missing number at position ' + iValue;
				iValue += num[0].length;
				return parseInt(num[0], 10);
			},
			getName = function (match, s, l) { // Extract a name from the string value and convert to an index
				var names = (lookAhead(match) ? l : s),
					i;

				for (i = 0; i < names.length; i++) {
					if (value.substr(iValue, names[i].length).toLowerCase() == names[i].toLowerCase()) {
						iValue += names[i].length;
						return i + 1;
					}
				}
				return 0;
				//throw 'Unknown name at position ' + iValue;
			},
			checkLiteral = function () {
				//if (value.charAt(iValue) != format.charAt(iFormat))
				//throw 'Unexpected literal at position ' + iValue;
				iValue++;
			},
			iValue = 0,
			iFormat;

		for (iFormat = 0; iFormat < format.length; iFormat++) {
			if (literal) {
				if (format.charAt(iFormat) == "'" && !lookAhead("'")) {
					literal = false;
				} else {
					checkLiteral();
				}
			} else {
				switch (format.charAt(iFormat)) {
				case 'd':
					day = getNumber('d');
					break;
				case 'D':
					getName('D', s.dayNamesShort, s.dayNames);
					break;
				case 'o':
					doy = getNumber('o');
					break;
				case 'm':
					month = getNumber('m');
					break;
				case 'M':
					month = getName('M', s.monthNamesShort, s.monthNames);
					break;
				case 'y':
					year = getNumber('y');
					break;
				case 'H':
					hours = getNumber('H');
					break;
				case 'h':
					hours = getNumber('h');
					break;
				case 'i':
					minutes = getNumber('i');
					break;
				case 's':
					seconds = getNumber('s');
					break;
				case 'a':
					ampm = getName('a', ['am', 'pm'], ['am', 'pm']) - 1;
					break;
				case 'A':
					ampm = getName('A', ['am', 'pm'], ['am', 'pm']) - 1;
					break;
				case "'":
					if (lookAhead("'")) {
						checkLiteral();
					} else {
						literal = true;
					}
					break;
				default:
					checkLiteral();
				}
			}
		}
		if (year < 100) {
			year += new Date().getFullYear() - new Date().getFullYear() % 100 +
				(year <= (typeof shortYearCutoff != 'string' ? shortYearCutoff : new Date().getFullYear() % 100 + parseInt(shortYearCutoff, 10)) ? 0 : -100);
		}
		if (doy > -1) {
			month = 1;
			day = doy;
			do {
				var dim = 32 - new Date(year, month - 1, 32).getDate();
				if (day <= dim) {
					break;
				}
				month++;
				day -= dim;
			} while (true);
		}
		hours = (ampm == -1) ? hours : ((ampm && hours < 12) ? (hours + 12) : (!ampm && hours == 12 ? 0 : hours));
		var date = new Date(year, month - 1, day, hours, minutes, seconds);
		if (date.getFullYear() != year || date.getMonth() + 1 != month || date.getDate() != day) {
			throw 'Invalid date';
		}
		return date;
	};

})(jQuery);

	var	formatJustDate = d3.time.format("%Y-%m-%d").parse,
		formatDatetime = d3.time.format("%Y-%m-%dT%H:%M").parse;

function getDayOffset(d,offset) {
	if (!offset) { offset = 0 }
	return new Date(new Date().setDate(d.getDate() + offset));
}

function week(domElement,datasource,width,height,rightmargin) {
	var	right = width - rightmargin,
		left = right / 8,
		wellnessLocation = 25,
		wellnessHeight = 250,
		sleepGraphLocation = 150,
		sleepGraphHeight = 150
		activityTimelineLocation = 375,
		activityTimelineHeight = 0,
		healthTimelineLocation = 425,
		healthTimelineHeight = 0,

	badgoodcolorScale = d3.scale.linear().domain([10,5,0]).range(['#884400', '#888844','#008844']),
	worsebadcolorScale = d3.scale.linear().domain([10,5,0]).range(['#884400','#ffaa66','#888800']),
	sleepcolorScale = d3.scale.linear().domain([10,5,0]).range(['#884444', '#880088', '#444488']),
	lowhighcolorScale = d3.scale.linear().domain([10,0]).range(['#884400', '#004488']);

	d3.json(datasource, function(json){
		visualizeweek = d3.select(domElement).append("svg:svg")
			.attr({
				viewBox: "0 0 " + width + " " + height
			});

		defs = visualizeweek.append("svg:defs");

	var	minDate = new Date(formatJustDate(json.response.summary.day[0].date).toDateString()),
		maxDate = new Date(getDayOffset(formatJustDate(json.response.summary.day[json.response.summary.day.length - 1].date),1).toDateString()),

		timeScale = d3.time.scale()
				.domain([minDate,maxDate])
				.range([left, right]),
		timeAxis	= d3.svg.axis().scale(timeScale).orient("bottom").ticks(8);
		
// Highlight focus day
		visualizeweek.append("svg:g")
			.attr({
				class: "focus",
				transform: function() {
					return "translate(" + timeScale(formatJustDate(json.response.focus)) + ",-30)";
				}
			})
			.append("svg:rect")
				.attr({
					width: ((width / 8) - 6),
					height: 485
				});

/* Wellness visualization */
	var wellnessVis = visualizeweek.append("svg:g")
				.attr({
					class: "wellnessVis"
				}),

		wellnessLabels = wellnessVis.append("svg:g")
			.attr("class","scales"),

		wellnessDayLabel = d3.svg.axis().scale(timeScale).orient("top").ticks(7),

		wellnessTop = wellnessLabels.append("svg:g").attr("class","toplabels"),

		wellnessSideLabels = wellnessLabels.append("svg:g")
			.attr({
				class: "sideLabels",
				transform: "translate(" + (left - 10) + ",10)"
			});

		wellnessTop.call(wellnessDayLabel)
			.attr({
				class: "dates",
				transform: "translate(" + ( width / 16 - 5 ) + ",0)"
			});

		wellnessSideLabels.append("svg:text").text("Morning")
			.attr("transform","translate(0," + 30 + ")");
		wellnessSideLabels.append("svg:text").text("Afternoon")
			.attr("transform","translate(0," + 65 + ")");
		wellnessSideLabels.append("svg:text").text("Evening")
			.attr("transform","translate(0," + 100 + ")");

		wellnessWeek = wellnessVis.append("svg:g")
			.attr({
				class: "wellnessWeek",
				transform: "translate(-5,10)"
			});

		wellnessDay = wellnessWeek.selectAll("g.wellnessWeek")
			.data(json.response.summary.day).enter()
			.append("svg:g")
				.attr({
					class: "wellnessDay",
					transform: function(d) {return "translate(" + timeScale(formatJustDate(d.date)) + ",0)"; }
				})
			.each(function(d){
			// Labels
				d3.select(this).append("svg:g")
					.attr({
						class: "label",
						transform: "translate(15,8)"
					})
					.each(function() {
						d3.select(this).append("svg:text").text("W")
							.attr({
								transform: "translate(2,0)"
							})
							.append("svg:title").text("Wakefulness");
						d3.select(this).append("svg:text").text("M")
							.attr({
								transform: "translate(22,0)"
							})
							.append("svg:title").text("Mental State");
						d3.select(this).append("svg:text").text("B")
							.attr({
								transform: "translate(43,0)"
							})
							.append("svg:title").text("Body State");
						d3.select(this).append("svg:text").text("S")
							.attr({
								transform: "translate(61,0)"
							})
							.append("svg:title").text("Stress Level");
						d3.select(this).append("svg:text").text("O")
							.attr({
								transform: "translate(77,0)"
							})
							.append("svg:title").text("Overall");
					});
			// Square
				d3.select(this).append("svg:rect")
					.attr({
						class: function(d) {
							if ("work" in d ) {
								if (d.work.type == 'off') {
									return 'day off';
								}
								else if (d.work.type == 'unknown') {
									return 'day unknown';
								}
								else if (d.work.sick == 'partial') {

									return 'day partialsickday';
								}
								else if (d.work.sick == 'sick') {
									return 'day sick'
								}
								else {
									return 'day work'
								}
							}
							else {
								return 'day unknown';
							}
						},
						x: 13,
						y: 13,
						width: (width / 8) - 22,
						height: 98
					})
					.append("svg:title")
						.text(function(d) {
							if ("work" in d ) {
								if (d.work.type == 'off') {
									return 'Day off.';
								}
								else if (d.work.type == 'unknown') {
									return 'Unknown.';
								}
								else if (d.work.sick == 'partial') {

									return 'Partial sick day.';
								}
								else if (d.work.sick == 'sick') {
									return 'Sick day.'
								}
								else {
									return 'Work day.'
								}
							}
							else {
								return 'Nothing recorded.';
							}
						}
						);
			if ("wellness" in d ) {
			// Morning
				d3.select(this).append("svg:g")
					.attr({
						class: "morning",
						transform: "translate(5,20.5)"
					})
					.each(function(d){
						d3.select(this).append("svg:g")
							.attr({
								class: "wake",
								transform: "translate(13,0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.morning.wake.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.morning.wake.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.morning.wake.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "mental",
								transform: "translate(" + ((((width / 8) - 44) / 5) + 12 + 4) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.morning.mental.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.morning.mental.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.morning.mental.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "body",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 2 + 12 + 7) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.morning.body.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.morning.body.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.morning.body.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "stress",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 3 + 12 + 10) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.morning.stress.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.morning.stress.value);}
										else { return "fill:#aaa;";}
									}

								})
								.append("title")
									.text(function(d) { return d.wellness.morning.stress.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "overall",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 4 + 12 + 13) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.morning.overall.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.morning.overall.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.morning.overall.text; } );
					});
			// Afternoon
				d3.select(this).append("svg:g")
					.attr({
						class: "morning",
						transform: "translate(5,53)"
					})
					.each(function(d){
						d3.select(this).append("svg:g")
							.attr({
								class: "wake",
								transform: "translate(13,0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.afternoon.wake.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.afternoon.wake.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.afternoon.wake.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "mental",
								transform: "translate(" + ((((width / 8) - 44) / 5) + 12 + 4) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.afternoon.mental.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.afternoon.mental.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.afternoon.mental.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "body",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 2 + 12 + 7) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.afternoon.body.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.afternoon.body.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.afternoon.body.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "stress",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 3 + 12 + 10) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.afternoon.stress.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.afternoon.stress.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.afternoon.stress.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "overall",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 4 + 12 + 13) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.afternoon.overall.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.afternoon.overall.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.afternoon.overall.text; } );
					});
			// Evening
				d3.select(this).append("svg:g")
					.attr({
						class: "evening",
						transform: "translate(5,85.5)"
					})
					.each(function(d){
						d3.select(this).append("svg:g")
							.attr({
								class: "wake",
								transform: "translate(13,0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.evening.wake.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.evening.wake.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.evening.wake.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "mental",
								transform: "translate(" + ((((width / 8) - 44) / 5) + 12 + 4) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.evening.mental.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.evening.mental.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.evening.mental.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "body",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 2 + 12 + 7) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.evening.body.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.evening.body.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.evening.body.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "stress",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 3 + 12 + 10) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.evening.stress.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.evening.stress.value);}
										else { return "fill:#aaa;";}
									}

								})
								.append("title")
									.text(function(d) { return d.wellness.evening.stress.text; } );
						d3.select(this).append("svg:g")
							.attr({
								class: "overall",
								transform: "translate(" + ((((width / 8) - 44) / 5)  * 4 + 12 + 13) + ",0)"
							})
							.append("svg:rect")
								.attr({
									x: 0,
									y: 0,
									width: ((width / 8) - 44) / 5,
									height: 15,
									style: function(d) {
										if (d.wellness.evening.overall.value > -1) {
											return "fill:" + badgoodcolorScale(d.wellness.evening.overall.value);}
										else { return "fill:#aaa;";}
									}
								})
								.append("title")
									.text(function(d) { return d.wellness.evening.overall.text; } );
					});
				}
			});

/* Sleep graph */
	var sleepGraphtop = sleepGraphLocation,
		sleepGraphbottom = sleepGraphHeight + sleepGraphtop,

		sleepGraph = visualizeweek.append("svg:g")
				.attr({
					class: "sleepgraph",
					transform: "translate(0," + sleepGraphLocation + ")"
				});

		if (d3.min(json.response.summary.day, function (d) {return parseFloat(d.hours - d.spentawake)}) < 2) {
			var sleepscalemin = 0;
		}
		else {
			var	sleepscalemin = d3.min(json.response.summary.day, function(d) { return parseFloat(d.hours - d.spentawake - 2)});
		}
		if (d3.max(json.response.summary.day, function(d) { return parseFloat(d.hours - d.spentawake); }) + 2 < 10) {
			var sleepscalemax = 10;
		}
		else {
			var	sleepscalemax = d3.max(json.response.summary.day, function(d) { return parseFloat(d.hours - d.spentawake) + 2; })
		}

		if (d3.max(json.response.summary.day, function(d) { return parseFloat(d.wakes) + 2; }) < 5) {
			var wakescalemax = 5;
		}
		else {
			var	wakescalemax =  d3.max(json.response.summary.day, function(d) { return parseFloat(d.wakes) + 2; });
		}

	var	hoursScale = d3.scale.linear()
				.domain([sleepscalemin,sleepscalemax])
				.range([sleepGraphHeight, 0]),

		wakeScale = d3.scale.linear()
				.domain([0,wakescalemax])
				.range([sleepGraphHeight, 0]),

		hoursAxis	= d3.svg.axis().scale(hoursScale).orient("left").ticks(5),
		wakesAxis	= d3.svg.axis().scale(wakeScale).orient("right").ticks(5).tickFormat(d3.format(",.0f")),

		sleepScales = sleepGraph.append("svg:g").attr("class","scales");

	sleepScales.append("svg:g")
		.call(hoursAxis)
		.attr({
			class: "hours",
			transform: "translate(" + left + ",0)"
		})
		.append("svg:text")
			.text("Hours of sleep")
			.attr({
				x: -120,
				y: -40,
				transform: "rotate(-90)"
				})
				.append("title")
					.text("From going to bed to waking up, minus time spent awake.");

	sleepScales.append("svg:g")
		.call(wakesAxis)
		.attr({
			class:"wakes",
			transform: "translate(" + right + ",0)"
		})
		.append("svg:text")
			.text("# of times woke up")
			.attr({
				x: 5,
				y: -35,
				transform: "rotate(90)"
			});

	sleepScales.append("svg:g")
		.call(timeAxis)
		.attr({
			class: "time",
			transform: "translate(0," + sleepGraphHeight + ")"
		});

	var	plot = sleepGraph.append("svg:g").attr("class","plot"),

		plotHours = d3.svg.line().interpolate("linear")
			.x(function(d) { return timeScale(formatJustDate(d.date)); })
			.y(function(d) { return hoursScale(d.hours - d.spentawake); });

		plotWakes = d3.svg.line().interpolate("linear")
			.x(function(d) { return timeScale(formatJustDate(d.date)); })
			.y(function(d) { return wakeScale(d.wakes); });

	plot.append("svg:path")
		.attr({
			class: "hours line",
			d: function() { return plotHours(json.response.summary.day); }
		});

	plot.append("svg:path")
		.attr({
			class: "wakes line",
			d: function(d) { return plotWakes(json.response.summary.day); }
		});

/* Activity Timeline */
	var	activityTimelineTop = activityTimelineLocation,
		activityTimelineBottom = activityTimelineHeight + activityTimelineLocation,

		activityTimeline = visualizeweek.append("svg:g")
				.attr({
					class: "activityTimeline timeline",
					transform: "translate(0," + activityTimelineLocation + ")"
				}),

		activityScales = activityTimeline.append("svg:g").attr("class","scales");

	if (json.response.sleep != null) {
		defs.selectAll("linearGradient")
			.data(json.response.sleep.entry).enter()
			.append('svg:linearGradient')
				.attr({
					x1: "0%",
					y1: "0%",
					x2: "100%",
					y2: "0%",
					id: function(d){return "gradient" + d.key; },
					spreadMethod: "pad"
				})
				.each(function(d) {
					if (d.sleepfeeling.value > -1) {
						d3.select(this).append("svg:stop").attr({
							offset: "0%",
							style: function(d){
									return "stop-color:"+ sleepcolorScale(d.sleepfeeling.value) +";stop-opacity: 1;";
							}
						});
						d3.select(this).append("svg:stop").attr({
							offset: "100%",
							style: function(d){
								if (d.end == 'none') {
									return "stop-color:#fff;stop-opacity:0"
								}
								else {
									return "stop-color:" + sleepcolorScale(d.wakefeeling.value) +";stop-opacity: 1;";
								}
							}
						});
					};
				});
		if (json.response.sleep.entry[0] == undefined) {
		defs.append('svg:linearGradient')
				.attr({
					x1: "0%",
					y1: "0%",
					x2: "100%",
					y2: "0%",
					id: function(){return "gradient" + json.response.sleep.entry.key; },
					spreadMethod: "pad"
				})
				.each(function() {
					if (json.response.sleep.entry.sleepfeeling.value > -1) {
						d3.select(this).append("svg:stop").attr({
							offset: "0%",
							style: function(){
									return "stop-color:"+ sleepcolorScale(json.response.sleep.entry.sleepfeeling.value) +";stop-opacity: 1;";
							}
						});
						d3.select(this).append("svg:stop").attr({
							offset: "100%",
							style: function(){
									return "stop-color:" + sleepcolorScale(json.response.sleep.entry.wakefeeling.value) +";stop-opacity: 1;";
							}
						});
					};
				});
		}
	}
		activityScales.append("svg:g").attr("class","time")
				.call(timeAxis)
				.append("svg:text")
					.attr({
						class: "title",
						transform: "translate(" + (left - 10) + ",5)"
					})
					.text("Activity");

	var	activityTimelineplot = activityTimeline.append("svg:g")
			.attr("class", "plot");

// Do nothing if no entries
	if (json.response.sleep != null) {
		activityTimelineplot.selectAll("rect.sleep")
			.data(json.response.sleep.entry).enter()
			.append("svg:rect")
				.attr({
					class: "sleep",
					x: 0,
					y: -7,
					height: 15,
					width: function(d){
						if (d.end == 'none') {
							if (timeScale(new Date()) - timeScale(formatDatetime(d.start)) < 20) { return 20; }
							else { return timeScale(new Date()) - timeScale(formatDatetime(d.start)); }
						}
						else {
							return (timeScale(formatDatetime(d.end)) - timeScale(formatDatetime(d.start)));
						}
					},
					transform: function(d) { return "translate(" + timeScale(formatDatetime(d.start)) + ",0)"},
					style: function(d){ return "fill: url(#gradient" + d.key + ")"; }
				})
				.append("svg:title")
					.text(function(d){
						if (d.end == 'none') {
							return "Started Sleep: " + d.start + " and still snoring."
						}
						else {
							return "Sleep: " + d.start + " to " + d.end;
						}
					});

	// APIPage outputs differently when there is only 1 entry
		if (json.response.sleep.entry[0] == undefined) {
			activityTimelineplot
				.append("svg:rect")
					.attr({
						class: "sleep",
						x: 0,
						y: -7,
						height: 15,
						width: function(){
							if (json.response.sleep.entry.end == 'none') {
								return (timeScale(new Date()) - timeScale(formatDatetime(json.response.sleep.entry.start)));
							}
							else {
							return (timeScale(formatDatetime(json.response.sleep.entry.end)) - timeScale(formatDatetime(json.response.sleep.entry.start)));
							}
						},
						transform: function() { return "translate(" + timeScale(formatDatetime(json.response.sleep.entry.start)) + ",0)"},
						style: function(){ return "fill: url(#gradient" + json.response.sleep.entry.key + ")"; }
					})
					.append("svg:title")
						.text(function(d){
							if (json.response.sleep.entry.end == 'none') {
								return "Started sleeping: " + json.response.sleep.entry.start + " and still snoring."
							}
							else {
								return "Sleep: " + json.response.sleep.entry.start + " to " + json.response.sleep.entry.end;
							}
						});
		}
	}
// Do nothing if no entries
	if (json.response.work != null) {
		activityTimelineplot.selectAll("rect.work")
			.data(json.response.work.entry).enter()
			.append("svg:rect")
				.attr({
					class: function(d){
						if (d.sickday == 'no') {
							return "work";
						}
						else if (d.sickday == 'partial') {
							return "work partialsickday";
						}
						else if (d.sickday == 'yes') {
							return "work sickday";
						}
					},
					x: 0,
					y: -7,
					height: 15,
					width: function(d){
							return Math.abs(timeScale(formatDatetime(d.end)) - timeScale(formatDatetime(d.start)));
						},
					transform: function(d) { return "translate(" + timeScale(formatDatetime(d.start)) + ",0)"}
				})
				.append("svg:title")
					.text(function(d){ return "Work: " + d.start + " to " + d.end; });
	// APIPage outputs differently when there is only 1 entry
		if (json.response.work.entry[0] == undefined) {
			activityTimelineplot
				.append("svg:rect")
					.attr({
						class: function(){
							if (json.response.work.entry.sickday == 'no') {
								return "work";
							}
							else if (json.response.work.entry.sickday == 'partial') {
								return "work partialsickday";
							}
							else if (json.response.work.entry.sickday == 'yes') {
								return "work sickday";
							}
						},
						x: 0,
						y: -7,
						height: 15,
						width: function(){
								return Math.abs(timeScale(formatDatetime(json.response.work.entry.end)) - timeScale(formatDatetime(json.response.work.entry.start)));
							},
						transform: function() { return "translate(" + timeScale(formatDatetime(json.response.work.entry.start)) + ",0)"}
					})
					.append("svg:title")
						.text(function(){ return "Work: " + json.response.work.entry.start + " to " + json.response.work.entry.end; });
		}
	}

/* Ailments Timeline */
	var	healthTimelineTop = healthTimelineLocation,
		healthTimelineBottom = healthTimelineHeight + healthTimelineLocation,

		healthTimeline = visualizeweek.append("svg:g")
				.attr({
					class: "healthTimeline timeline",
					transform: "translate(0," + healthTimelineLocation + ")"
				}),

		healthScales = healthTimeline.append("svg:g").attr("class","scales");

		healthScales.append("svg:g").attr("class","time")
				.call(timeAxis)
				.append("svg:text")
					.attr({
						class: "title",
						transform: "translate(" + (left - 10) + ",5)"
					})
					.text("Health");

	var	healthTimelineplot = healthTimeline.append("svg:g").attr("class", "plot");

		if (json.response.ailment != null) {
			healthTimelineplot.selectAll("a")
				.data(json.response.ailment.entry).enter()
				.append("a")
					.attr("xlink:href", function(d){ return rooturl + "/view/ailments/" + d.key; })
				.append("svg:circle")
					.attr({
						class: function(d){
							return "ailment " + d.type;
						},
						x: 0,
						y: -7,
						r: 7,
						transform: function(d) { return "translate(" + timeScale(formatDatetime(d.start)) + ",0)"},
						style: function(d) { return "fill:" + worsebadcolorScale(d.impact.value) + ";stroke:" + worsebadcolorScale(d.intensity.value);}
					})
					.append("svg:title")
						.text(function(d) {
							if (d.type = 'neurological') { var ailmenttype = "Neuro"; }
							else if (d.type = 'migraine') { var ailmenttype = "Headache"; }
							else if (d.type = 'illness') { var ailmenttype = "Illness"; }
							else if (d.type = 'other') { var ailmenttype = "Body"; }

							var intensity = "Intensity: " + d.intensity.text,
								impact = "Impact: " + d.impact.text;

							return ailmenttype + ": " + intensity + "; " + impact;
						});

		// APIPage outputs differently when there is only 1 entry
			if (json.response.ailment.entry[0] == undefined) {
				healthTimelineplot
					.append("a")
						.attr("xlink:href", function(){ return rooturl + "/view/ailments/" + json.response.ailment.entry.key; })
					.append("svg:circle")
						.attr({
							class: function(){
								return "ailment " + json.response.ailment.entry.type;
							},
							x: 0,
							y: -7,
							r: 7,
							transform: function() { return "translate(" + timeScale(formatDatetime(json.response.ailment.entry.start)) + ",0)"},
							style: function(d) { return "fill:" + worsebadcolorScale(json.response.ailment.entry.impact.value) + ";stroke:" + worsebadcolorScale(json.response.ailment.entry.intensity.value);}
						})
						.append("svg:title")
							.text(function() {
								if (json.response.ailment.entry.type = 'neurological') { var ailmenttype = "Neuro"; }
								else if (json.response.ailment.entry.type = 'migraine') { var ailmenttype = "Headache"; }
								else if (json.response.ailment.entry.type = 'illness') { var ailmenttype = "Illness"; }
								else if (json.response.ailment.entry.type = 'other') { var ailmenttype = "Body"; }
	
								var intensity = "Intensity: " + json.response.ailment.entry.intensity.text,
									impact = "Impact: " + json.response.ailment.entry.impact.text;
	
								return ailmenttype + ": " + intensity + " " + impact;
							});
			}
	}

// Do nothing if no entries
	if (json.response.period != null) {
	
	// Gradient for current period
		defs.append('svg:linearGradient')
	    	.attr({
	    		x1: "0%",
	    		y1: "0%",
	    		x2: "100%",
	    		y2: "0%",
	    		id: function(d){return "currentperiod"; },
	    		spreadMethod: "pad"
	    	})
	    	.each(function(d) {
	    			d3.select(this).append("svg:stop").attr({
	    				offset: "0%",
	    				style: "stop-color:#aaa;stop-opacity: 1;"
	    			});
	    			d3.select(this).append("svg:stop").attr({
	    				offset: "100%",
	    				style: "stop-color:#fff;stop-opacity: 1;"
	    			});
	    		});
	
		healthTimelineplot.selectAll("rect.period")
			.data(json.response.period.entry).enter()
			.append("svg:rect")
				.attr({
					class: "period",
					x: 0,
					y: -6,
					height: 11,
					width: function(d){
						if (d.end == 'none') {
							if (timeScale(new Date()) - timeScale(formatDatetime(d.start)) < 20) { return 20; }
							else { return timeScale(new Date()) - timeScale(formatDatetime(d.start)); }
						}
						else {
							return (timeScale(formatDatetime(d.end)) - timeScale(formatDatetime(d.start)));
						}
					},
					transform: function(d) { return "translate(" + timeScale(formatDatetime(d.start)) + ",0)"},
					style: function(d) {
						if (d.end == 'none') {
							return "fill: url(#currentperiod);";
						}
						else { "fill:#aaa;" }
					}
				})
				.append("svg:title")
					.text(function(d){ 
						if (d.end == 'none') {
							return "Period started: " + d.start;
						}
						else {
							return "Period: " + d.start + " to " + d.end;
						}
					});
	// APIPage outputs differently when there is only 1 entry
		if (json.response.period.entry[0] == undefined) {
			healthTimelineplot
				.append("svg:rect")
					.attr({
						class: "period",
						x: 0,
						y: -5,
						height: 11,
						width: function(){
							if (json.response.period.entry.end == 'none') {
								if (timeScale(new Date()) - timeScale(formatDatetime(json.response.period.entry.start)) < 20) { return 20; }
								else { return timeScale(new Date()) - timeScale(formatDatetime(json.response.period.entry.start)); }
							}
							else {
								return (timeScale(formatDatetime(json.response.period.entry.end)) - timeScale(formatDatetime(json.response.period.entry.end)));
							}
						},
						transform: function() { return "translate(" + timeScale(formatDatetime(json.response.period.entry.start)) + ",0)"},
						style: function() {
							if (json.response.period.entry.end == 'none') {
								return "fill: url(#currentperiod);";
							}
							else { "fill:#aaa;" }
						}
					})
					.append("svg:title")
						.text(function(){ 
							if (json.response.period.entry.end == 'none') {
								return "Period started " + json.response.period.entry.start;
							}
							else {
								return "Period: " + json.response.period.entry.start + " to " + json.response.period.entry.end;
							}
						});
		}
	}

		d3.selectAll(".timeline .scales line")
			.attr({
				y1: -10,
				y2: 10
		});
	});
}