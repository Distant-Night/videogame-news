<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>{ "articles": [</xsl:text>
        <xsl:for-each select="articles/article">
            <xsl:sort select="title"/> <!-- Sorting articles by title -->
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>", </xsl:text>
            <xsl:text>"title": "</xsl:text><xsl:value-of select="title"/><xsl:text>", </xsl:text>
            <xsl:text>"author": "</xsl:text><xsl:value-of select="author"/><xsl:text>"</xsl:text>
            <xsl:choose>
                <xsl:when test="published">
                    <xsl:text>, "published": "</xsl:text>
                    <xsl:value-of select="published"/>
                    <xsl:text>"</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>, "published": "not available"</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text> ] }</xsl:text>
    </xsl:template>
</xsl:stylesheet>

