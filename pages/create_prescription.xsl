<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Add a new prescription to be tracked
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/prescription)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="prescription" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/prescription/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/prescription)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="medication">What is this prescription for?</label>
				<select id="medication" name="fields[medication]">
					<xsl:for-each select="//medications/entry">
						<option value="{@id}">
							<xsl:if test="events/prescription/post-values/medication = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>
				<p class="note">Is your medication unlisted? <a href="{$root}/symphony/publish/medications/">Add it to the medication list first</a>.</p>
				<label for="doctor">Who prescribed this?</label>
				<select id="doctor" name="fields[doctor]">
					<xsl:for-each select="//current-doctors/entry">
						<option value="{@id}">
							<xsl:if test="events/prescription/post-values/doctor = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>
				<label for="pharmacy">Pharmacy</label>
				<input id="pharmacy" name="fields[pharmacy]" type="text">
					<xsl:value-of select="events/prescription/post-values/pharmacy"/>
				</input>
				<label for="manufacturer">Manufacturer</label>
				<input id="manufacturer" name="fields[manufacturer]" type="text">
					<xsl:value-of select="events/prescription/post-values/manufacturer"/>
				</input>

				<nav>
					<a href="#date" class="step2">Date &amp; Dosage</a>
				</nav>
			</fieldset>
			<fieldset id="date">
				<xsl:if test="not(events/prescription)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>

				<label for="date-start">Start date for the prescription</label>
				<input id="date-start" name="fields[prescription-time][start][]" type="date">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/prescription/post-values/prescription-time/start">
								<xsl:value-of select="events/prescription/post-values/prescription-time/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="date-end">End date for the prescription</label>
				<input id="date-end" name="fields[prescription-time][end][]" type="date">
					<xsl:value-of select="events/prescription/post-values/prescription-time/end"/>
				</input>

				<label for="dosage">Dose instructions</label>
				<textarea id="dosage" name="fields[dose-instructions]" placeholder="As listed on the label.">
					<xsl:value-of select="events/prescription/post-values/does-instructions"/>
				</textarea>
				<label for="single-dose">Single does</label>
				<input id="single-dose" name="fields[single-dose]" type="text">
					<xsl:value-of select="events/prescription/post-values/single-dose"/>
				</input>

    			<input type="hidden" name="fields[user][]" value="{//current-user/entry/user/item/@id}"/>
    			<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=prescription-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[prescriptions]" type="submit" value="Save" />

				<nav>
					<a href="#annotations" class="step3">Notes</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/prescription)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="notes">Notes</label>
				<textarea id="notes" name="fields[notes]" placeholder="Any comments?">
					<xsl:value-of select="events/prescription/post-values/notes"/>
				</textarea>

				<input name="action[prescription]" type="submit" value="Save" />

				<nav>
					<a href="#dosage-info" class="step2 back">Back</a>
					<a href="#start" class="step1 back">Back to Start</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>