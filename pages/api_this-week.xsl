<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:exslt="http://exslt.org/common"
	xmlns:date="http://exslt.org/dates-and-times"
	extension-elementPrefixes="date"
	extension-element-prefixes="exslt"
	exclude-result-prefixes="date exslt">

<xsl:import href="../utilities/api-master.xsl"/>
<!--
	API for the summary for the last week, used in `week`
	URL: {$root}/api/this-week
	Optional URL variables:
		`auth-token`: Secret user token to access their content without logging in
		`format`: outputs in `json` (default), `xml`, and `jsonp`
-->
<xsl:template match="/data">
	<focus>
		<xsl:value-of select="$today"/>
	</focus>
	<summary>
	<!-- 1 -->
 		<day>
    		<xsl:variable name="day1hours">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P6D')">
     					<day><xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/></day>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day1spentawake">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P6D')">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    	 			</xsl:if>
    	 		</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day1wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P6D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day1wakestotal" select="exslt:node-set($day1wakes)"/>
    		<xsl:variable name="day1hourtotal" select="exslt:node-set($day1hours)"/>
			<xsl:variable name="day1spentawaketotal" select="exslt:node-set($day1spentawake)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P6D')"/>
 			</date>
			<hours>
				<xsl:value-of select="format-number(sum(exslt:node-set($day1hourtotal/day)) div 60 div 60,'#.##')"/>
			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day1spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day1wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P6D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
		</day>
 		<!-- 2 -->
 		<day>
    		<xsl:variable name="day2hours">
     			<xsl:for-each select="home-this-week-sleep/entry">
     				<xsl:if test="sleep-time/date/end = date:add($today,'-P5D')">
     					<day><xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/></day>
     				</xsl:if>
     			</xsl:for-each>
     		</xsl:variable>
    		<xsl:variable name="day2spentawake">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P5D')">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    	 			</xsl:if>
    	 		</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day2wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P5D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day2wakestotal" select="exslt:node-set($day2wakes)"/>
    		<xsl:variable name="day2spentawaketotal" select="exslt:node-set($day2spentawake)"/>
			<xsl:variable name="day2hourtotal" select="exslt:node-set($day2hours)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P5D')"/>
 			</date>
			<hours>
				<xsl:value-of select="format-number(sum(exslt:node-set($day2hourtotal/day)) div 60 div 60,'#.##')"/>
			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day2spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day2wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P5D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
		</day>
 		<!-- 3 -->
 		<day>
    		<xsl:variable name="day3hours">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P4D')">
    					<day><xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/></day>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day3spentawake">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P4D')">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    	 			</xsl:if>
    	 		</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day3wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P4D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day3wakestotal" select="exslt:node-set($day3wakes)"/>
    		<xsl:variable name="day3hourtotal" select="exslt:node-set($day3hours)"/>
			<xsl:variable name="day3spentawaketotal" select="exslt:node-set($day3spentawake)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P4D')"/>
 			</date>
			<hours>
  				<xsl:value-of select="format-number(sum(exslt:node-set($day3hourtotal/day)) div 60 div 60,'#.##')"/>
			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day3spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day3wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P4D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
 		</day>
 		<!-- 4 -->
 		<day>
    		<xsl:variable name="day4hours">
    			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P3D')">
    					<day><xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/></day>
    				</xsl:if>
     			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day4spentawake">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P3D')">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    	 			</xsl:if>
    	 		</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day4wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P3D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day4wakestotal" select="exslt:node-set($day4wakes)"/>
    		<xsl:variable name="day4hourtotal" select="exslt:node-set($day4hours)"/>
			<xsl:variable name="day4spentawaketotal" select="exslt:node-set($day4spentawake)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P3D')"/>
 			</date>
			<hours>
  				<xsl:value-of select="format-number(sum(exslt:node-set($day4hourtotal/day)) div 60 div 60,'#.##')"/>
			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day4spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day4wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P3D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
 		</day>
 		<!-- 5 -->
 		<day>
 		    <xsl:variable name="day5hours">
 		    	<xsl:for-each select="home-this-week-sleep/entry">
 		    		<xsl:if test="sleep-time/date/end = date:add($today,'-P2D')">
 		    			<day>
 		    				<xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/>
 		    			</day>
 		    		</xsl:if>
 		    	</xsl:for-each>
 		    </xsl:variable>
 		    <xsl:variable name="day5spentawake">
 		 		<xsl:for-each select="home-this-week-sleep/entry">
 		 			<xsl:if test="sleep-time/date/end = date:add($today,'-P2D')">
 		    			<spentawake>
 		    				<xsl:choose>
 		    					<xsl:when test="spent-awake != ''">
		    						<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
		    					</xsl:when>
		    					<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
 		    				</xsl:choose>
	 	    			</spentawake>
 		 			</xsl:if>
 		 		</xsl:for-each>
 		    </xsl:variable>
    		<xsl:variable name="day5wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P2D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day5wakestotal" select="exslt:node-set($day5wakes)"/>
 		    <xsl:variable name="day5hourtotal" select="exslt:node-set($day5hours)"/>
			<xsl:variable name="day5spentawaketotal" select="exslt:node-set($day5spentawake)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P2D')"/>
 			</date>

 			<hours>
 				<xsl:value-of select="format-number(sum(exslt:node-set($day5hourtotal/day)) div 60 div 60,'#.##')"/>
 			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day5spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day5wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P2D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
 		</day>
 		<!-- 6 -->
 		<day>
    		<xsl:variable name="day6hours">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P1D')">
    	 				<day>
    	 					<xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/>
    	 				</day>
    	 			</xsl:if>
    	 		</xsl:for-each>
    	 	</xsl:variable>
    		<xsl:variable name="day6spentawake">
    	 		<xsl:for-each select="home-this-week-sleep/entry">
    	 			<xsl:if test="sleep-time/date/end = date:add($today,'-P1D')">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    	 			</xsl:if>
    	 		</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day6wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = date:add($today,'-P1D')">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day6wakestotal" select="exslt:node-set($day6wakes)"/>
    	 	<xsl:variable name="day6hourtotal" select="exslt:node-set($day6hours)"/>
			<xsl:variable name="day6spentawaketotal" select="exslt:node-set($day6spentawake)"/>
 			<date>
 				<xsl:value-of select="date:add($today,'-P1D')"/>
 			</date>
 			<hours>
			 	<xsl:value-of select="format-number(sum(exslt:node-set($day6hourtotal/day)) div 60 div 60,'#.##')"/>
 			</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day6spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day6wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = date:add($today,'-P1D')">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
 		</day>
 		<!-- 7 -->
 		<day>
    		<xsl:variable name="day7hours">
    			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = $today">
    					<day>
    	 					<xsl:value-of select="number(date:seconds(date:difference(sleep-time/date/start/@iso, sleep-time/date/end/@iso)))"/>
    	 				</day>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day7spentawake">
    			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = $today">
    					<spentawake>
    						<xsl:choose>
    							<xsl:when test="spent-awake != ''">
     								<xsl:value-of select="number(((number(substring(spent-awake,1,2)) * 60) + number(substring(spent-awake,4,2))) * 60)"/>
     							</xsl:when>
     							<xsl:otherwise><xsl:text>0</xsl:text></xsl:otherwise>
    						</xsl:choose>
 						</spentawake>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day7wakes">
     			<xsl:for-each select="home-this-week-sleep/entry">
    				<xsl:if test="sleep-time/date/end = $today">
     					<wakes>
     						<xsl:choose>
     							<xsl:when test="waking-up &gt; 0">
		     						<xsl:value-of select="waking-up"/>
		     					</xsl:when>
		     					<xsl:otherwise>0</xsl:otherwise>
		     				</xsl:choose>
     					</wakes>
    				</xsl:if>
    			</xsl:for-each>
    		</xsl:variable>
    		<xsl:variable name="day7wakestotal" select="exslt:node-set($day7wakes)"/>
     		<xsl:variable name="day7hourtotal" select="exslt:node-set($day7hours)"/>
			<xsl:variable name="day7spentawaketotal" select="exslt:node-set($day7spentawake)"/>
 			<date>
 				<xsl:value-of select="$today"/>
 			</date>
 			<hours>
		 		<xsl:value-of select="format-number(sum(exslt:node-set($day7hourtotal/day)) div 60 div 60,'#.##')"/>
 	 		</hours>
			<spentawake>
				<xsl:value-of select="format-number(sum(exslt:node-set($day7spentawaketotal/spentawake)) div 60 div 60,'#.##')"/>
			</spentawake>
			<wakes>
				<xsl:value-of select="sum(exslt:node-set($day7wakestotal/wakes))"/>
			</wakes>
   			<xsl:for-each select="//home-this-week-activity/entry">
   				<xsl:if test="day/date/start = $today">
					<xsl:call-template name="day-wellness"/>
				</xsl:if>
   			</xsl:for-each>
		</day>
	</summary>
	<work>
		<xsl:for-each select="home-this-week-activity/entry">
			<xsl:if test="type/item/@handle = 'work'">
				<entry>
					<key>
						<xsl:value-of select="@id"/>
					</key>
						<start>
							<xsl:value-of select="work-time/date/start"/>
							<xsl:text>T</xsl:text>
							<xsl:value-of select="work-time/date/start/@time"/>
						</start>
						<end>
							<xsl:value-of select="work-time/date/end"/>
							<xsl:text>T</xsl:text>
							<xsl:value-of select="work-time/date/end/@time"/>
						</end>
						<sickday>
							<xsl:value-of select="sick-day/item/@handle"/>
						</sickday>
				</entry>
			</xsl:if>
		</xsl:for-each>
	</work>

	<sleep>
		<xsl:for-each select="home-this-week-sleep/entry">
			<entry>
				<key>
					<xsl:value-of select="@id"/>
				</key>
				<start>
					<xsl:value-of select="sleep-time/date/start"/>
					<xsl:text>T</xsl:text>
					<xsl:value-of select="sleep-time/date/start/@time"/>
				</start>
				<xsl:choose>
					<xsl:when test="sleep-time/date/end = '9876-05-04' or sleep-time/date/end = ''">
						<end>none</end>
					</xsl:when>
					<xsl:otherwise>
						<end>
							<xsl:value-of select="sleep-time/date/end"/>
							<xsl:text>T</xsl:text>
							<xsl:value-of select="sleep-time/date/end/@time"/>
						</end>
					</xsl:otherwise>
				</xsl:choose>
				<waking-up>
					<xsl:choose>
						<xsl:when test="waking-up &gt; 0">
							<xsl:value-of select="waking-up"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:text>0</xsl:text>
						</xsl:otherwise>
					</xsl:choose>
				</waking-up>
				<xsl:if test="alarm != '0:00:00'">
					<alarm>
						<xsl:value-of select="alarm"/>
					</alarm>
				</xsl:if>
				<xsl:if test="sleep-feeling != ''">
					<sleepfeeling>
						<value>
							<xsl:choose>
								<xsl:when test="sleep-feeling/item/@handle = 'very-sleepy'">
									<xsl:text>10</xsl:text>
								</xsl:when>
								<xsl:when test="sleep-feeling/item/@handle = 'awake-but-tired'">
									<xsl:text>5</xsl:text>
								</xsl:when>
								<xsl:when test="sleep-feeling/item/@handle = 'wide-awake'">
									<xsl:text>0</xsl:text>
								</xsl:when>
							</xsl:choose>
						</value>
						<text>
							<xsl:value-of select="sleep-feeling/item"/>
						</text>
					</sleepfeeling>
					<wakefeeling>
						<value>
							<xsl:choose>
								<xsl:when test="wake-feeling/item/@handle = 'very-sleepy'">
									<xsl:text>10</xsl:text>
								</xsl:when>
								<xsl:when test="wake-feeling/item/@handle = 'awake-but-tired'">
									<xsl:text>5</xsl:text>
								</xsl:when>
								<xsl:when test="wake-feeling/item/@handle = 'wide-awake'">
									<xsl:text>0</xsl:text>
								</xsl:when>
							</xsl:choose>
						</value>
						<text>
							<xsl:value-of select="wake-feeling/item"/>
						</text>
					</wakefeeling>
				</xsl:if>
			</entry>
		</xsl:for-each>
	</sleep>
	<ailment>
		<xsl:for-each select="home-this-week-ailment/entry">
			<entry>
				<key>
					<xsl:value-of select="@id"/>
				</key>
				<start>
					<xsl:value-of select="time/date/start"/>
					<xsl:text>T</xsl:text>
					<xsl:value-of select="time/date/start/@time"/>
				</start>
				<xsl:if test="time/date/end != '9876-05-04'">
					<end>
						<xsl:value-of select="time/date/end"/>
						<xsl:text>T</xsl:text>
						<xsl:value-of select="time/date/end/@time"/>
					</end>
					<duration>
						<xsl:value-of select="format-number(number(date:seconds(date:difference(time/date/start/@iso, time/date/end/@iso))) div 60 div 60,'#.##')"/>
					</duration>
				</xsl:if>
				<type>
					<xsl:value-of select="type/item/@handle"/>
				</type>
				<impact>
					<value>
						<xsl:choose>
							<xsl:when test="impact/item/@handle = 'totally-disabled'">
								<xsl:text>10</xsl:text>
							</xsl:when>
							<xsl:when test="impact/item/@handle = 'severe'">
								<xsl:text>8</xsl:text>
							</xsl:when>
							<xsl:when test="impact/item/@handle = 'mild'">
								<xsl:text>3</xsl:text>
							</xsl:when>
							<xsl:when test="impact/item/@handle = 'none'">
								<xsl:text>0</xsl:text>
							</xsl:when>
						</xsl:choose>
					</value>
   					<text>
						<xsl:value-of select="impact/item"/>
					</text>
				</impact>
				<intensity>
					<value>
						<xsl:choose>
							<xsl:when test="intensity/item/@handle = 'very-severe'">
								<xsl:text>10</xsl:text>
							</xsl:when>
							<xsl:when test="intensity/item/@handle = 'severe'">
								<xsl:text>8</xsl:text>
							</xsl:when>
							<xsl:when test="intensity/item/@handle = 'moderate'">
								<xsl:text>3</xsl:text>
							</xsl:when>
							<xsl:when test="intensity/item/@handle = 'mild'">
								<xsl:text>0</xsl:text>
							</xsl:when>
						</xsl:choose>
					</value>
   					<text>
						<xsl:value-of select="intensity/item"/>
					</text>
				</intensity>
			</entry>
		</xsl:for-each>
	</ailment>
	<xsl:if test="//period-diary = 'Yes'">
		<period>
			<xsl:for-each select="home-this-week-period/entry">
				<entry>
					<start>
						<xsl:value-of select="dates/date/start"/>
						<xsl:text>T</xsl:text>
						<xsl:value-of select="dates/date/start/@time"/>
					</start>
					<end>
						<xsl:choose>
							<xsl:when test="dates/date/end = '9876-05-04' or dates/date/end = ''">
								<xsl:text>none</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="dates/date/end"/>
								<xsl:text>T</xsl:text>
								<xsl:value-of select="dates/date/end/@time"/>
							</xsl:otherwise>
						</xsl:choose>
					</end>
				</entry>
			</xsl:for-each>
		</period>
	</xsl:if>
</xsl:template>
</xsl:stylesheet>