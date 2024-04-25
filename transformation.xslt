<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>

    <!-- Template for formatting individual articles based on information -->
    <xsl:template match="article">
        <xsl:if test="position() != 1">
            <xsl:text>,&#10;</xsl:text>
        </xsl:if>
        <xsl:text>{&#10;  "id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",&#10;  "title": "</xsl:text>
        <xsl:value-of select="title"/>
        <xsl:text>",&#10;  "author": "</xsl:text>
        <xsl:value-of select="metadata/author"/>
        <xsl:text>",&#10;  "datePublished": "</xsl:text>
        <xsl:value-of select="datePublished"/>
        <xsl:text>",&#10;  "category": "</xsl:text>
        <xsl:value-of select="metadata/category"/>
        <xsl:text>",&#10;  "summary": "</xsl:text>
        <xsl:value-of select="content/summary"/>
        <xsl:text>",&#10;  "details": [</xsl:text>
        <xsl:for-each select="content/details/point">
            <xsl:if test="position() != 1">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:text>"</xsl:text>
            <xsl:value-of select="."/>
            <xsl:text>"</xsl:text>
        </xsl:for-each>
        <xsl:text>]&#10;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <!-- Template for formatting individual reviews based on information -->
    <xsl:template match="review">
        <xsl:if test="position() != 1">
            <xsl:text>,&#10;</xsl:text>
        </xsl:if>
        <xsl:text>{&#10;  "id": "</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>",&#10;  "title": "</xsl:text>
        <xsl:value-of select="title"/>
        <xsl:text>",&#10;  "reviewer": "</xsl:text>
        <xsl:value-of select="reviewer"/>
        <xsl:text>",&#10;  "date": "</xsl:text>
        <xsl:value-of select="@date"/>
        <xsl:text>",&#10;  "rating": "</xsl:text>
        <xsl:value-of select="rating"/>
        <xsl:text>",&#10;  "reviewBody": "</xsl:text>
        <xsl:value-of select="reviewBody"/>
        <xsl:text>",&#10;  "gameReviewed": "</xsl:text>
        <xsl:value-of select="gameReviewed"/>
        <xsl:text>"&#10;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

    <!-- Actual template to create the individual results by -->
    <xsl:template match="/newsSite">
        <xsl:text>{&#10;</xsl:text>
        <xsl:text>"articles": [</xsl:text>
        <xsl:apply-templates select="articles/article"/>
        <xsl:text>]&#10;</xsl:text>
        <xsl:text>, "reviews": [</xsl:text>
        <xsl:apply-templates select="reviews/review"/>
        <xsl:text>]&#10;</xsl:text>
        <xsl:text>}</xsl:text>
    </xsl:template>

</xsl:stylesheet>