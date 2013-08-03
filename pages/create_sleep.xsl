<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Add a new sleep diary entry
	Pushes to close out the chronic diary if user has it enabled
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/sleep)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>

		<form id="sleep" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/sleep/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/sleep)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="start-time">When are you going to bed?</label>
				<input id="start-time" name="fields[sleep-time][start][]" type="datetime-local" required="required">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/sleep/post-values/sleep-time/start/item">
								<xsl:value-of select="events/sleep/post-values/sleep-time/start/item"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="sleep-feeling">How tired are you?</label>
				<select id="sleep-feeling" name="fields[sleep-feeling]" required="required">
					<option value="Very sleepy">
						<xsl:if test="events/sleep/post-values/sleep-feeling = 'Very Sleepy'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Very sleepy</xsl:text>
					</option>
					<option value="Awake but tired">
						<xsl:if test="events/sleep/post-values/sleep-feeling = 'Awake but tired'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Awake, but tired</xsl:text>
					</option>
					<option value="Wide awake">
						<xsl:if test="events/sleep/post-values/sleep-feeling = 'Wide awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Wide awake</xsl:text>
					</option>
				</select>	
				<input name="fields[sleep-time][end][]" type="hidden" value="9876-05-04T03:21"/>
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
						<xsl:if test="//chronic-diary = 'Yes' and (number(translate(substring($current-time,0,6),':','')) &lt; 1100 or number(translate(substring($current-time,0,6),':','')) &gt; 1900)">
							<xsl:text>/update/chronic/sleep/</xsl:text>
							<xsl:if test="number(translate(substring($current-time,0,6),':','')) &lt; 0500">
								<xsl:value-of select="date:add($today,'-P1D')"/>
							</xsl:if>
						</xsl:if>
						<xsl:text>?source=sleep-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[sleep]" type="submit" value="Submit" />
				<nav>
					<a href="#set-alarm" class="step2 optional">Set Alarm</a>
					<a href="#annotations" class="step3 optional">Comments</a>
				</nav>
			</fieldset>
			<fieldset id="set-alarm">
				<xsl:if test="not(events/sleep)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="alarm">What time is your alarm set to?</label>
				<input id="alarm" name="fields[alarm]" type="time" placeholder="--:-- --">
					<xsl:attribute name="value">
						<xsl:value-of select="events/sleep/post-values/alarm"/>
					</xsl:attribute>
				</input>

				<input name="action[sleep]" type="submit" value="Submit" />
				<nav>
					<a href="#annotations" class="step3 optional">Comments</a>
					<a href="#start" class="step1 back">Back to start</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/sleep)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="comment">Comments</label>
				<textarea id="comment" name="fields[comment]">
					<xsl:value-of select="events/sleep/post-values/comment"/>
				</textarea>

				<input name="action[sleep]" type="submit" value="Submit" />
				<nav>
					<a href="#set-alarm" class="step2 back">Set Alarm</a>
					<a href="#start" class="step1 back">Back to start</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>