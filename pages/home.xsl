<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/master.xsl"/>

<xsl:variable name="ds-now-activity.evening-wellness"/>
<xsl:variable name="ds-yesterday-activity.evening-wellness"/>
<xsl:variable name="url-source"/>

<!--
	Home page. If not logged in, ask for creditials (or allow adding/updating entries if using auth-token (this is since mobile safari does not hold onto authentication cookies across sessions)).
	
	In the future, this will also allow doctor log-ins, and provide information based on doctor credentials.
	
	Once logged in, offer up overview of a user's data.
-->
<xsl:template match="/data">
	<xsl:if test="$url-source">
		<div id="alert" class="success">
			<p>
				<xsl:choose>
					<xsl:when test="$url-source = 'ailment-created'">
						<xsl:text>Ailment recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'diary-created' or $url-source = 'diary-updated'">
						<xsl:text>Diary entry recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'day-created' or $url-source = 'wellness-updated'">
						<xsl:text>Wellness entry recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'doctor-created'">
						<xsl:text>New doctor recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'food-created'">
						<xsl:text>Yum.</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'dose-created'">
						<xsl:text>Dose recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'medicine-created'">
						<xsl:text>New medicine recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'prescription-created'">
						<xsl:text>New prescription recorded</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'sleep-created'">
						<xsl:text>Sleep well!</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'visit-created'">
						<xsl:text>New appointment saved</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'period-recorded'">
						<xsl:text>Period recorded.</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'ailment-updated'">
						<xsl:text>Ailment updated</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'day-updated'">
						<xsl:text>Wellness entry updated</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'visit-start-updated'">
						<xsl:text>What’s up doc?</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'visit-end-updated'">
						<xsl:text>Appointment completed</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'sleep-updated'">
						<xsl:text>Sleep diary updated</xsl:text>
					</xsl:when>
					<xsl:when test="$url-source = 'period-updated'">
						<xsl:text>Entry Recorded</xsl:text>
					</xsl:when>

				</xsl:choose>
			</p>
		</div>
	</xsl:if>
	<section role="main">
		<nav id="entries">
			<ul id="now">
			<!-- ICE -->
				<xsl:if test="//show-ice = 'Yes'">
					<li>
						<a href="{$root}/view/emergency" class="critical">In Case of Emergency</a>
					</li>
				</xsl:if>
			<!-- Upcoming appointments -->
				<xsl:choose>
					<xsl:when test="//now-appointments/pagination/@total-entires &gt; 1">
						<li>
							<a class="need-attention">
								<xsl:attribute name="href">
									<xsl:value-of select="$root"/>
									<xsl:text>/view/visits/upcoming</xsl:text>
									<xsl:if test="$url-auth-token">
										<xsl:text>?auth-token=</xsl:text>
										<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="//now-appointments/pagination/@total-entries"/>
								<xsl:text> appointments this week</xsl:text>
							</a>
						</li>
					</xsl:when>
					<xsl:when test="//now-appointments/pagination/@total-entires = 1">
						<li>
							<a class="need-attention">
								<xsl:attribute name="href">
									<xsl:value-of select="$root"/>
									<xsl:text>/view/visits/</xsl:text>
									<xsl:value-of select="now-appointments/entry/@id"/>
									<xsl:if test="$url-auth-token">
										<xsl:text>?auth-token=</xsl:text>
										<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
								</xsl:attribute>
								<xsl:text>Appt: </xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" value="//now-appointments/entry/time"/>
									<xsl:with-param name="format" value="'w. m x, t'"/>
								</xsl:call-template>
							</a>
						</li>
					</xsl:when>
				</xsl:choose>
			<!-- Expiring Prescriptions -->
				<xsl:choose>
					<xsl:when test="//now-expiring-prescriptions/pagination/@total-entries &gt; 1">
						<li>
							<a class="critical">
								<xsl:attribute name="href">
									<xsl:value-of select="$root"/>
									<xsl:text>/view/prescriptions/expiring</xsl:text>
									<xsl:if test="$url-auth-token">
										<xsl:text>?auth-token=</xsl:text>
										<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
								</xsl:attribute>
								<xsl:value-of select="//now-expiring-prescriptions/pagination/@total-entries"/>
								<xsl:text> expiring prescriptions</xsl:text>
							</a>
						</li>
					</xsl:when>
					<xsl:when test="//now-expiring-prescriptions/pagination/@total-entries = 1">
						<li>
							<a class="critical">
								<xsl:attribute name="href">
									<xsl:value-of select="$root"/>
									<xsl:text>/view/prescriptions/</xsl:text>
									<xsl:value-of select="//now-expiring-prescriptions/entry/@id"/>
									<xsl:if test="$url-auth-token">
										<xsl:text>?auth-token=</xsl:text>
										<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
								</xsl:attribute>
								<xsl:text>1 expiring prescription</xsl:text>
							</a>
						</li>
					</xsl:when>
				</xsl:choose>

			<!-- Open Ailments -->
				<xsl:choose>
				<!-- More than one entry -->
					<xsl:when test="//now-open-ailments/pagination/@total-entries &gt; 1">
						<li><a class="need-attention">
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:text>/update/ailment</xsl:text>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="//now-open-ailments/pagination/@total-entries"/>
							<xsl:text> Open Ailments</xsl:text>
						</a></li>
					</xsl:when>
				<!-- Only one entry -->
					<xsl:when test="//now-open-ailments/pagination/@total-entries = 1">
						<li><a class="need-attention">
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:text>/update/ailment-ttr/</xsl:text>
								<xsl:value-of select="//now-open-ailments/entry/@id"/>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:text>1 Open Ailment</xsl:text>
						</a></li>
					</xsl:when>
				</xsl:choose>
				<xsl:if test="//now-wake-time/entry">
					<li>
			   			<a class="need-attention">
			   				<xsl:attribute name="href">
			   					<xsl:value-of select="$root"/>
			   					<xsl:text>/update/wake/</xsl:text>
			   					<xsl:value-of select="now-wake-time/entry/@id"/>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
			   				</xsl:attribute>
			   			<xsl:text>Wake Time</xsl:text></a>
			   		</li>
				</xsl:if>
			<!-- Activity diary -->
			    <li>
			    	<xsl:choose>
			    	<!-- Finish yesterday's entry -->
			    		<xsl:when test="$ds-yesterday-activity.evening-wellness = '' and number(translate(substring($current-time,0,6),':','')) &lt; 0300">
			    			<a class="need-attention">
			    				<xsl:attribute name="href">
								    <xsl:value-of select="$root"/>
								    <xsl:text>/update/day/evening/</xsl:text>
					 				<xsl:value-of select="date:add($today,'-P1D')"/>
								    <xsl:if test="$url-auth-token">
								    	<xsl:text>?auth-token=</xsl:text>
								    	<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
			    				</xsl:attribute>
			    				<xsl:text>Update Evening Wellness</xsl:text>
			    			</a>
			    		</xsl:when>
			    	<!-- Latest entry is today -->
			    		<xsl:when test="//now-activity/entry and number(translate(substring($current-time,0,6),':','')) &gt; 0300">
			    		<!-- Daily wellness updates -->
			    			<xsl:choose>
			    			<!-- Morning -->
			    				<xsl:when test="$ds-now-activity.morning-wellness = ''">
			    					<a class="need-attention">
			    						<xsl:attribute name="href">
			    							<xsl:value-of select="$root"/>
			    							<xsl:text>/update/day/morning/</xsl:text>
											<xsl:if test="$url-auth-token">
												<xsl:text>?auth-token=</xsl:text>
												<xsl:value-of select="$url-auth-token"/>
											</xsl:if>
			    						</xsl:attribute>
			    						<xsl:text>Update Morning Wellness</xsl:text>
			    					</a>
			    				</xsl:when>
			    			<!-- Afternoon -->
			    				<xsl:when test="$ds-now-activity.afternoon-wellness = '' and $ds-now-activity.morning-wellness != ''">
			    					<a class="need-attention">
			    						<xsl:attribute name="href">
			    							<xsl:value-of select="$root"/>
			    							<xsl:text>/update/day/afternoon/</xsl:text>
											<xsl:if test="$url-auth-token">
												<xsl:text>?auth-token=</xsl:text>
												<xsl:value-of select="$url-auth-token"/>
											</xsl:if>
			    						</xsl:attribute>
			    						<xsl:text>Update Afternoon Wellness</xsl:text>
			    					</a>
			    				</xsl:when>
			    			<!-- Evening -->
			    				<xsl:when test="$ds-now-activity.evening-wellness = '' and $ds-now-activity.morning-wellness != '' and $ds-now-activity.afternoon-wellness != ''">
			    					<a class="need-attention">
			    						<xsl:attribute name="href">
			    							<xsl:value-of select="$root"/>
			    							<xsl:text>/update/day/evening/</xsl:text>
											<xsl:if test="$url-auth-token">
												<xsl:text>?auth-token=</xsl:text>
												<xsl:value-of select="$url-auth-token"/>
											</xsl:if>
			    						</xsl:attribute>
			    						<xsl:text>Update Evening Wellness</xsl:text>
			    					</a>
			    				</xsl:when>
			    			<!-- Sleep -->
			    				<xsl:when test="$ds-now-activity.evening-wellness != '' and not(//now-wake-time/entry)">
									<a class="need-attention">
										<xsl:attribute name="href">
											<xsl:value-of select="$root"/>
											<xsl:text>/create/sleep/</xsl:text>
											<xsl:if test="$url-auth-token">
												<xsl:text>?auth-token=</xsl:text>
												<xsl:value-of select="$url-auth-token"/>
											</xsl:if>
										</xsl:attribute>
										<xsl:choose>
											<xsl:when test="number(translate(substring($current-time,0,6),':','')) &gt; 1100 and number(translate(substring($current-time,0,6),':','')) &lt; 1900">
												<xsl:text>Nap Time?</xsl:text>
											</xsl:when>
											<xsl:otherwise>
												<xsl:text>New Sleep Diary Entry</xsl:text>
											</xsl:otherwise>
										</xsl:choose>
									</a>
			    				</xsl:when>
			    			</xsl:choose>
			    		</xsl:when>
			    	<!-- New Entry -->
			    		<xsl:otherwise>
			    			<a href="{$root}/create/day" class="need-attention">
			    				<xsl:attribute name="href">
			    					<xsl:value-of select="$root"/>
			    					<xsl:text>/create/day/</xsl:text>
									<xsl:if test="$url-auth-token">
										<xsl:text>?auth-token=</xsl:text>
										<xsl:value-of select="$url-auth-token"/>
									</xsl:if>
			    				</xsl:attribute>
			    				<xsl:text>New Wellness Entry</xsl:text>
			    			</a>
			    		</xsl:otherwise>
			    	</xsl:choose>
				</li>
			</ul>
			<ul id="daily">
			<!-- Ailment diary -->
				<li><a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/create/ailment/</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:text>New Ailment Diary Entry</xsl:text>
				</a></li>
			<!-- Food diary -->
				<li><a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/create/food/</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:text>New Food Diary Entry</xsl:text>
				</a></li>
			<!-- Medication diary -->
				<li><a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/create/medication/</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:text>New Dose Entry</xsl:text>
				</a></li>
			<!-- Sleep Diary -->
				<xsl:if test="$ds-now-activity.evening-wellness = '' and not(//now-wake-time/entry)">
					<li>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:text>/create/sleep/</xsl:text>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:choose>
	    						<xsl:when test="number(translate(substring($current-time,0,6),':','')) &gt; 1100 and number(translate(substring($current-time,0,6),':','')) &lt; 1900">
	    							<xsl:text>Nap time?</xsl:text>
	    						</xsl:when>
	    						<xsl:otherwise>
	    							<xsl:text>New Sleep Diary Entry</xsl:text>
	    						</xsl:otherwise>
	    					</xsl:choose>
						</a>
					</li>
				</xsl:if>
			<!-- Period Diary -->
				<xsl:if test="//current-user/entry/period-diary = 'Yes'">
					<li>
						<a>
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:choose>
									<xsl:when test="home-open-period/entry">
										<xsl:text>/update/period/</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>/create/period/</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:if test="home-open-period/entry">
								<xsl:attribute name="class">
									<xsl:text>need-attention</xsl:text>
								</xsl:attribute>
							</xsl:if>
    						<xsl:choose>
    							<xsl:when test="home-open-period/entry">
    								<xsl:text>Close Period Entry</xsl:text>
    							</xsl:when>
    							<xsl:otherwise>
    								<xsl:text>New Period Entry</xsl:text>
    							</xsl:otherwise>
							</xsl:choose>
						</a>
					</li>
				</xsl:if>
			</ul>
			<ul id="overview">
			<!-- Current Prescriptions -->
				<xsl:if test="//home-current-prescriptions/entry">
					<li><a>
					<xsl:attribute name="href">
						<xsl:value-of select="$root"/>
						<xsl:text>/view/prescriptions/</xsl:text>
						<xsl:if test="$url-auth-token">
							<xsl:text>?auth-token=</xsl:text>
							<xsl:value-of select="$url-auth-token"/>
						</xsl:if>
					</xsl:attribute>
					<xsl:text>Current Prescriptions</xsl:text>
					</a></li>
				</xsl:if>
			<!-- Scheduled Appointments-->
				<xsl:if test="//home-scheduled-appointments/entry">
					<li>
						<a href="{$root}/view/visits">
							<xsl:attribute name="href">
								<xsl:value-of select="$root"/>
								<xsl:text>/create/medication/</xsl:text>
								<xsl:if test="$url-auth-token">
									<xsl:text>?auth-token=</xsl:text>
									<xsl:value-of select="$url-auth-token"/>
								</xsl:if>
							</xsl:attribute>
							<xsl:text>Scheduled Appointments</xsl:text>
						</a>
					</li>
				</xsl:if>
			<!-- Recent Ailments -->
				<li>
					<a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/view/ailments/</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
						<xsl:text>Recent Ailments</xsl:text>
					</a>
				</li>
			<!-- Doctors -->
				<li>
					<a href="{$root}/view/doctors">
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>//</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
						<xsl:text>Your Doctors</xsl:text>
					</a>
				</li>
			</ul>
			<ul id="rare">
			<!-- Prescription -->
				<li><a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/create/prescription/</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
					<xsl:text>New Prescription</xsl:text>
				</a></li>
			<!-- Doctor Visit -->
				<li><a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/create/visit/</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
					<xsl:text>New Appointment</xsl:text>
				</a></li>
			<!-- New Doctor -->
				<li><a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/create/doctor/</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
					<xsl:text>New Doctor</xsl:text>
				</a></li>
			<!-- New Medicine -->
				<li><a>
						<xsl:attribute name="href">
							<xsl:value-of select="$root"/>
							<xsl:text>/create/medicine/</xsl:text>
							<xsl:if test="$url-auth-token">
								<xsl:text>?auth-token=</xsl:text>
								<xsl:value-of select="$url-auth-token"/>
							</xsl:if>
						</xsl:attribute>
					<xsl:text>New Medicine</xsl:text>
				</a></li>
			</ul>
		</nav>
		<div id="dashboard">
			<xsl:choose>
				<xsl:when test="//auth-token/entry and not($cookie-username)">
					<p>You will need to log in to view your dashboard</p>
			    	<div>
			    		<form action="{$root}/symphony/login/" method="post" class="frame">
			    			<fieldset>
			    				<legend>Log in</legend>
			    				<label for="username">Username</label>
			    				<input id="username" name="username" type="text" autofocus="autofocus"/>
			    				<label for="password">Password</label>
			    				<input id="password" name="password" type="password"/>
			    			</fieldset>
			    			<input name="redirect" type="hidden" value="{$current-url}"/>
			    			<div class="actions">
			    				<button name="action[login]" type="submit" accesskey="s">Login</button>
			    				<a href="{$root}/symphony/login/retrieve-password/" class="action-link">Retrieve password?</a>
			    			</div>
			    		</form>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="history" class="history week">
						<script>
							$(document).ready(function(){
								if (Modernizr.mq("only screen and (min-width: 768px)")) {
									week('#home_page .history.week',rooturl + "api/this-week",960,400,50);
								}
							});
						</script>
					</div>
					<div id="current">
						<h1>Now</h1>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</section>
</xsl:template>
</xsl:stylesheet>