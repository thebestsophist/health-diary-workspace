<?xml version='1.0' encoding='utf-8'?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="day-wellness">
	<work>
		<type>
			<xsl:choose>
				<xsl:when test="type/item/@handle">
					<xsl:value-of select="type/item/@handle"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>unknown</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</type>
		<sick>
			<xsl:choose>
				<xsl:when test="sick-day/item/@handle">
					<xsl:value-of select="sick-day/item/@handle"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:text>unknown</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</sick>
	</work>
	<wellness>
	    <morning>
	    	<wake>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="morning-wakefulness/item/@handle = 'struggle-to-stay-awake'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wakefulness/item/@handle = 'somewhat-tired'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wakefulness/item/@handle = 'fairly-alert'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wakefulness/item/@handle = 'wide-awake'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="morning-wakefulness/item"/>
	    		</text>
	    	</wake>
	    	<mental>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="morning-mental-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-mental-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-mental-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-mental-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-mental-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="morning-mental-state/item"/>
	    		</text>
	    	</mental>
	    	<body>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="morning-body-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-body-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-body-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-body-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-body-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="morning-body-state/item"/>
	    		</text>
	    	</body>
	    	<stress>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="morning-stress/item/@handle = 'very-high'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-stress/item/@handle = 'high'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-stress/item/@handle = 'moderate'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-stress/item/@handle = 'low'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-stress/item/@handle = 'very-low'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="morning-stress/item"/>
	    		</text>
	    	</stress>
	    	<overall>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="morning-wellness/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wellness/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wellness/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wellness/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="morning-wellness/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="morning-wellness/item"/>
	    		</text>
	    	</overall>
	    </morning>
	    <afternoon>
	    	<wake>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="afternoon-wakefulness/item/@handle = 'struggle-to-stay-awake'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wakefulness/item/@handle = 'somewhat-tired'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wakefulness/item/@handle = 'fairly-alert'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wakefulness/item/@handle = 'wide-awake'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="afternoon-wakefulness/item"/>
	    		</text>
	    	</wake>
	    	<mental>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="afternoon-mental-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-mental-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-mental-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-mental-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-mental-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="afternoon-mental-state/item"/>
	    		</text>
	    	</mental>
	    	<body>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="afternoon-body-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-body-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-body-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-body-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-body-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="afternoon-body-state/item"/>
	    		</text>
	    	</body>
	    	<stress>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="afternoon-stress/item/@handle = 'very-high'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-stress/item/@handle = 'high'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-stress/item/@handle = 'moderate'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-stress/item/@handle = 'low'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-stress/item/@handle = 'very-low'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="afternoon-stress/item"/>
	    		</text>
	    	</stress>
	    	<overall>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="afternoon-wellness/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wellness/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wellness/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wellness/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="afternoon-wellness/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="afternoon-wellness/item"/>
	    		</text>
	    	</overall>
	    </afternoon>
	    <evening>
	    	<wake>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="evening-wakefulness/item/@handle = 'struggle-to-stay-awake'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wakefulness/item/@handle = 'somewhat-tired'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wakefulness/item/@handle = 'fairly-alert'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wakefulness/item/@handle = 'wide-awake'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="evening-wakefulness/item"/>
	    		</text>
	    	</wake>
	    	<mental>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="evening-mental-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-mental-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-mental-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-mental-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-mental-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="evening-mental-state/item"/>
	    		</text>
	    	</mental>
	    	<body>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="evening-body-state/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-body-state/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-body-state/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-body-state/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-body-state/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="evening-body-state/item"/>
	    		</text>
	    	</body>
	    	<stress>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="evening-stress/item/@handle = 'very-high'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-stress/item/@handle = 'high'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-stress/item/@handle = 'moderate'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-stress/item/@handle = 'low'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-stress/item/@handle = 'very-low'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="evening-stress/item"/>
	    		</text>
	    	</stress>
	    	<overall>
	    		<value>
	    			<xsl:choose>
	    				<xsl:when test="evening-wellness/item/@handle = 'terrible'">
	    					<xsl:text>10</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wellness/item/@handle = 'poor'">
	    					<xsl:text>8</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wellness/item/@handle = 'medium'">
	    					<xsl:text>5</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wellness/item/@handle = 'good'">
	    					<xsl:text>2</xsl:text>
	    				</xsl:when>
	    				<xsl:when test="evening-wellness/item/@handle = 'terrific'">
	    					<xsl:text>0</xsl:text>
	    				</xsl:when>
	    				<xsl:otherwise><xsl:text>-1</xsl:text></xsl:otherwise>
	    			</xsl:choose>
	    		</value>
	    		<text>
	    			<xsl:value-of select="evening-wellness/item"/>
	    		</text>
	    	</overall>
		</evening>
	</wellness>
</xsl:template>
</xsl:stylesheet>