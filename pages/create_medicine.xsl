<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!-- 
	Add a new type of medicine
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/prescription)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="medicine" method="post" action="" enctype="multipart/form-data">
			<fieldset id="start" class="active">
				<label for="name">Name of medicine</label>
				<input id="name" name="fields[name]" type="text" required="required">
					<xsl:value-of select="events/medicine/post-values/name"/>
				</input>
				<label for="prescription">Is this prescription medicine?</label>
				<input id="prescription" name="fields[prescription]" type="checkbox">
					<xsl:if test="events/medicine/post-values/prescription = 'yes'">
						<xsl:attribute name="checked">
							<xsl:text>checked</xsl:text>
						</xsl:attribute>
					</xsl:if>
				</input>

				<label for="user">Who is this medicine for?</label>
				<select id="user" name="fields[user][]" multiple="multiple">
					<xsl:for-each select="users/author">
						<option value="{@id}">
							<xsl:if test="@id = //current-user/entry/user/item/@id or events/medicine/post-values/user = @id">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="name"/>
						</option>
					</xsl:for-each>
				</select>

				<nav>
					<a href="#annotations" class="step2">Description &amp; Notes</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<label for="description">Description</label>
				<textarea id="description" name="fields[description]" placeholder="What is this for? Any brand names?">
					<xsl:value-of select="events/medicine/post-values/description"/>
				</textarea>
				<label for="notes">Notes</label>
				<textarea id="notes" name="fields[comment]" placeholder="Any comments or notes?">
					<xsl:value-of select="events/medicine/post-values/comment"/>
				</textarea>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=medicine-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input type="submit" name="action[medicine]" value="Save"/>
			</fieldset>
		</form>
	</section>
</xsl:template>

</xsl:stylesheet>