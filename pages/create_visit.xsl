<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	A new doctorÕs appointment, or hospital/clinic visit.
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/medical-visit)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
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
				<label for="start">Appointment Time</label>
				<input id="start" name="fields[time][start][]" type="datetime-local" required="required">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="//events/medical-visit/post-values/time/start">
								<xsl:value-of select="//events/medical-visit/post-values/time/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="doctor">Doctor or Medical Facility</label>
				<select id="doctor" name="fields[doctor]" required="required">
					<xsl:for-each select="//current-doctors/entry">
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="@id"/>
							</xsl:attribute>
							<xsl:if test="//events/medical-visit/post-values/doctor = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>

				<input type="hidden" name="fields[patient][]">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="//auth-token/entry/user/item">
								<xsl:value-of select="//auth-token/entry/user/item/@id"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="//current-user/entry/user/item/@id"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>

				<input type="hidden" name="fields[visit-time][start][]" value="9876-05-04T03:21"/>
				<nav>
					<a href="#annotations" class="step2">Notes &amp; Scheduling info</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/medical-visit)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="date-scheduled">Did you schedule this today?</label>
				<input id="date-scheduled" name="fields[day-scheduled][start][]" type="date">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/medical-visit/post-values/day-scheduled/start">
								<xsl:value-of select="events/medical-visit/post-values/day-scheduled/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:value-of select="events/medical-visit/post-values/day-scheduled"/>
				</input>

				<label for="notes">Notes</label>
				<textarea id="notes" name="fields[comment]" rows="15" cols="50">
					<xsl:value-of select="//events/medical-visit/post-values/comment"/>
				</textarea>

				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=visit-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[medical-visit]" type="submit" value="Submit" />
				<nav>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>