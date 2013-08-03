<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Close the period diary entry
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/activity)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="period" method="post" action="" enctype="multipart/form-data">
			<fieldset id="start">
				<input type="hidden" name="fields[dates][start][]">
					<xsl:attribute name="value">
						<xsl:value-of select="//update-period-diary/entry/dates/date/start"/>
						<xsl:text>T</xsl:text>
						<xsl:value-of select="//update-period-diary/entry/dates/date/start/@time"/>
					</xsl:attribute>
				</input>
				<label for="start">What day did your period end?</label>
				<input id="start" name="fields[dates][end][]" type="datetime-local">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/period/post-values/dates/end">
								<xsl:value-of select="events/period/post-values/dates/end"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				
				<label for="annotation">Any comments?</label>
				<textarea id="annotation" name="fields[comment]" placeholder="Anything unusual? Does it seem early or late? More uncomfortable than usual?">
					<xsl:choose>
						<xsl:when test="events/period/post-values/comment">
							<xsl:value-of select="events/period/post-values/comment"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="//update-period-diary/entry/comment"/>
						</xsl:otherwise>
					</xsl:choose>
				</textarea>

				<input name="id" type="hidden" value="{//update-period-diary/entry/@id}"/>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=period-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[period]" type="submit" value="save"/>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>