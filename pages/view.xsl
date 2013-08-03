<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/views.xsl"/>
<!--
	Blank page for organizing all mobile view pages.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
	<section role="main">
	
	</section>
</xsl:template>
</xsl:stylesheet>