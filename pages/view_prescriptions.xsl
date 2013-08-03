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
	View all current prescriptions for the current user.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
<xsl:choose>
	<xsl:when test="not($id)">
		<section role="main">
			<nav>
				<xsl:for-each select="//view-prescriptions/entry">
					<a>
					<xsl:attribute name="href">
						<xsl:value-of select="@id"/>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
						<xsl:value-of select="medication"/>
						<xsl:text>(Expires: </xsl:text>
						<xsl:call-template name="format-date">
							<xsl:with-param name="date" value="time/date/start"/>
							<xsl:with-param name="format" value="'w. m. x'"/>
						</xsl:call-template>
						<xsl:text>)</xsl:text>
				</xsl:for-each>
			</nav>
		</section>
	</xsl:when>
	<xsl:otherwise>
		<xsl:apply-templates select="//view-current-prescription/entry/medication"/>
	</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="view-current-prescription/entry">
	<xsl:call-template name="view-prescription"/>
</xsl:template>

</xsl:stylesheet>