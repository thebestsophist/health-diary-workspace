<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/api-master.xsl"/>
<!--
	Export doctors
	URL: {$root}/export/[username]/doctors
	Optional URL variables:
		`auth-token`: Secret user token to access their content without logging in
		`format`: outputs in `json` (default), `xml`, and `jsonp`
		
	Export all the doctors associated with the logged-in user
-->
<xsl:template match="/data">
	<xsl:copy-of select="export-doctors"/>
</xsl:template>
</xsl:stylesheet>