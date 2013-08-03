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
	Update the end of a doctorÕs visit, allows for measuring the duration of a visit, update comments about how good a visit was.
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
				<label for="visit-start">When did the visit End?</label>
				<input id="visit-start" name="fields[visit-time][end][]" type="datetime-local">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/medical-visit/post-values/visit-time/end">
								<xsl:value-of select="events/medical-visit/post-values/visit-time/end"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>

				<label for="rating">How was the appointment?</label>
				<select id="rating" name="fields[rating]">
					<option value="Great">
						<xsl:if test="events/medical-visit/post-values/rating = 'Great'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Great</xsl:text>
					</option>
					<option value="Good">
						<xsl:if test="events/medical-visit/post-values/rating = 'Good'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Good</xsl:text>
					</option>
					<option value="Medium">
						<xsl:if test="events/medical-visit/post-values/rating = 'Medium'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Medium</xsl:text>
					</option>
					<option value="Mediocre">
						<xsl:if test="events/medical-visit/post-values/rating = 'Mediocre'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Mediocre</xsl:text>
					</option>
					<option value="Terrible">
						<xsl:if test="events/medical-visit/post-values/rating = 'Terrible'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Terrible</xsl:text>
					</option>
				</select>

				<input name="id" type="hidden" value="{$id}"/>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=visit-end-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[medical-visit]" type="submit" value="Save" />
				<nav>
					<a href="#annotations" class="step2 optional">Notes</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/medical-visit)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="notes">Notes</label>
				<textarea id="notes" name="fields[comment]" placeholder="Any notes?">
					<xsl:value-of select="events/medical-visit/post-values/comment"/>
				</textarea>
				<input name="action[medical-visit]" type="submit" value="Save" />
				<nav>
					<a href="#start" class="step1 back">Notes</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>

</xsl:stylesheet>