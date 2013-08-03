<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	List all open ailments for the current user
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/ailment)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>

		<nav>
			<xsl:for-each select="open-ailments/entry">
				<a>
					<xsl:attribute name="class">
					<!-- Intensity -->
						<xsl:value-of select="intensity/item/@handle"/>
						<xsl:text> </xsl:text>
					<!-- Impact -->
						<xsl:value-of select="impact/item/@handle"/>
					</xsl:attribute>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/update/ailment-ttr/</xsl:text>
						<xsl:value-of select="@id"/>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				<!-- Type -->
					<xsl:choose>
						<xsl:when test="type/item = 'Migraine'">
							<xsl:text>Headache: </xsl:text>
						</xsl:when>
						<xsl:when test="type/item = 'Neurological'">
							<xsl:text>Neurological: </xsl:text>
						</xsl:when>
						<xsl:when test="type/item = 'Illness'">
							<xsl:text>Illness: </xsl:text>
						</xsl:when>
						<xsl:when test="type/item = 'Other'">
							<xsl:text>Body Ailment: </xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" select="time/date/start"/>
						<xsl:with-param name="format" select="'w., m. x t'"/>
					</xsl:call-template>
				</a>
			</xsl:for-each>
		</nav>
	</section>
</xsl:template>

</xsl:stylesheet>