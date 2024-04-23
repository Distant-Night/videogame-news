<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>{ "articles": [</xsl:text>
        <xsl:for-each select="newsSite/articles/article">
            <xsl:sort select="title"/>
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>{</xsl:text>
            <xsl:text>"id": "</xsl:text><xsl:value-of select="@id"/><xsl:text>", </xsl:text>
            <xsl:text>"title": "</xsl:text><xsl:value-of select="title"/><xsl:text>", </xsl:text>
            <xsl:text>"author": "</xsl:text><xsl:value-of select="metadata/author"/><xsl:text>", </xsl:text>
            <xsl:text>"date": "</xsl:text><xsl:value-of select="metadata/date"/><xsl:text>", </xsl:text>
            <xsl:text>"category": "</xsl:text><xsl:value-of select="metadata/category"/><xsl:text>", </xsl:text>
            <xsl:text>"summary": "</xsl:text><xsl:value-of select="content/summary"/><xsl:text>", </xsl:text>
            <xsl:text>"details": [</xsl:text>
            <xsl:for-each select="content/details/point">
                <xsl:if test="position() != 1">
                    <xsl:text>, </xsl:text>
                </xsl:if>
                <xsl:text>"</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>"</xsl:text>
            </xsl:for-each>
            <xsl:text>]</xsl:text>
            <xsl:text>}</xsl:text>
        </xsl:for-each>
        <xsl:text> ] }</xsl:text>
    </xsl:template>
</xsl:stylesheet>


