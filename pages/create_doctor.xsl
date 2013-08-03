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
	Add a new doctor
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/doctors)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="doctor" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/doctors/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/doctors)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="name">Name</label>
				<input id="name" name="fields[name]" type="text" required="required">
					<xsl:attribute name="value">
						<xsl:value-of select="events/docotrs/post-values/name"/>
					</xsl:attribute>
				</input>
				<label for="speciality">Specialty</label>
				<input id="speciality" name="fields[specialty]" type="text" required="required">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/specialty"/>
					</xsl:attribute>
				</input>
				<label for="address">Address</label>
				<input id="address" name="fields[location]" type="text" placeholder="The full address, in one line.">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/location"/>
					</xsl:attribute>
				</input>
				<label for="suite">Suite</label>
				<input id="suite" name="fields[suite]" type="text" placeholder="Suite number">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/suite"/>
					</xsl:attribute>
				</input>

				<label for="affiliation">Affiliation</label>
				<input id="affiliation" name="fields[affiliation]" type="text" placeholder="Name of clinic/hospital.">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/affiliation"/>
					</xsl:attribute>
				</input>
				<nav>
					<a href="#contact" class="step2">Contact info</a>
				</nav>
			</fieldset>
			<fieldset id="contact">
				<xsl:if test="not(events/doctors)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="phone">Phone number:</label>
				<input id="phone" name="fields[phone]" type="phone" placeholder="xxx.xxx.xxxx">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/phone"/>
					</xsl:attribute>
				</input>
				<label for="fax">Fax number:</label>
				<input id="fax" name="fields[fax]" type="phone" placeholder="xxx.xxx.xxxx">
					<xsl:attribute name="value">
						<xsl:value-of select="events/doctors/post-values/fax"/>
					</xsl:attribute>
				</input>
				<input type="hidden" name="fields[patient][]">
					<xsl:attribute name="value">
						<xsl:value-of select="//current-user/entry/user/item/@id"/>
					</xsl:attribute>
				</input>
				<input type="hidden" name="fields[current]" value="yes"/>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=doctor-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[doctors]" type="submit" value="Submit" />
				<nav>
					<a href="#annotations" class="step3 optional">Notes</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/doctors)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="notes">Comments</label>
				<textarea id="notes" name="fields[comment]">
					<xsl:value-of select="events/doctors/post-values/comment"/>
				</textarea>
				<input name="action[doctors]" type="submit" value="Submit" />
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>