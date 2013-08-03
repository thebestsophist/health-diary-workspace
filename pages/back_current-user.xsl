<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />
<!--
	User page.
	URL: {$root}/user/[username]
	Optional URL variables:
		`auth-token`: Secret user token to access their content without logging in
	
	This will be the landing page to view a user’s diary entries. Intended for both logged-in users, and doctors.
-->
<xsl:template match="/">
	<h1><xsl:value-of select="$page-title"/></h1>
</xsl:template>

</xsl:stylesheet>