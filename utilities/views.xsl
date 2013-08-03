<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="list-appointment">
	<li>
    	<a>
		    <xsl:attribute name="href">
		    	<xsl:value-of select="$root"/>
		    	<xsl:text>/view/visits/</xsl:text>
				<xsl:value-of select="@id"/>
		    	<xsl:if test="$url-auth-token">
		    		<xsl:text>?auth-token=</xsl:text>
		    		<xsl:value-of select="$url-auth-token"/>
		    	</xsl:if>
		    </xsl:attribute>
    		<xsl:value-of select="//entry[@id = doctor]/name"/>
    		<xsl:text>: </xsl:text>
    		<xsl:call-template name="format-date">
    			<xsl:with-param name="date" value="time"/>
    			<xsl:with-param name="format" value="'w. m x, t'"/>
    		</xsl:call-template>
		</a>
	</li>
</xsl:template>

<xsl:template name="view-visits">
	<h1>
		<xsl:text>Appointment at </xsl:text>
		<xsl:call-template name="format-date">
			<xsl:with-param name="date" value="time/date/start"/>
			<xsl:with-param name="format" value="'w., m. x t'"/>
		</xsl:call-template>
	</h1>
	<section role="main">
		<dl class="overview">
			<dt>Doctor</dt>
			<dd>
				<xsl:value-of select="doctor"/>
			</dd>
			<dt>Phone</dt>
			<dd>
				<a>
					<xsl:attribute name="href">
						<xsl:text>tel:</xsl:text>
						<xsl:value-of select="concat(//current-doctor/entry/phone,'.','')"/>
					</xsl:attribute>
					<xsl:value-of select="//current-doctor/entry/phone"/>
				</a>
			</dd>
			<xsl:if test="//current-doctor/entry/fax">
			<dt>Fax</dt>
				<dd>
					<a>
						<xsl:attribute name="href">
							<xsl:text>tel:</xsl:text>
							<xsl:value-of select="concat(//current-doctor/entry/fax,'.','')"/>
						</xsl:attribute>
						<xsl:value-of select="//current-doctor/entry/fax"/>
					</a>
				</dd>
			</xsl:if>
			
		</dl>
	<!-- map -->

		<xsl:copy-of select="comment/*"/>
		<nav>
			<a>
    			<xsl:attribute name="href">
    				<xsl:value-of select="$root"/>
    				<xsl:text>/update/visit-start/</xsl:text>
    				<xsl:value-of select="@id"/>
    				<xsl:if test="$url-auth-token">
    					<xsl:text>?auth-token=</xsl:text>
    					<xsl:value-of select="$url-auth-token"/>
    				</xsl:if>
				</xsl:attribute>
				<xsl:text>Set start time</xsl:text>
			</a>
		</nav>
	</section>
</xsl:template>

<xsl:template name="view-prescription">
		<h1>
			<xsl:value-of select="medication"/>
		</h1>
		<section role="main">
			<dl class="overview">
				<dt>Start</dt>
				<dd>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" value="time/date/start"/>
						<xsl:with-param name="format" value="'w., m. x'"/>
					</xsl:call-template>
				</dd>
				<dt>End</dt>
				<dd>
					<xsl:call-template name="format-date">
						<xsl:with-param name="date" value="time/date/end"/>
						<xsl:with-param name="format" value="'w., m. x'"/>
					</xsl:call-template>
				</dd>
				<dt>Doctor</dt>
				<dd>
					<xsl:value-of select="doctor"/>
				</dd>
			</dl>
		</section>
</xsl:template>

<xsl:template name="view-doctor">
	<h1>
		<xsl:value-of select="name"/>
	</h1>
	<section role="main">
		<dl class="overview">
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
			<xsl:if test="fax">
				<dt>Fax</dt>
				<dd>
					<xsl:value-of select="fax"/>
				</dd>
			</xsl:if>
			<dt>Affiliation</dt>
			<dd>
				<xsl:for-each select="affiliation/item">
					<xsl:value-of select="."/>
					<xsl:if test="position() != last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</dd>
			<xsl:if test="suite">
				<dt>Suite</dt>
				<dd>
					<xsl:value-of select="suite"/>
				</dd>
			</xsl:if>
		</dl>
		<a>
			<xsl:attribute name="href">
				<xsl:text>http://maps.google.com/maps?z=</xsl:text>
				<xsl:value-of select="location/map/@zoom"/>
				<xsl:text>&amp;t=m&amp;q=loc:</xsl:text>
				<xsl:value-of select="location/@latitude"/>
				<xsl:text>+</xsl:text>
				<xsl:value-of select="location/@longitude"/>
			</xsl:attribute>
			<xsl:text>Get Directions</xsl:text>
		</a>
		<h2>Notes</h2>
		<xsl:copy-of select="comment/*"/>
		<nav>
			<a class="optional">
				<xsl:attribute name="href">
			    	<xsl:value-of select="$root"/>
			    	<xsl:text>/view/doctors/</xsl:text>
			    	<xsl:if test="$url-auth-token">
			    		<xsl:text>?auth-token=</xsl:text>
			    		<xsl:value-of select="$url-auth-token"/>
			    	</xsl:if>
			    </xsl:attribute>
				<xsl:text>All Doctors</xsl:text>
			</a>
		</nav>
	</section>
</xsl:template>

</xsl:stylesheet>