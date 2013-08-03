<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Update sleep diary for when user wakes up
	If in the morning and user as preference set, pushes to wake-time chronic diary
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/sleep)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="sleep" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/sleep/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<label for="wake-time">When did you wake up?</label>
			<input type="hidden" name="fields[sleep-time][start][]">
				<xsl:attribute name="value">
					<xsl:value-of select="update-sleep-diary/entry/sleep-time/date/start"/>
					<xsl:text>T</xsl:text>
					<xsl:value-of select="update-sleep-diary/entry/sleep-time/date/start/@time"/>
				</xsl:attribute>
			</input>
			<input id="wake-time" name="fields[sleep-time][end][]" type="datetime-local" required="required">
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="events/sleep/post-values/sleep-time/end">
							<xsl:value-of select="events/sleep/post-values/sleep-time/end/item"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$today"/>
							<xsl:text>T</xsl:text>
							<xsl:value-of select="$current-time"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</input>
			
			<label for="wake-feeling">How were you feeling when you woke up?</label>
	    	<select id="wake-feeling" name="fields[wake-feeling]" required="required">
	    		<option value="Very sleepy">
	    			<xsl:if test="events/sleep/post-values/wake-feeling = 'Very sleepy'">
	    				<xsl:attribute name="selected">
	    					<xsl:text>selected</xsl:text>
	    				</xsl:attribute>
	    			</xsl:if>
	    			<xsl:text>Very sleepy</xsl:text>
	    		</option>
	    		<option value="Awake but tired">
	    			<xsl:if test="events/sleep/post-values/wake-feeling = 'Awake but tired'">
	    				<xsl:attribute name="selected">
	    					<xsl:text>selected</xsl:text>
	    				</xsl:attribute>
	    			</xsl:if>
	    			<xsl:text>Awake but tired</xsl:text>
	    		</option>
	    		<option value="Wide awake">
	    			<xsl:if test="events/sleep/post-values/wake-feeling = 'Wide awake'">
	    				<xsl:attribute name="selected">
	    					<xsl:text>selected</xsl:text>
	    				</xsl:attribute>
	    			</xsl:if>
	    			<xsl:text>Wide awake</xsl:text>
	    		</option>
			</select>
			
			<label for="waking">How many times did you wake up in the night?</label>
			<input id="waking" name="fields[waking-up]" type="number">
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="events/sleep/post-values/waking-up">
							<xsl:value-of select="events/sleep/post-values/waking-up"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="update-sleep-diary/entry/waking-up"/>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</input>
			
			<label for="spent-awake">How long were you awake?</label>
			<input id="spent-awake" name="fields[spent-awake]" type="text" class="timer" placeholder="--:--">
				<xsl:attribute name="value">
					<xsl:choose>
						<xsl:when test="events/sleep/post-values/spent-awake">
							<xsl:value-of select="events/sleep/post-values/spent-awake"/>
						</xsl:when>
						<xsl:otherwise><xsl:text>00:00</xsl:text></xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
			</input>
			
			<label for="comment">Comments</label>
			<textarea id="comment" name="fields[comment]">
				<xsl:choose>
					<xsl:when test="events/sleep/post-values/comment">
						<xsl:value-of select="events/sleep/post-values/comment"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="update-sleep-diary/entry/comment"/>
					</xsl:otherwise>
				</xsl:choose>
			</textarea>

			<input name="canofspam" value="{$canofspam}" type="hidden" />
			<input name="id" type="hidden" value="{$id}"/>
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:if test="//chronic-diary = 'Yes' and number(translate(substring($current-time,0,6),':','')) &lt; 1000 ">
							<xsl:text>/create/chronic</xsl:text>
						</xsl:if>
						<xsl:text>?source=sleep-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
			<input name="action[sleep]" type="submit" value="Submit"/>
		</form>
	</section>
	
</xsl:template>
</xsl:stylesheet>