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
	View the upcoming visits for this week.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
	<section role="main">
		<nav>
			<ol>
				<xsl:for-each select="//view-upcoming-appointments/entry">
					<xsl:call-template name="list-appointment"/>
				</xsl:for-each>
			</ol>
		</nav>
	</section>
</xsl:template>
</xsl:stylesheet>