<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	In case of emergency information for the logged-in (or auth-token confirmed) user
-->
<xsl:template match="/data">
	<h1><xsl:value-of select="current-user/entry/name/item"/></h1>
	<section role="main">
		<ul id="" class="subnav">
			<li><a href="#bio" class="active">Bio</a></li>
			<li><a href="#allergies" class="inactive">Allergies</a></li>
			<li><a href="#medications" class="inactive">Medications</a></li>
			<li><a href="#contacts" class="inactive">Contacts</a></li>
			<xsl:if test="ice-doctors/entry">
				<li><a href="#doctors" class="inactive">Doctors</a></li>
			</xsl:if>
		</ul>
		<div id="bio" class="active">
			<img>
				<xsl:attribute name="src">
					<xsl:value-of select="$workspace"/>
					<xsl:value-of select="//photo/@path"/>
					<xsl:text>/</xsl:text>
					<xsl:value-of select="//photo/filename"/>
				</xsl:attribute>
				<xsl:attribute name="title">
					<xsl:text>A photo of </xsl:text>
					<xsl:value-of select="current-user/entry/name"/>
				</xsl:attribute>
			</img>
			<h3>Address</h3>
			<xsl:copy-of select="ice-user-data/entry/address/*"/>
		</div>
		<div id="allergies" class="inactive">
			<h2>Allergies</h2>
			<xsl:choose>
				<xsl:when test="ice-user-data/entry/allergies/item">
					<ul>
						<xsl:for-each select="ice-user-data/entry/allergies/item">
							<li><xsl:value-of select="current()"/></li>
						</xsl:for-each>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<p>No known allergies</p>
				</xsl:otherwise>
			</xsl:choose>
			<h2>Medicine Allergies</h2>
			<xsl:choose>
				<xsl:when test="ice-user-data/entry/medicine-allergies/item">
					<ul>
						<xsl:for-each select="ice-user-data/entry/medicine-allergies/item">
							<li><xsl:value-of select="current()"/></li>
						</xsl:for-each>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<p>No known allergies</p>
				</xsl:otherwise>			
			</xsl:choose>
		</div>
		<div id="medication" class="inactive">
			<h2>Medications</h2>
			<xsl:choose>
				<xsl:when test="medications/entry">
					<ul>
						<xsl:for-each select="medications/entry">
							<li><xsl:value-of select="name"/></li>
						</xsl:for-each>
					</ul>
				</xsl:when>
				<xsl:otherwise><p>No known medications.</p></xsl:otherwise>
			</xsl:choose>
		</div>
		<div id="contacts" class="inactive">
			<h2>Emergency Contacts</h2>
			<xsl:copy-of select="ice-user-data/entry/contacts/*"/>
		</div>
		<xsl:if test="ice-doctors/entry">
			<div id="doctors">
				<h2>Doctors</h2>
				<xsl:for-each select="ice-doctors/entry">
				<!-- only list doctors, do not list hospitals, urgent cares, etc -->
					<xsl:if test="name">
						<div>
							<h3>
								<xsl:value-of select="name"/>
							</h3>
							<dl>
								<dt>Specialty</dt>
								<dd>
									<xsl:value-of select="specialty"/>
								</dd>
								<dt>Phone</dt>
								<dd>
									<a>
										<xsl:attribute name="href">
											<xsl:text>tel:</xsl:text>
											<xsl:value-of select="phone"/>
										</xsl:attribute>
										<xsl:value-of select="phone"/>
									</a>
								</dd>
								<dt>Affiliation</dt>
								<dd>
									<xsl:for-each select="affiliation/item">
										<xsl:value-of select="."/>
										<xsl:if test="position() != last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each>
								</dd>
							</dl>
						</div>
					</xsl:if>
				</xsl:for-each>
			</div>
		</xsl:if>		
	</section>	

</xsl:template>

</xsl:stylesheet>