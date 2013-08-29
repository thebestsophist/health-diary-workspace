<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="ds-update-today-activity.system-id"/>
<xsl:variable name="ds-update-today-activity.tags"/>
<!-- 
	Update the activity diary entry for the evening.
	
	Pushes to updating the chronic diary for the evening if user preference is set
	
	If updating yesterday evening (a little after midnight) will push to yesterday's chronic diary as well
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
				<xsl:with-param name="date" select="update-today-activity/entry/day/date/start"/>
				<xsl:with-param name="format" select="'M d, Y'"/>
			</xsl:call-template>
		</h1>
		<form id="activity" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/activity/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start" class="active">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
					<label for="morning-wakefulness">How awake are you feeling this evening?</label>
					<select id="morning-wakefulness" name="fields[evening-wakefulness]">
						<option value="Wide awake">
							<xsl:if test="events/activity/post-values/evening-wakefulness = 'Wide awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Wide awake</xsl:text>
						</option>
						<option value="Fairly alert">
							<xsl:if test="events/activity/post-values/evening-wakefulness = 'Fairly alert'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Fairly alert</xsl:text>
						</option>
						<option value="Somewhat tired">
							<xsl:if test="events/activity/post-values/evening-wakefulness = 'Somewhat tired'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Somewhat tired</xsl:text>
						</option>
						<option value="Struggle to stay awake">
							<xsl:if test="events/activity/post-values/evening-wakefulness = 'Struggle to stay awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Struggling to stay awake</xsl:text>
						</option>
					</select>
					<label for="morning-mental">How is your mood/mental state?</label>
					<select id="morning-mental" name="fields[evening-mental-state]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/evening-mental-state = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/evening-mental-state = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/evening-mental-state = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/evening-mental-state = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/evening-mental-state = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>

					<label for="morning-body">…and your body?</label>
					<select id="morning-body" name="fields[evening-body-state]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/evening-body-state = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/evening-body-state = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/evening-body-state = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/evening-body-state = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/evening-body-state = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>
					<label for="morning-stress">How about stress? (Positive and negative)</label>
					<select id="morning-stress" name="fields[evening-stress]">
						<option value="Very Low">
							<xsl:if test="events/activity/post-values/evening-stress = 'Very Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very Low</xsl:text>
						</option>
						<option value="Low">
							<xsl:if test="events/activity/post-values/evening-stress = 'Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Low</xsl:text>
						</option>
						<option value="Moderate">
							<xsl:if test="events/activity/post-values/evening-stress = 'Moderate'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Moderate</xsl:text>
						</option>
						<option value="High">
							<xsl:if test="events/activity/post-values/evening-stress = 'High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>High</xsl:text>
							</option>
						<option value="Very High">
							<xsl:if test="events/activity/post-values/evening-stress = 'Very High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very High</xsl:text>
						</option>
					</select>


					<label for="morning-wellness">How are you feeling overall?</label>
					<select id="morning-wellness" name="fields[evening-wellness]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/evening-wellness = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/evening-wellness = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/evening-wellness = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/evening-wellness = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/evening-wellness = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
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

				<input name="id" type="hidden" value="{$ds-update-today-activity.system-id}"/>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:if test="//chronic-diary = 'Yes'">
							<xsl:text>/update/chronic/evening/</xsl:text>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="$date">
								<xsl:value-of select="$date"/>
								<xsl:text>&amp;source=day-updated</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>?source=day-updated</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[activity]" type="submit" value="Save" />
				<nav>
					<a href="#annotations" class="step2 optional">Comments</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="tags">Tags</label>
				<input id="tags" name="fields[tags]" type="text" placeholder="Key activities (separate with commas).">
					<xsl:if test="update-today-activity/entry/tags">
						<xsl:attribute name="value">
							<xsl:value-of select="$ds-update-today-activity.tags"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label for="description">Description</label>
				<textarea id="description" name="fields[description]" placeholder="(Optional) What did you do today?">
					<xsl:value-of select="update-today-activity/entry/description"/>
				</textarea>
				<input name="action[activity]" type="submit" value="Save" />
			</fieldset>
		</form>
	</section>	
</xsl:template>
</xsl:stylesheet>
