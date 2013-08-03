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
	View all future visits.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
<section role="main">
	<xsl:choose>
		<xsl:when test="not(//current-visit/entry)">
			<nav>
				<ol>
					<xsl:for-each select="//view-scheduled-visits/entry"/>
						<xsl:call-template name="list-appointment"/>
					</xsl:for-each>
				</ol>
			</nav>
		</xsl:when>
		<xsl:otherwise>
		</xsl:otherwise>
	</xsl:choose>
</section>
</xsl:template>

</xsl:stylesheet>