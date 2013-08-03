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
	View all of a user's doctors, or view a specific doctorÕs info page.
	
	These are meant to be summaries for mobile view
-->
<xsl:template match="/data">
	<xsl:choose>
	<!-- Specific Doctor -->
		<xsl:when test="view-your-current-doctor-current-doctor/entry">
			<xsl:apply-templates select="view-your-current-doctor-current-doctor/entry"/>
		</xsl:when>
	<!-- Landing -->
		<xsl:otherwise>
			<section role="main">
				<nav>
					<xsl:choose>
						<xsl:when test="view-your-current-doctors/entry">
							<xsl:for-each select="view-your-current-doctors/entry">
								<a>
									<xsl:attribute name="href">
										<xsl:value-of select="@id"/>
										<xsl:if test="$url-auth-token">
											<xsl:text>?auth-token=</xsl:text>
											<xsl:value-of select="$url-auth-token"/>
										</xsl:if>
									</xsl:attribute>
									<xsl:value-of select="name"/>
								</a>
							</xsl:for-each>
						</xsl:when>
						<xsl:otherwise>
							<p>You donâ€™t have any doctors saved, yet.</p>
						</xsl:otherwise>
					</xsl:choose>
					<a class="optional">
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/create/doctor</xsl:text>
							<xsl:value-of select="@id"/>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
						<xsl:text>Add a New Doctor</xsl:text>
					</a>
				</nav>
			</section>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="view-your-current-doctor-current-doctor/entry">
	<xsl:call-template name="view-doctor"/>
</xsl:template>
</xsl:stylesheet>