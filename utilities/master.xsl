<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-element-prefixes="date">

<xsl:import href="date-time.xsl"/>
<xsl:import href="page-title.xsl"/>
<xsl:import href="typography.xsl"/>

<xsl:variable name="cookie-username"/>
<xsl:variable name="url-auth-token"/>
<xsl:output doctype-system="about:legacy-compat" method="html" />

<xsl:template match="/">
	<xsl:comment><![CDATA[[if IE 6]><html lang="en" class="no-js wf-inactive ie6 lte-ie9 lte-ie8 lte-ie7 lte-ie6 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 7]><html lang="en" class="no-js wf-inactive ie7 lte-ie9 lte-ie8 lte-ie7 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 8]><html lang="en" class="no-js wf-inactive ie8 lte-ie9 lte-ie8 gte-ie8 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if IE 9]><html lang="en" class="no-js wf-inactive ie9 lte-ie9 gte-ie9 gte-ie8 gte-ie7 gte-ie6"><![endif]]]></xsl:comment>
	<xsl:comment><![CDATA[[if !(lte IE 9)]><!]]></xsl:comment><html lang="en" class="no-js wf-inactive"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
		<head>
	<meta charset="utf-8"/>

	<xsl:text disable-output-escaping="yes">
	&lt;!--

	  (o_                    _o)
	  //\    Hello there!    /\\
	  V_/_                  _\_V
	==============================

	If you, like us, enjoy adding comments
	for those peeking under the hood, you
	can do it like this.

	--&gt;
	</xsl:text>

	<title><xsl:value-of select="$page-title"/><xsl:text> &#8212; </xsl:text><xsl:value-of select="$website-name"/></title>

	<!-- Use the .htaccess and remove these lines to avoid edge case issues.
 			More info: h5bp.com/i/378 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta name="description" content=""/>

	<!-- Mobile viewport optimized: h5bp.com/viewport -->
	<meta name="viewport" content="width=device-width"/>

<!-- For iPad with high-resolution Retina display running iOS ≥ 7: -->
<link rel="apple-touch-icon-precomposed" sizes="152x152" href="{$workspace}/apple-touch-icon-152-precomposed.png">
<!-- For iPhone with high-resolution Retina display running iOS ≥ 7: -->
<link rel="apple-touch-icon-precomposed" sizes="120x120" href="{$workspace}/apple-touch-icon-120-precomposed.png">
<!-- For the iPad mini and the first- and second-generation iPad on iOS ≤ 6: -->
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{$workspace}/apple-touch-icon-72-precomposed.png">
<!-- For non-Retina iPhone, iPod Touch, and Android 2.1+ devices: -->
<link rel="apple-touch-icon-precomposed" href="{$workspace}/apple-touch-icon-precomposed.png">

	<link type="text/plain" rel="author">
		<xsl:attribute name="href">
			<xsl:value-of select="$workspace"/>
			<xsl:text>/humans.txt</xsl:text>
		</xsl:attribute>
	</link>

	<!-- Styles are generated using Compass and the html5-boilerplate gem in workspace/scss -->
	<link rel="stylesheet" href="{$workspace}/css/style.css"/>

	<!-- More ideas for your <head> here: h5bp.com/d/head-Tips -->

	<!-- Most JavaScript at the bottom, except Modernizr and jquery. -->
	<script src="{$workspace}/js/modernizr-2.5.2.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!-->
	<script src="https://www.google.com/jsapi"></script>
	<script>
		google.load("webfont", "1");

		google.setOnLoadCallback(function() {
			WebFont.load({
			typekit: {
			    id:''
			}});
		});
	</script>
-->

</head>
<body>
	<xsl:attribute name="id">
		<xsl:choose>
			<xsl:when test="//login-info/@logged-in = 'false' and not(//auth-token/entry)">
				<xsl:text>log-in</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$current-page"/>
				<xsl:text>_page</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:attribute>
	<!-- Prompt IE 6 users to install Chrome Frame. Remove this if you support IE 6.
 			chromium.org/developers/how-tos/chrome-frame-getting-started -->
	<xsl:comment>
		<!--[if lt IE 7]><p class=chromeframe>Your browser is <em>ancient!</em> <a href="http://browsehappy.com/">Upgrade to a different browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to experience this site.</p><![endif]-->
	</xsl:comment>

	<header role="banner">
		<a href="{$root}">
			<xsl:choose>
				<xsl:when test="//auth-token/entry and not(//current-user/entry)">
					<xsl:value-of select="//auth-token/entry/user/item"/>
					<xsl:text>&#8217;s Health Diary</xsl:text>
				</xsl:when>
				<xsl:when test="//current-user/entry">
					<xsl:value-of select="//current-user/entry/user/item"/>
					<xsl:text>&#8217;s Health Diary</xsl:text>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>A name more awesome than Health Diary</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</a>
	</header>

	<div>
<xsl:choose>
	<xsl:when test="not($cookie-username) and not(//auth-token/entry)">
		<div>
			<form action="{$root}/symphony/login/" method="post" class="frame">
				<fieldset>
					<legend>Log in</legend>
					<label for="username">Username</label>
					<input id="username" name="username" type="text" autofocus="autofocus"/>
					<label for="password">Password</label>
					<input id="password" name="password" type="password"/>
				</fieldset>
				<input name="redirect" type="hidden" value="{$current-url}"/>
				<div class="actions">
					<button name="action[login]" type="submit" accesskey="s">Login</button>
					<a href="{$root}/symphony/login/retrieve-password/" class="action-link">Retrieve password?</a>
				</div>
			</form>
		</div>
	</xsl:when>
	<xsl:otherwise>
	<!-- Individual pages include role="main" and role="complimentary" -->
		<xsl:apply-templates />
	</xsl:otherwise>
</xsl:choose>
	</div>
	<footer>
		<xsl:if test="//current-user/entry or $url-auth-token">
			<div>
				<h2>param Debug</h2>
				<textarea>
					<xsl:copy-of select="//data"/>
				</textarea>

				<xsl:if test="$cookie-username">
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="//current-user/entry/token"/>
						</xsl:attribute>
						<xsl:text>Your auth-token URL</xsl:text>
					</a>
				</xsl:if>
			</div>
		</xsl:if>
	<a href="{$root}/symphony">Admin</a>
	<a href="{$root}/symphony/logout">Log Out</a>
	</footer>

	<!-- Base scripts loaded via google loader

		 Grab Google API's jQuery fall back to local if offline 
		 Note: If you want to actually use webfonts, it's better
		 to move this back into <head> to deal with the flash of
		 unstyled text.

		 I prefer loading a newer version of jQuery than what
		 Symphony uses. Also, you'll notice that I pull jQueryUI
		 as a default, you don't need to, but I find it useful
		 the projects I work on.
	-->
	<script src="//cdnjs.cloudflare.com/ajax/libs/d3/3.2.2/d3.v3.min.js"></script>
	<!-- scripts concatenated and minified via build script -->
	<script src="{$workspace}/js/plugins.js"></script>
	<script src="{$workspace}/js/script.js"></script>
	<!-- end scripts -->

	<!-- Asynchronous Google Analytics snippet. Change UA-XXXXX-X to be your site's ID.
 			mathiasbynens.be/notes/async-analytics-snippet -->
<!--
<xsl:if test="//login-info/@logged-in = 'false'">
	<script>
		var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
		(function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
		g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
		s.parentNode.insertBefore(g,s)}(document,'script'));
	</script>
</xsl:if>
-->
</body>
</html>
</xsl:template>

</xsl:stylesheet>
