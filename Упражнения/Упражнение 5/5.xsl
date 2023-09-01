<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:form="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <!-- Създаваме параметър с име param и стойност "Име на песен".-->
        <xsl:param name="param" select="'Име на песен'"/>
        <html>
            <body>
                <table>
                    <tr>
                        <td>
                            <!-- Създаваме таблица, коятао има следните характеристики.-->
                            <table border="4" bordercolor="pink" cellspacing="1" cellpadding="3">
                                <!-- За всеки елемент track от catalog/cd/tracklist, използваме параметъра и принтираме стойността на текущия елемент. -->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в нарастващ ред.-->
                                    <xsl:sort select="text()"/>
                                    <tr>
                                        <!-- Използваме зададения параметър.-->
                                        <th><xsl:value-of select="$param"/></th>
                                    </tr>
                                    <tr>
                                        <!-- Извеждаме стойността на текущия елемент.-->
                                        <td><xsl:value-of select="."/></td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>