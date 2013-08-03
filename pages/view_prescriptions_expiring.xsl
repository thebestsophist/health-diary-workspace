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
	View expiring prescriptions.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
	<section role="main">
		<nav>
			<xsl:for-each select="//view-prescriptions-expiring/entry">
				<a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/view/prescription/</xsl:text>
						<xsl:value-of select="@id"/>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:value-of select="medication"/>
					<xsl:text>: </xsl:text>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" value="time/date/start"/>
						<xsl:with-param name="format" value="'w. m. x'"/>
					</xsl:call-template>
			</xsl:for-each>
		</nav>
	</section>
</xsl:template>
</xsl:stylesheet>