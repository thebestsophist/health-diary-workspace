<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/views.xsl"/>
<xsl:variable name="id"/>
<!--
	View all recent ailments, or view a specific ailment page.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
	<section role="main">
	<!-- Overview or single -->
		<xsl:choose>
			<xsl:when test="$id = ''">
				<xsl:choose>
					<xsl:when test="view-ailments-recent/entry">
						<nav>
							<xsl:for-each select="view-ailments-recent/entry">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="@id"/>
										<xsl:if test="$url-auth-token">
											<xsl:text>?auth-token=</xsl:text>
											<xsl:value-of select="$url-auth-token"/>
										</xsl:if>
									</xsl:attribute>
									<xsl:attribute name="class">
									<!-- Intensity -->
										<xsl:value-of select="intensity/item/@handle"/>
										<xsl:text> </xsl:text>
									<!-- Impact -->
										<xsl:value-of select="impact/item/@handle"/>
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
					</xsl:when>
					<xsl:otherwise>
						<p>Nothing to list</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
		<!-- Single -->
			<xsl:otherwise>
				<xsl:apply-templates select="view-ailments-current/entry"/>
			</xsl:otherwise>
		</xsl:choose>
	</section>
</xsl:template>

<xsl:template match="view-ailments-current/entry">
	<h1>
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
		    <xsl:with-param name="format" select="'m. x t'"/>
		</xsl:call-template>
		<xsl:if test="time/date/end">
			<xsl:text> to </xsl:text>
			<xsl:choose>
				<xsl:when test="substring(time/date/start,0,10) = substring(time/date/end,0,10)">
					<xsl:call-template name="format-date">
				    	<xsl:with-param name="date" select="time/date/end"/>
					    <xsl:with-param name="format" select="'t'"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="format-date">
				    	<xsl:with-param name="date" select="time/date/end"/>
					    <xsl:with-param name="format" select="'m. x t'"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</h1>
</xsl:template>

</xsl:stylesheet>