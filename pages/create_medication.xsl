<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Add a new dose to the medication diary
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/medication)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="medication" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/medication/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/medication)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="start">What time is it?</label>
				<input id="start" name="fields[date][start][]" type="datetime-local" required="required">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/medication/post-values/time/start">
								<xsl:value-of select="events/medication/post-values/time/start/item"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="medication">What are you taking?</label>
				<select id="medication" name="fields[medication]" required="required" multiple="multiple">
					<xsl:for-each select="//medications/entry">
						<option>
							<xsl:attribute name="value">
								<xsl:value-of select="@id"/>
							</xsl:attribute>
							<xsl:if test="events/medication/post-values/medication = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>
				<label for="dosage">Dosage</label>
				<input id="dosage" name="fields[dosage]" type="text" placeholder="If not the normal dosage.">
					<xsl:value-of select="events/medication/post-values/dosage"/>
				</input>
				
				<label for="ailments">Is this for any ailments current ailments?</label>
				<select id="ailiments" name="fields[ailment]" multiple="multiple">
					<xsl:for-each select="open-ailments/entry">
						<option value="{@id}">
							<xsl:if test="//ailment/item = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
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
						</option>
					</xsl:for-each>
				</select>
				
				<input type="hidden" name="fields[author][]">
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

				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=dose-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[medication]" type="submit" value="Submit" />
				<nav>
					<a href="#annotations" class="step2 optional">Annotations</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/medication)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>

				<label for="comment">Comments</label>
				<textarea id="comment" name="fields[comment]" rows="5" cols="50">
					<xsl:value-of select="events/medication/post-values/comment"/>
				</textarea>
				<input name="action[medication]" type="submit" value="Submit" />
				<nav>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>