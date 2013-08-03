<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>


<!--
	Close open ailment entries.
	
	Needs:
		- Allow updating ailment entries without closing them.
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/ailment)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="ailment" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/ailment/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="end">
					<xsl:text>When did the </xsl:text>
					<xsl:choose>
						<xsl:when test="//update-ailment-diary/entry/type = 'Migraine'">
							<xsl:text>headache</xsl:text>
						</xsl:when>
						<xsl:when test="//update-ailment-diary/entry/type = 'Other'">
							<xsl:text>pain</xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:text> end?</xsl:text>
				</label>
				<input name="id" type="hidden" value="{//update-ailment-diary/entry/@id}"/>
				<input name="fields[time][start][]" type="hidden" value="{//update-ailment-diary/entry/time/date/start}T{//update-ailment-diary/entry/time/date/start/@time}"/>
				<input id="end" name="fields[time][end][]" type="datetime-local" required="required">
					<xsl:attribute name="value">
						<xsl:value-of select="events/ailment/post-values/time/end"/>
					</xsl:attribute>
				</input>
				<nav>
					<a href="#annotations" class="step3 optional">Triggers &amp; Comments</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="trigger">Triggers</label>
				<textarea id="trigger" name="fields[triggers]" placeholder="Do you know what set off this episode?">
					<xsl:choose>
						<xsl:when test="events/ailment/post-values/triggers">
							<xsl:value-of select="events/ailment/post-values/triggers"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="update-ailment-diary/entry/triggers"/>
						</xsl:otherwise>
					</xsl:choose>
				</textarea>
				<label for="comment">Comments</label>
				<textarea id="comment" name="fields[comments]" placeholder="Be as descriptive as you would like.">
					<xsl:choose>
						<xsl:when test="events/ailment/post-values/comments">
							<xsl:value-of select="events/ailment/post-values/comments"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="update-ailment-diary/entry/comment"/>
						</xsl:otherwise>
					</xsl:choose>
				</textarea>

				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=ailment-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[ailment]" type="submit" value="Save" />
				<nav>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>