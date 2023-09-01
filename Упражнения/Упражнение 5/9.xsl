<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="catalog">
        <!-- Създаваме елемент с име result.-->
        <xsl:element name="result">
            <!-- За всеки елемент cd, създаваме поделемент на result с име cd.-->
            <xsl:for-each select="cd">
                <xsl:element name="cd">
                    <!-- Създаваме поделемент title на елемента cd, който връща информация за стойността на title.-->
                    <xsl:element name="title">
                        <xsl:value-of select="title"/>
                    </xsl:element>
                    <!-- Създаваме подлемент tracklist, който има атрибут num.-->
                    <xsl:element name="tracklist">
                        <!-- Създаваме атрибута num на елемента tracklist.-->
                        <xsl:attribute name="num">
                            <!-- Връщаме информация за стойността на атрибута num.-->
                            <xsl:value-of select="tracklist/@num"/>
                        </xsl:attribute>
                        <!-- За всеки елемент track от tracklist създаваме елемент track, който има атрибут length.-->
                        <xsl:for-each select="tracklist/track">
                            <!-- Създаваме елемента track. -->
                            <xsl:element name="track">
                                <!-- Създаваме атрибута length на елемента track. -->
                                <xsl:attribute name="length">
                                    <!-- Връщаме информация за стойността на атрибута length. -->
                                    <xsl:value-of select="@length"/>
                                </xsl:attribute>
                                <!-- Извеждаме стойността на текущия елемент. -->
                                <xsl:value-of select="text()"/>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:element>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet>