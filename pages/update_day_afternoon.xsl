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
	Update the activity diary entry for the afternoon.
	
	Pushes to updating the chronic diary for the evening if user preference is set
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
			<fieldset id="start">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
					<label for="afternoon-wakefulness">How awake are you feeling this afternoon?</label>
					<select id="afternoon-wakefulness" name="fields[afternoon-wakefulness]">
						<option value="Wide awake">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Wide awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Wide awake</xsl:text>
						</option>
						<option value="Fairly alert">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Fairly alert'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Fairly alert</xsl:text>
						</option>
						<option value="Somewhat tired">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Somewhat tired'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Somewhat tired</xsl:text>
						</option>
						<option value="Struggle to stay awake">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Struggle to stay awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Struggling to stay awake</xsl:text>
						</option>
					</select>
					<label for="afternoon-mental">How is your mood/mental state?</label>
					<select id="afternoon-mental" name="fields[afternoon-mental-state]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/afternoon-wakefulness = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>

					<label for="afternoon-body">…and your body?</label>
					<select id="afternoon-body" name="fields[afternoon-body-state]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/afternoon-body-state = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/afternoon-body-state = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/afternoon-body-state = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/afternoon-body-state = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/afternoon-body-state = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>
					<label for="afternoon-stress">How about stress? (Positive and negative)</label>
					<select id="afternoon-stress" name="fields[afternoon-stress]">
						<option value="Very Low">
							<xsl:if test="events/activity/post-values/afternoon-stress = 'Very Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very Low</xsl:text>
						</option>
						<option value="Low">
							<xsl:if test="events/activity/post-values/afternoon-stress = 'Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Low</xsl:text>
						</option>
						<option value="Moderate">
							<xsl:if test="events/activity/post-values/afternoon-stress = 'Moderate'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Moderate</xsl:text>
						</option>
						<option value="High">
							<xsl:if test="events/activity/post-values/afternoon-stress = 'High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>High</xsl:text>
							</option>
						<option value="Very High">
							<xsl:if test="events/activity/post-values/afternoon-stress = 'Very High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very High</xsl:text>
						</option>					</select>


					<label for="afternoon-wellness">How are you feeling overall?</label>
					<select id="afternoon-wellness" name="fields[afternoon-wellness]">
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/afternoon-wellness = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/afternoon-wellness = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/afternoon-wellness = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/afternoon-wellness = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/afternoon-wellness = 'Terrible'">
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
							<xsl:text>/update/chronic/afternoon</xsl:text>
						</xsl:if>
						<xsl:text>?source=day-updated</xsl:text>
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