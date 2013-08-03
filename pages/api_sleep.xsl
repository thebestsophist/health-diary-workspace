<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/api-master.xsl"/>
<!--
	API for sleep diary entries, filter in the URL `start` to `end`
	URL: {$root}/api/ailment/[start]/[end]
	Optional URL variables:
		`auth-token`: Secret user token to access their content without logging in
		`format`: outputs in `json` (default), `xml`, and `jsonp`
-->
<xsl:template match="/data">

</xsl:template>
</xsl:stylesheet>