<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>
<!--
	Add a food diary entry
-->
<xsl:template match="/data">
	<section role="main">
		<xsl:if test="not(events/food)">
			<xsl:attribute name="class">
				<xsl:text>new</xsl:text>
			</xsl:attribute>
		</xsl:if>
		<form id="food" method="post" action="" enctype="multipart/form-data">
			<xsl:if test="events/food/post-values">
				<xsl:attribute name="class">
					<xsl:text>corrections</xsl:text>
				</xsl:attribute>
			</xsl:if>
			<fieldset id="start">
				<xsl:if test="not(events/food)">
					<xsl:attribute name="class">
						<xsl:text>active</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="start-time">Start time</label>
				<input id="start-time" name="fields[time][start][]" type="datetime-local" required="required">
					<xsl:choose>
						<xsl:when test="events/food/post-values/time/start">
							<xsl:value-of select="events/food/post-values/time/start"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:attribute name="value">
								<xsl:value-of select="$today"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="$current-time"/>
							</xsl:attribute>
						</xsl:otherwise>
					</xsl:choose>
				</input>
				
				<label for="people">Who ate this meal?</label>
    			<select name="fields[eaters][]" multiple="multiple" required="required">
    				<xsl:for-each select="users/author">
    					<option value="{@id}">
    						<xsl:choose>
		    					<xsl:when test="events/food/post-values/eaters">
		    						<xsl:if test="events/food/plost-values/eaters = @id">
		    							<xsl:attribute name="selected">
		    								<xsl:text>selected</xsl:text>
		    							</xsl:attribute>
		    						</xsl:if>
		    					</xsl:when>
		    					<xsl:otherwise>
    								<xsl:if test="username = $cookie-username or username = //auth-token/entry/user/item/@username">
    									<xsl:attribute name="selected">
    										<xsl:text>selected</xsl:text>
    									</xsl:attribute>
		    						</xsl:if>
		    					</xsl:otherwise>
    						</xsl:choose>
    						<xsl:value-of select="name"/>
    					</option>
    				</xsl:for-each>
				</select>
				
				<label form="type">Meal Type</label>
				<select id="type" name="fields[type]" required="required">
					<option value="Home-cooked">
						<xsl:if test="events/food/post-values/type = 'Home-cooked'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Home-cooked</xsl:text>
					</option>
					<option value="Prepackaged">
						<xsl:if test="events/food/post-values/type = 'Prepackaged'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Prepackaged</xsl:text>
					</option>
					<option value="Restaurant">
						<xsl:if test="events/food/post-values/type = 'Restaurant'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Restaurant</xsl:text>
					</option>
				</select>
	
				<label for="meal">Meal</label>
				<select id="meal" name="fields[meal]" required="required">
					<option value="Breakfast">
						<xsl:if test="events/food/post-values/meal = 'Breakfast'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Breakfast</xsl:text>
					</option>
					<option value="Lunch">
						<xsl:if test="events/food/post-values/meal = 'Lunch'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Lunch</xsl:text>
					</option>
					<option value="Dinner">
						<xsl:if test="events/food/post-values/meal = 'Dinner'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Dinner</xsl:text>
					</option>
					<option value="Snack">
						<xsl:if test="events/food/post-values/meal = 'Snack'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Snack</xsl:text>
					</option>
					<option value="Beverage">
						<xsl:if test="events/food/post-values/meal = 'Beverage'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Beverage</xsl:text>
					</option>
				</select>
				<label for="salt">Saltiness</label>
				<select id="salt" name="fields[salt]">
					<option value="Bland">
						<xsl:if test="events/food/post-values/salt = 'Bland'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Bland</xsl:text>
					</option>
					<option value="Mild">
						<xsl:if test="events/food/post-values/salt = 'Mild'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Mild</xsl:text>
					</option>
					<option value="Salty">
						<xsl:if test="events/food/post-values/salt = 'Salty'">
							<xsl:attribute name="selected">
								<xsl:text>selected</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<xsl:text>Salty</xsl:text>
					</option>
				</select>
				<nav>
					<a href="#ingredients" class="step2">Ingredients</a>
				</nav>
			</fieldset>
			<fieldset id="ingredients">
				<xsl:if test="not(events/food)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="proteins">Proteins</label>
				<input id="proteins" name="fields[proteins]" type="text" placeholder="Separate with commas.">
					<xsl:attribute name="value">
						<xsl:value-of select="events/food/post-values/proteins"/>
					</xsl:attribute>
				</input>
				<label for="spices">Spices and Flavorings</label>
				<input id="spices" name="fields[spices]" type="text" placeholder="Separate with commas.">
					<xsl:attribute name="value">
						<xsl:value-of select="events/food/post-values/spices"/>
					</xsl:attribute>
				</input>
				<label for="ingredient">Ingredients</label>
				<input id="ingredient" name="fields[ingredients]" type="text" placeholder="Separate with commas.">
					<xsl:attribute name="value">
						<xsl:value-of select="events/food/post-values/ingredients"/>
					</xsl:attribute>
				</input>

				<input name="canofspam" value="{$canofspam}" type="hidden" />
				<input name="redirect" type="hidden">
					<xsl:attribute name="value">
						<xsl:value-of select="$root"/>
						<xsl:text>?source=food-created</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>&amp;auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
				</input>
				<input name="action[food]" type="submit" value="Submit" />
				<nav>
					<a href="#annotations" class="step3 optional">Comment</a>
					<a href="#start" class="step1 back">Back</a>
				</nav>
			</fieldset>
			<fieldset id="annotations">
				<xsl:if test="not(events/food)">
					<xsl:attribute name="class">
						<xsl:text>inactive</xsl:text>
					</xsl:attribute>
				</xsl:if>
				<label for="comment">Comment</label>
				<textarea id="comment" name="fields[comment]" placeholder="Name of the dish or other comment.">
					<xsl:value-of select="events/food/post-values/comment"/>
				</textarea>

				<input name="action[food]" type="submit" value="Submit" />
				<nav>
					<a href="#ingredients" class="step2 back">Back</a>
					<a href="#start" class="step1 start">Back to Start</a>
				</nav>
			</fieldset>
		</form>
	</section>	
</xsl:template>
</xsl:stylesheet>