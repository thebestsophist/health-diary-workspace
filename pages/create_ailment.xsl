<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<xsl:import href="../utilities/selection-body.xsl"/>
<!-- 
	Create ailment diary entry
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/ailment)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="ailment" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/ailment/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">	<!-- 1 -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="type">
					<xsl:text>What type of pain?</xsl:text>
				</label>
				<select id="type" name="fields[type]" required="required">
					<option value="Migraine">
						<xsl:if test="events/ailment/post-values/type = 'Migraine'">
														<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Headache/Migraine</xsl:text>
					</option>
					<option value="Neurological">
						<xsl:if test="events/ailment/post-values/type = 'Neurological'">
														<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Neurological</xsl:text>
					</option>
					<option value="Illness">
						<xsl:if test="events/ailment/post-values/type = 'Illness'">
														<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Illness</xsl:text>
					</option>
					<option value="Other">
						<xsl:if test="events/ailment/post-values/type = 'Other'">
														<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Other</xsl:text>
					</option>
				</select>
				<label for="datetime">
					When did this begin?
				</label>
				<input id="datetime" name="fields[time][start][]" type="datetime-local" required="required">
					<xsl:attribute name="value">
						<xsl:choose>
							<xsl:when test="events/ailment/post-values/time/start">
								<xsl:value-of select="events/ailment/post-values/time/start/item"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</input>
				<nav>
					<a href="#migraine" class="step2">What kind of headache?</a>
				</nav>
			</fieldset>
			<fieldset id="migraine">	<!-- 2a -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="headache-type">What kind of headache do you have?</label>
				<select id="headache-type" name="fields[headache-type]">
					<option></option>
					<option value="Cluster Headache">
						<xsl:if test="events/ailment/post-values/headache-type = 'Cluster Headache'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Cluster Headache</xsl:text>
					</option>
					<option value="Migraine Headache">
						<xsl:if test="events/ailment/post-values/headache-type = 'Migraine Headache'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Migraine Headache</xsl:text>
					</option>
					<option value="Sinus Headache">
						<xsl:if test="events/ailment/post-values/headache-type = 'Sinus Headache'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Sinus Headache</xsl:text>
					</option>
					<option value="Tension Headache">
						<xsl:if test="events/ailment/post-values/headache-type = 'Tension Headache'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Tension Headache</xsl:text>
					</option>
				</select>
				<label for="body-parts">Choose the areas affected</label>
				<xsl:call-template name="selectionhead"/>
				
				<nav>
					<a href="#neuro" class="step2b optional">Neurological impact</a>
					<a href="#other" class="step2c optional">Affected body parts</a>
					<a href="#iandi" class="step3">Skip to Impact and Intensity</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="neuro">	<!-- 2b -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="neurology">What symptoms do you have?</label>
				<select id="neurology" name="fields[neuro]" multiple="multiple">
					<option value="Dizziness">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Dizziness'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Dizziness</xsl:text>
					</option>
					<option value="Nausea">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Nausea'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Nausea</xsl:text>
					</option>
					<option value="Numbness">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Numbness'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Numbness</xsl:text>
					</option>
					<option value="Tingle">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Tingle'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Tingle</xsl:text>
					</option>
					<option value="Tremor">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Tremor'">							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Tremor</xsl:text>
					</option>
					<option value="Twitch">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Twitch'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Twitch</xsl:text>
					</option>
					<option value="Other">
						<xsl:if test="events/ailment/post-values/neuro/item = 'Other'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute></xsl:if>
						<xsl:text>Other</xsl:text>
					</option>
				</select>
				<xsl:call-template name="selectionneuro"/>
				<nav>
					<a href="#other" class="step2c optional">Affected body parts</a>
					<a href="#iandi" class="step3">Impact and Intensity</a>
					<a href="#migraine" class="step1b back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="illness"> <!-- 2c -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="ill">What illness do you have?</label>
				<input id="ill" name="fields[illness]" type="text" placeholder="Separate symptoms by comma.">
					<xsl:if test="events/ailment/post-values">
						<xsl:value-of select="events/ailment/post-values/illness"/>
					</xsl:if>
				</input>
				
				<nav>
					<a href="other" class="step2d optional">Any aches or pains?</a>
					<a href="#iandi" class="step3">Impact and Intensity</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="other">	<!-- 2d -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="body-parts">Choose all the areas affected</label>
				<xsl:call-template name="selectionbody" />
				<select id="body-parts" name="fields[body-parts][]" multiple="multiple">
					<xsl:for-each select="body-parts/entry">
						<option value="{@id}">
							<xsl:if test="events/ailment/post-values/body-parts/item = '@id'">
								<xsl:attribute name="selected">
									<xsl:text>selected</xsl:text>
								</xsl:attribute>
							</xsl:if>
							<xsl:value-of select="part"/>
						</option>
					</xsl:for-each>
				</select>
				<label for="ailmenttype">What symptoms do you have?</label>
				<input name="fields[ailment]" type="text" placeholder="Separate symptoms by comma"/>
				<nav>
					<a href="#neuro" class="step2b optional">Neurological Impact</a>
					<a href="#iandi" class="step3">Impact and Intensity</a>
					<a href="#migraine" class="step1c back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="iandi">	<!-- 3 -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="impact">Impact</label>
				<select id="impact" name="fields[impact]" required="required">
					<option value="None">
						<xsl:if test="events/aiment/post-values/impact = 'None'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>None</xsl:text>
					</option>
					<option value="Mild">
						<xsl:if test="events/aiment/post-values/impact = 'Mild'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Mild</xsl:text>
					</option>
					<option value="Severe">
						<xsl:if test="events/aiment/post-values/impact = 'Severe'">
							<xsl:attribute name="selected">
								<xsl:text>Selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Severe</xsl:text>
					</option>
					<option value="Totally disabled">
						<xsl:if test="events/aiment/post-values/impact = 'Totally disabled'">
							<xsl:attribute name="selected">
								<xsl:text>Selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Totally disabled</xsl:text>
					</option>
				</select>
				<label for="intensity">Intensity</label>
				<select id="intensity" name="fields[intensity]" required="required">
					<option value="Mild">
						<xsl:if test="events/ailment/post-values/intensity = 'Mild'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Mild</xsl:text>
					</option>
					<option value="Moderate">
						<xsl:if test="events/ailment/post-values/intensity = 'Moderate'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Moderate</xsl:text>
					</option>
					<option value="Severe">
						<xsl:if test="events/ailment/post-values/intensity = 'Severe'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Severe</xsl:text>
					</option>
					<option value="Very severe">
						<xsl:if test="events/ailment/post-values/intensity = 'Very Severe'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Very severe</xsl:text>
					</option>
				</select>

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
			<!-- Really big end date that will never come up in this lifetime to track open entries -->
				<input type="hidden" name="fields[time][end][]" value="9876-05-04T03:21"/>
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=ailment-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="action[ailment]" type="submit" value="Save" />

				<nav>
					<a href="#annotations" class="step4 optional">Triggers &amp; Descriptions</a>
					<a href="#migraine" class="step2 back">Back</a>
					<a href="#start" class="step1 start">Back to Start</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">	<!-- 4 -->
				<xsl:if test="not(events/ailment)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="trigger">Triggers</label>
				<textarea id="trigger" name="fields[triggers]" placeholder="Do you know what set off this episode?"></textarea>
				<label for="comment">Comments</label>
				<textarea id="comment" name="fields[comments]" placeholder="Be as descriptive as you would like."></textarea>
				<input name="action[ailment]" type="submit" value="Save" />
				<nav>
					<a href="#iandi" class="step3 back">Back</a>
					<a href="#start" class="step1 start">Back to Start</a>
				</nav>
			</fieldset>
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>