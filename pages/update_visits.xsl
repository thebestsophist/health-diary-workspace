<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/selection-body.xsl"/>
<!--
	List all open appointment
-->
<xsl:template match="/data">
	<section role="main">
		<nav>
			<ol>
				<xsl:for-each select="open-visits/entry">
					<li>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:text>/update/visit-start/</xsl:text>
								<xsl:value-of select="@id"/>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="doctor"/>
							<xsl:call-template select="format-date">
								<xsl:with-param name="date" value="date"/>
								<xsl:with-param name="format" value="' w. m. x, Y'"/>
							</xsl:call-template>
						</a>
					</li>
				</xsl:for-each>
			</ol>
		</nav>
	<section>
</xsl:template>
</xsl:stylesheet>