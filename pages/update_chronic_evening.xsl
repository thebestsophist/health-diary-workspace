<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!-- 
	Update the chronic diary entry for the evening.
	
	Pushes to updating the chronic diary for the evening if user preference is set
	
	If updating yesterday evening (a little after midnight) will push to yesterdayÕs chronic diary as well
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/activity)">
			<xsl:attribute name="class">
				<xsl:text>update</xsl:text>
			</xsl:attribute>
		</xsl:if>
		
		<form id="chronic" method="post" action="" enctype="multipart/form-data">
			<fieldset id="start">
				<xsl:choose>
					<xsl:when test="update-today-chronic-diary/entry">
						<input name="fields[date][start][]" value="{update-today-chronic-diary/entry/date/date/start}" type="hidden"/>
					</xsl:when>
					<xsl:otherwise>
						<label for="date">What day is this for?</label>
						<input id="date" name="fields[date][start][]" type="date">
							<xsl:attribute name="value">
								<xsl:choose>
									<xsl:when test="events/chronic/post-values/date/start">
										<xsl:value-of select="events/chronic/post-values/date/start"/>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$today"/>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:attribute>
						</input>
					</xsl:otherwise>
				</xsl:choose>
				<p>Rate how you feel on a scale from 1 to 10. Lower is worse, higher is better.</p>
				<xsl:if test="//item/@handle = 'concentration'">
					<label for="concentration">How is your concentration?</label>
					<input id="concentration" name="fields[evening-concentration]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-concentration">
									<xsl:value-of select="events/chronic/post-value/evening-concentration"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'strength'">
					<label for="strength">How is your strength?</label>
					<input id="strength" name="fields[evening-strength]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-strength">
									<xsl:value-of select="events/chronic/post-value/evening-strength"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'motor-control'">
					<label for="motor-control">Motor Control</label>
					<input id="motor-control" name="fields[evening-motor-control]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-motor-control">
									<xsl:value-of select="events/chronic/post-value/evening-motor-control"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'tremors-and-twitches'">
					<label for="tremors">How are your tremors?</label>
					<input id="tremors" name="fields[evening-tremors-and-twitches]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-tremors-and-twitches">
									<xsl:value-of select="events/chronic/post-value/evening-tremors-and-twitches"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'pain'">
					<label for="pain">What is your pain level?</label>
					<input id="pain" name="fields[evening-pain]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-pain">
									<xsl:value-of select="events/chronic/post-value/evening-pain"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'breath'">
					<label for="breath">How well are you breathing?</label>
					<input id="breath" name="fields[evening-breath]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-breath">
									<xsl:value-of select="events/chronic/post-value/evening-breath"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'temperature'">
					<label for="temperature">Do you feel particularly hot or cold? (Lower is colder.)</label>
					<input id="temperature" name="fields[evening-temperature]" type="range" min="0" max="10" value="5">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-temperature">
									<xsl:value-of select="events/chronic/post-value/evening-temperature"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'aches-and-soreness'">
					<label for="aches">How achey or sore are you?</label>
					<input id="aches" name="fields[evening-aches]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-aches">
									<xsl:value-of select="events/chronic/post-value/evening-aches"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
				<xsl:if test="//item/@handle = 'seasonal-allergies'">
					<label for="aches">How are your allergies?</label>
					<input id="aches" name="fields[evening-allergies]" type="range" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-allergies">
									<xsl:value-of select="events/chronic/post-value/evening-allergies"/>
								</xsl:when>
								<xsl:otherwise>5</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
				</xsl:if>
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
				<xsl:if test="//update-today-chronic-diary/entry">
					<input name="id" type="hidden" value="{//update-today-chronic-diary/entry/@id}"/>
				</xsl:if>
				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:choose>
							<xsl:when test="//update-today-chronic-diary/entry">
								<xsl:text>?source=diary-created</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>?source=diary-updated</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>

				<xsl:choose>
					<xsl:when test="//body-tracker = 'Yes'">
						<nav>
							<a href="#body" class="step2">Body Status</a>
						</nav>
					</xsl:when>
					<xsl:otherwise>
						<input name="action[chronic]" type="submit" value="Save" />
					</xsl:otherwise>
				</xsl:choose>
			</fieldset>
			<xsl:if test="//body-tracker = 'Yes'">
				<fieldset id="body" class="inactive"><p>This will be updated with an svg to help visualize later</p>
					<label for="body-head" class="chronic-body">Neck and Head</label>
					<input id="body-head" type="range" name="fields[evening-head]" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-head">
									<xsl:value-of select="events/chronic/post-values/evening-head"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
					<label for="body-up-right" class="chronic-body">Upper Right Side</label>
					<input id="body-up-right" type="range" name="fields[evening-upper-right]" class="chronic-bodypart" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-upper-right">
									<xsl:value-of select="events/chronic/post-values/evening-upper-right"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
					<label for="body-up-right" class="chronic-body">Upper Left Side</label>
					<input id="body-up-right" type="range" name="fields[evening-upper-left]" class="chronic-bodypart" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-upper-left">
									<xsl:value-of select="events/chronic/post-values/evening-upper-left"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
					
					<label for="body-bottom-right" class="chronic-body">Lower Right Side</label>
					<input id="body-bottom-right" type="range" name="fields[evening-lower-right]" class="chronic-bodypart" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-lower-right">
									<xsl:value-of select="events/chronic/post-values/evening-lower-right"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
					
					<label for="body-bottom-left" class="chronic-body">Lower Left Side</label>
					<input id="body-bottom-left" type="range" name="fields[evening-lower-left]" class="chronic-bodypart" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-lower-left">
									<xsl:value-of select="events/chronic/post-values/evening-lower-left"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>
					
					<label for="body-chest" class="chronic-body">Chest</label>
					<input id="body-chest" type="range" name="fields[evening-chest]" class="chronic-bodypart" min="0" max="10">
						<xsl:attribute name="value">
							<xsl:choose>
								<xsl:when test="events/chronic/post-values/evening-chest">
									<xsl:value-of select="events/chronic/post-values/evening-chest"/>
								</xsl:when>
								<xsl:otherwise>0</xsl:otherwise>
							</xsl:choose>
						</xsl:attribute>
					</input>

					<input name="action[chronic]" type="submit" value="Save" />
					<nav>
						<a href="#start" class="step1 back">Back</a>
					</nav>
				</fieldset>	
			</xsl:if>		
		</form>
	</section>
</xsl:template>
</xsl:stylesheet>