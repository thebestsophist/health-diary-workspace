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
	Log when a doctorÕs visit started.
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/medical-visit)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="visit" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/medical-visit/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/medical-visit)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="visit-start">When did the visit start?</label>
				<input id="visit-start" name="fields[visit-time][start][]" type="datetime-local">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/medical-visit/post-values/visit-time/start">
								<xsl:value-of select="events/medical-visit/post-values/visit-time/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>

				<input name="id" type="hidden" value="{$id}"/>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=visit-start-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[medical-visit]" type="submit" value="Save" />
			</fieldset>
		</form>
	</section>
</xsl:template>

</xsl:stylesheet>