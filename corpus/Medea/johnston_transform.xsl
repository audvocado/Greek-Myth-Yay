<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Ian Johnston Translation</title>
            </head>
            <body>
                <h1>Ian Johnston Translation</h1>             
                <xsl:apply-templates/>
            </body>
        </html>

    </xsl:template>    
    
    <xsl:template match="line">
        <l>
            <xsl:apply-templates select = "@nu"/>
        </l> 
        <p>
            <xsl:apply-templates/>
           <!-- <xsl:value-of select="@nu" />
            <xsl:apply-templates/> -->
        </p> 
          
<!--            <xsl:value-of select="@nu"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="."/>-->

    </xsl:template>
    
    
    
 
</xsl:stylesheet>