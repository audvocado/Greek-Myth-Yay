<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
   
    <xsl:template match="/">
        <xsl:variable name="patriarchy" as="xs:double" select="count(//patriarchy)"/>
        <xsl:variable name="scale" as="xs:double" select="20"/>
        <xsl:variable name="themes" select="distinct-values(//line/descendant::* ! name())"/>
        <xsl:variable name="doc" select="/"></xsl:variable>
     
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000" viewBox="-50 -500 1000 1000">
<!--            below is x axis-->
            <line x1="500" y1="0" x2="0" y2="0" stroke="black" stroke-width="5" />
<!--            below is y axis-->
            <line x1="1" y1="0" x2="1" y2="-400" stroke="black" stroke-width="5" />
<!--            
            <line x1="400" y1="-200" x2="0" y2="-200" stroke="black" stroke-width="1" />
            <text x="5" y="200" fill="blue">14</text>
            <line x1="400" y1="-100" x2="0" y2="-100" stroke="black" stroke-width="1" />
            <text x="5" y="100" fill="blue">21</text>
            <line x1="400" y1="0" x2="0" y2="0" stroke="black" stroke-width="1" />
            <text x="5" y="10" fill="blue">28</text>
            <line x1="400" y1="-300" x2="0" y2="-300" stroke="black" stroke-width="1" />
            <text x="5" y="300" fill="blue">7</text>
            <line x1="400" y1="-400" x2="0" y2="-400" stroke="black" stroke-width="1" />
            <text x="5" y="390" fill="#fdfd96">0</text>
            -->
            
            
            <xsl:for-each select="0 to 5">           
                <xsl:variable name="ruling_height" as="xs:double" select=". div 5 * 500"/>
                <text x="-25" y="-{$ruling_height}"><xsl:value-of select="$ruling_height div 20"/></text>
                <line x1="500" y1="-{$ruling_height}" x2="0" y2="-{$ruling_height}" stroke="black" stroke-width="2"></line>
            </xsl:for-each>
            
            <xsl:for-each select="$themes">
                <xsl:variable name="count" as="xs:double" select="$doc//. => count()"/>
                <rect width="100" height="{$count}" x="0" y="-{$count}"></rect>
            </xsl:for-each>
            
            <xsl:for-each select="$themes">
                <xsl:variable name="theme" select="."/>
                <xsl:variable name="count" as="xs:double"
                    select="count($doc//line/descendant::*[name() = $theme])"/>
                <rect width="100" height="{$count}" x="0" y="-{$count}"/>
            </xsl:for-each>
            
          <!--  <rect width="25" height="300" x="25" y="163" fill="blue"></rect>
            <text x="5" y="390" fill="blue">marriage</text>
            <rect width="25" height="300" x="75" y="260" stroke="blue"></rect>
            <text x="55" y="390" fill="blue">violence</text>
            <rect width="25" height="200" x="125" y="200" stroke="blue"></rect>
            <text x="105" y="390" fill="blue">autonomy</text>
            <rect width="25" height="{$patriarchy * $scale}" x="175" y="90" stroke="blue"></rect>
            <text x="155" y="390" fill="blue">patriarchal themes</text>
            <rect width="25" height="255" x="225" y="225" stroke="blue"></rect>
            <text x="205" y="390" fill="blue">family</text>
            <rect width="25" height="400" x="275" y="310" stroke="blue"></rect>
            <text x="255" y="390" fill="blue">motherhood</text>
            <rect width="25" height="210" x="325" y="210" stroke="blue"></rect>
            <text x="305" y="390" fill="blue">alone/isolation</text>-->
            
<!--            we need a variable for the x position (not axis) of the rectangles, so it'll basiclaly be like whatever the first theme is ill be the foirst oen and th enetx theme will be a ltitl ebit bumped oevr to the roght-->
<!--            we need to figure out the how to count the number of elements that are in the document that are equal to the -->
            
            
        </svg>
    </xsl:template>
    
    
   <!-- <xsl:template match="patriarchy">
        <strong>
            <xsl:apply-templates/>
        </strong>
    </xsl:template>-->
    
</xsl:stylesheet>