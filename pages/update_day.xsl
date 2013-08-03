<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Update all of todayÕs activity entries. Currently unused
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/activity)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<h1>
			<xsl:call-template name="format-date">
				<xsl:with-param name="date" select="update-activity/entry/day/date/start"/>
				<xsl:with-param name="format" select="'M d, Y'"/>
			</xsl:call-template>
		</h1>
		<form id="activity" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/activity/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="type">Is this a work day?</label>
				<select id="type" name="fields[type]" required="required">
					<option value="Work">
						<xsl:if test="update-activity/entry/type/@handle = 'work' or events/activity/post-values/type = 'work'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Work
					</option>
					<option value="Off">
						<xsl:if test="update-activity/entry/type/@handle = 'off' or events/activity/post-values/type = 'off'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Off
					</option>
				</select>
				
					<label for="sick-day">Is this a sick day?</label>
					<select id="sick-day" name="fields[sick-day]">
						<option value="No">
							<xsl:if test="events/activities/post-values/sick-day = 'No' or update-today-activity/entry/sick-day = 'No'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>No</xsl:text>
						</option>
						<option value="Partial">
							<xsl:if test="events/activities/post-values/sick-day = 'Partial' or update-today-activity/entry/sick-day = 'Partial'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Partial</xsl:text>
						</option>
						<option value="Yes">
							<xsl:if test="events/activities/post-values/sick-day = 'Yes' or update-today-activity/entry/sick-day = 'Yes'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Yes</xsl:text>
						</option>
					</select>
				<nav>
					<a href="#work" class="step2">Work Times</a>
					<a href="#feeling" class="step3">How were you feeling?</a>
					<a href="#annotations" class="step4">Comments</a>
				</nav>
			</fieldset>
			<fieldset id="work">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="work-start">When does work start?</label>
				<input name="fields[work-time][start][]" type="datetime-local">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/activity/post-values/work-time/start">
								<xsl:value-of select="events/activity/post-values/work-time/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="update-activity/entry/work-time/date/start}T{update-activity/entry/work-time/date/start/@time"/>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="work-end">When does work end?</label>
				<input name="fields[work-time][end][]" type="datetime-local">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/activity/post-values/work-time/end">
								<xsl:value-of select="events/activity/post-values/work-time/end"/>
							</xsl:when>
							<xsl:otherwise>
							 	<xsl:value-of select="update-activity/entry/work-time/date/end}T{update-activity/entry/work-time/date/end/@time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<nav>
					<a href="#start" class="step1 Start">Start</a>
					<a href="#feeling" class="step3">How were you feeling?</a>
					<a href="#annotations" class="step4">Comments</a>
				</nav>
			</fieldset>
			<fieldset id="feeling">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<legend>How you felt throughout the day</legend>
				<label for="morning-wellness">How did you feel this morning?</label>
				<select id="morning-wellness" name="fields[morning-wellness]">
					<option value="Terrific">
						<xsl:if test="update-activity/entry/morning-wellness/item/@handle = 'terrific' or events/activity/post-values/morning-wellness = 'Terrific'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrific
					</option>
					<option value="Good">
						<xsl:if test="update-activity/entry/morning-wellness/item/@handle = 'good' or events/activity/post-values/morning-wellness = 'Good'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Good
					</option>
					<option value="Medium">
						<xsl:if test="update-activity/entry/morning-wellness/item/@handle = 'medium' events/activity/post-values/morning-wellness = 'Medium'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Medium
					</option>
					<option value="Poor">
						<xsl:if test="update-activity/entry/morning-wellness/item/@handle = 'poor' events/activity/post-values/morning-wellness = 'Poor'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Poor
					</option>
					<option value="Terrible">
						<xsl:if test="update-activity/entry/morning-wellness/item/@handle = 'terrible' events/activity/post-values/morning-wellness = 'Terrible'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrible
					</option>
				</select>
				<label for="morning-wakefulness">How awake did you feel this morning?</label>
				<select id="morning-wakefulness" name="fields[morning-wakefulness]">
					<option value="Wide awake">
						<xsl:if test="update-activity/entry/morning-wakefulness/item/@handle = 'wide-awake' or events/activity/post-values/morning-wakefulness = 'Wide awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Wide awake
					</option>
					<option value="Fairly alert">
						<xsl:if test="update-activity/entry/morning-wakefulness/item/@handle = 'fairly-alert' or events/activity/post-values/morning-wakefulness = 'Fairly alert'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Fairly alert
					</option>
					<option value="Somewhat tired">
						<xsl:if test="update-activity/entry/morning-wakefulness/item/@handle = 'somewhat-tired' or events/activity/post-values/morning-wakefulness = 'Somewhat tired'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Somewhat tired
					</option>
					<option value="Struggle to stay awake">
						<xsl:if test="update-activity/entry/morning-wakefulness/item/@handle = 'struggle-to-stay-awake' or events/activity/post-values/morning-wakefulness = 'Struggle to stay awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Struggling to stay awake
					</option>
				</select>
				<label for="afternoon-wellness">How did you feel this afternoon?</label>
				<select id="afternoon-wellness" name="fields[afternoon-wellness]">
					<option value="Terrific">
						<xsl:if test="update-activity/entry/afternoon-wellness/item/@handle = 'terrific' or events/activity/post-values/afternoon-wellness = 'Terrific'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrific
					</option>
					<option value="Good">
						<xsl:if test="update-activity/entry/afternoon-wellness/item/@handle = 'good'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Good
					</option>
					<option value="Medium">
						<xsl:if test="update-activity/entry/afternoon-wellness/item/@handle = 'medium'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Medium
					</option>
					<option value="Poor">
						<xsl:if test="update-activity/entry/afternoon-wellness/item/@handle = 'poor'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Poor
					</option>
					<option value="Terrible">
						<xsl:if test="update-activity/entry/afternoon-wellness/item/@handle = 'terrible'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrible
					</option>
				</select>
				<label for="afternoon-wakefulness">How awake did you feel this afternoon?</label>
				<select id="afternoon-wakefulness" name="afternoon[morning-wakefulness]">
					<option value="Wide awake">
						<xsl:if test="update-activity/entry/afternoon-wakefulness/item/@handle = 'wide-awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Wide awake
					</option>
					<option value="Fairly alert">
						<xsl:if test="update-activity/entry/afternoon-wakefulness/item/@handle = 'fairly-alert'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Fairly alert
					</option>
					<option value="Somewhat tired">
						<xsl:if test="update-activity/entry/afternoon-wakefulness/item/@handle = 'somewhat-tired'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Somewhat tired
					</option>
					<option value="Struggle to stay awake">
						<xsl:if test="update-activity/entry/afternoon-wakefulness/item/@handle = 'struggle-to-stay-awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Struggling to stay awake
					</option>
				</select>
				<label for="evening-wellness">How did you fell this evening?</label>
				<select id="evening-wellness" name="fields[evening-wellness]">
					<option value="Terrific">
						<xsl:if test="update-activity/entry/evening-wellness/item/@handle = 'terrific'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrific
					</option>
					<option value="Good">
						<xsl:if test="update-activity/entry/evening-wellness/item/@handle = 'good'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Good
					</option>
					<option value="Medium">
						<xsl:if test="update-activity/entry/evening-wellness/item/@handle = 'medium'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Medium
					</option>
					<option value="Poor">
						<xsl:if test="update-activity/entry/evening-wellness/item/@handle = 'poor'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Poor
					</option>
					<option value="Terrible">
						<xsl:if test="update-activity/entry/evening-wellness/item/@handle = 'terrible'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Terrible
					</option>
				</select>
				<label for="evening-wakefulness">How awake did you feel this evening?</label>
				<select id="evening-wakefulness" name="fields[evening-wakefulness]">
					<option value="Wide awake">
						<xsl:if test="update-activity/entry/evening-wakefulness/item/@handle = 'wide-awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Wide awake
					</option>
					<option value="Fairly alert">
						<xsl:if test="update-activity/entry/evening-wakefulness/item/@handle = 'fairly-alert'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Fairly alert
					</option>
					<option value="Somewhat tired">
						<xsl:if test="update-activity/entry/evening-wakefulness/item/@handle = 'somewhat-tired'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Somewhat tired
					</option>
					<option value="Struggle to stay awake">
						<xsl:if test="update-activity/entry/evening-wakefulness/item/@handle = 'struggle-to-stay-awake'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						Struggling to stay awake
					</option>
				</select>
				<nav>
					<a href="#start" class="step1 Start">Start</a>
					<a href="#work" class="step2">Work Times</a>
					<a href="#annotations" class="step4">Comments</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<label for="tags">Tags</label>
				<input id="tags" name="fields[tags]" type="text" placeholder="Key activities (separate with commas).">
					<xsl:if test="update-activity/entry/tags">
						<xsl:attribute name="value">
							<xsl:value-of select="$ds-update-activity.tags"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label for="description">Description</label>
				<textarea id="description" name="fields[description]" placeholder="(Optional) What did you do today?">
					<xsl:value-of select="update-activity/entry/description"/>
				</textarea>
			</fieldset>

			<input type="hidden" name="fields[author][]" value="{//auth-token/entry/user/item/@username}"/>
			<input name="canofspam" value="{$canofspam}" type="hidden" />

			<input name="id" type="hidden" value="{$id}"/>
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=day-updated</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
			<input name="action[activity]" type="submit" value="Submit" />
			
			<nav>
					<a href="#start" class="step1 Start">Start</a>
					<a href="#work" class="step2">Work Times</a>
					<a href="#feeling" class="step3">How were you feeling?</a>
			</nav>
		</form>
	</section>	
</xsl:template>
</xsl:stylesheet>