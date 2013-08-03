<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Creates a new activity diary entry
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/activity)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
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
				<label for="day">Day</label>
				<input id="day" name="fields[day][start][]" type="date" required="required">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/activity/post-values/day/start">
								<xsl:value-of select="events/activity/post-values/day/start"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<label for="type">Is this a work day?</label>
				<select id="type" name="fields[type]" required="required">
					<option value="Work">
						<xsl:if test="events/activity/post-values/type = 'Work'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Work</xsl:text>
					</option>
					<option value="Off">
						<xsl:if test="events/activity/post-values/type = 'Off'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Off</xsl:text>
					</option>
				</select>
				<nav>
					<a href="#work" class="step2">When do you work?</a>
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
					<xsl:if test="events/activities/post-values/work-time/start">
						<xsl:attribute name="value">
							<xsl:value-of select="events/activities/post-values/work-time/start"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label for="work-end">When does work end?</label>
				<input name="fields[work-time][end][]" type="datetime-local">
					<xsl:if test="events/activities/post-values/work-time/end">
						<xsl:attribute name="value">
							<xsl:value-of select="events/activities/post-values/work-time/end"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label for="sick-day">Is this a sick day?</label>
				<select id="sick-day" name="fields[sick-day]">
					<option value="No">
						<xsl:if test="events/activities/post-values/sick-day = 'No'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>No</xsl:text>
					</option>
					<option value="Partial">
						<xsl:if test="events/activities/post-values/sick-day = 'Partial'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Partial</xsl:text>
					</option>
					<option value="Yes">
						<xsl:if test="events/activities/post-values/sick-day = 'Yes'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Yes</xsl:text>
					</option>
				</select>
				<nav>
					<a href="#activities" class="step3">What are you doing?</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="activities">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<legend>Optional comments</legend>
				<label for="tags">Tags</label>
				<input id="tags" name="fields[tags]" type="text" placeholder="Key activities (separate with commas).">
					<xsl:if test="events/activity/post-values/tags">
						<xsl:attribute name="value">
							<xsl:value-of select="events/activity/post-values/tags"/>
						</xsl:attribute>
					</xsl:if>
				</input>
				<label for="description">What are the major non-work activities today?</label>
				<textarea id="description" name="fields[comments]" placeholder="(Optional) What did you do today?">
					<xsl:if test="events/activity/post-values/comments">
						<xsl:value-of select="events/activity/post-values/comments"/>
					</xsl:if>
				</textarea>

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
						<xsl:if test="//chronic-diary = 'Yes' and number(translate(substring($current-time,0,6),':','')) &lt; 1500 and number(translate(substring($current-time,0,6),':','')) &gt; 0800">
							<xsl:text>/update/chronic/morning</xsl:text>
						</xsl:if>
						<xsl:text>?source=day-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[activity]" type="submit" value="Save" />
				<nav>
					<xsl:if test="number(translate(substring($current-time,0,6),':','')) &lt; 1500 and number(translate(substring($current-time,0,6),':','')) &gt; 0800">
						<a href="#morning" class="step4">Morning Wellness</a>
					</xsl:if>
					<a href="#work" class="step2b back">Back</a>
					<a href="#start" class="step1 start">Back to Start</a>
				</nav>
			</fieldset>
			<xsl:if test="number(translate(substring($current-time,0,6),':','')) &lt; 1500 and number(translate(substring($current-time,0,6),':','')) &gt; 0800">
				<fieldset id="morning">
				<xsl:if test="not(events/activity)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
					<label for="morning-wakefulness">How awake are you feeling this morning?</label>
					<select id="morning-wakefulness" name="fields[morning-wakefulness]">
						<option></option>
						<option value="Wide awake">
							<xsl:if test="events/activity/post-values/morning-wakefulness = 'Wide awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Wide awake</xsl:text>
						</option>
						<option value="Fairly alert">
							<xsl:if test="events/activity/post-values/morning-wakefulness = 'Fairly alert'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Fairly alert</xsl:text>
						</option>
						<option value="Somewhat tired">
							<xsl:if test="events/activity/post-values/morning-wakefulness = 'Somewhat tired'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Somewhat tired</xsl:text>
						</option>
						<option value="Struggle to stay awake">
							<xsl:if test="events/activity/post-values/morning-wakefulness = 'Struggle to stay awake'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Struggling to stay awake</xsl:text>
						</option>
					</select>
					<label for="morning-mental">How is your mood/mental state?</label>
					<select id="morning-mental" name="fields[morning-mental-state]">
						<option></option>
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/morning-mental-state = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/morning-mental-state = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/morning-mental-state = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/morning-mental-state = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/morning-mental-state = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>

					<label for="morning-body">…and your body?</label>
					<select id="morning-body" name="fields[morning-body-state]">
						<option></option>
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/morning-body-state = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/morning-body-state = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/morning-body-state = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/morning-body-state = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/morning-body-state = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>
					<label for="morning-stress">How about stress? (Positive and negative)</label>
					<select id="morning-stress" name="fields[morning-stress]">
						<option></option>
						<option value="Very Low">
							<xsl:if test="events/activity/post-values/morning-stress = 'Very Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very Low</xsl:text>
						</option>
						<option value="Low">
							<xsl:if test="events/activity/post-values/morning-stress = 'Low'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Low</xsl:text>
						</option>
						<option value="Moderate">
							<xsl:if test="events/activity/post-values/morning-stress = 'Moderate'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Moderate</xsl:text>
						</option>
						<option value="High">
							<xsl:if test="events/activity/post-values/morning-stress = 'High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>High</xsl:text>
							</option>
						<option value="Very High">
							<xsl:if test="events/activity/post-values/morning-stress = 'Very High'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Very High</xsl:text>
						</option>
					</select>


					<label for="morning-wellness">How are you feeling overall?</label>
					<select id="morning-wellness" name="fields[morning-wellness]">
						<option></option>
						<option value="Terrific">
							<xsl:if test="events/activity/post-values/morning-wellness = 'Terrific'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrific</xsl:text>
						</option>
						<option value="Good">
							<xsl:if test="events/activity/post-values/morning-wellness = 'Good'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Good</xsl:text>
						</option>
						<option value="Medium">
							<xsl:if test="events/activity/post-values/morning-wellness = 'Medium'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Medium</xsl:text>
						</option>
						<option value="Poor">
							<xsl:if test="events/activity/post-values/morning-wellness = 'Poor'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Poor</xsl:text>
						</option>
						<option value="Terrible">
							<xsl:if test="events/activity/post-values/morning-wellness = 'Terrible'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:text>Terrible</xsl:text>
						</option>
					</select>
					<input name="action[activity]" type="submit" value="Save" />
					<nav>
						<a href="#annotations" class="step3 back">Back</a>
						<a href="#start" class="step1 start">Back to Start</a>
					</nav>
				</fieldset>
			</xsl:if>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>