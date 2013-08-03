<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">
<xsl:import href="../utilities/date-time.xsl"/>
<xsl:import href="../utilities/api.xsl"/>

<xsl:output method="xml" omit-xml-declaration="yes" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
<response>
<xsl:choose>
	<xsl:when test="not(//current-user/entry) and not(//auth-token/entry)">
		<error>You are not authorized. Please log in.</error>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates />
	</xsl:otherwise>
</xsl:choose>
</response>
</xsl:template>

</xsl:stylesheet>
