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
        
        <svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000" viewBox="-150 -400 1000 600">
            <text x="400" y="-450">Luschig Translation</text>
            <!--            below is x axis-->
            <line x1="1000" y1="0" x2="0" y2="0" stroke="black" stroke-width="5" />
            <text x="400" y="100" >Themes</text>
            <!--            below is y axis-->
            <line x1="1" y1="0" x2="1" y2="-100" stroke="black" stroke-width="5" />
            <text x="-125" y="-200">Times Appeared</text>
            
            
            <xsl:for-each select="0 to 5">           
                <xsl:variable name="ruling_height" as="xs:double" select=". div 5 * 400"/>
                <text x="-25" y="-{$ruling_height}"><xsl:value-of select="$ruling_height div 20"/></text>
                <line x1="1000" y1="-{$ruling_height}" x2="0" y2="-{$ruling_height}" stroke="black" stroke-width="2"></line>
                
            </xsl:for-each>
            
            <xsl:for-each select="$themes">
                <xsl:variable name="theme" select="."/>
                <xsl:variable name="count" as="xs:double" select="count($doc//line/descendant::*[name() = $theme])"/>
                <xsl:variable name="xPos" select="(position() - 1) * 120"/>
                
                <!-- The Bar -->
                <rect width="100" height="{$count * $scale}" x="{$xPos}" y="-{$count * $scale}" fill="blue"/>
                
                <!-- The Dynamic Title -->
                <text x="{$xPos + 50}" y="25" text-anchor="middle" fill="black">
                    <xsl:value-of select="$theme"/>
                </text>
            </xsl:for-each>
            <!--            the above is to create the height of the x and y axis-->
            
            <!--            <xsl:for-each select="$themes">
                <xsl:variable name="count" as="xs:double" select="$doc//. => count()"/>
                <rect width="100" height="{$count}" x="0" y="-{$count}"></rect>
            </xsl:for-each>
            
            this (the above code) is something we tried that didn't work but I wanted to keep it just in case.-->
            
            <xsl:for-each select="$themes">
                <xsl:variable name="theme" select="."/>
                <xsl:variable name="count" as="xs:double"
                    select="count($doc//line/descendant::*[name() = $theme])"/>
                <rect width="100" height="{$count * $scale}" x="{(position() - 1) * 120}"  y="-{$count * $scale}" fill="blue"/>
            </xsl:for-each>
            <!--             the above is to create the actual bars themselves-->
            
            <!--            <text x="0" y="25" fill="#ffd1dc">Patriarchy</text>
            <text x="140" y="25" fill="#fdfd96">Marriage</text>
            <text x="250" y="25" fill="#d3d3d3">Alone/Isolation</text>
            <text x="380" y="25" fill="#b3ffb3">Autonomy</text>
            <text x="500" y="25" fill="#cdecff">Family</text>
            <text x="620" y="25" fill="#E64747">Violence</text>
            <text x="740" y="25" fill="#e0bbe4">Motherhood</text>-->
            
            
            <!--    the above is hard coded theme names, I'm keeping it just in case but the theme names are now dynamically coded so it's kind of obsolete.         -->
            
            
        </svg>
    </xsl:template>
    
    
</xsl:stylesheet>