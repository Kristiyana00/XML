<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:form="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <!--Създаваме html документ. -->
        <html>
            <body>
                <table>
                    <tr>
                        <td>
                            <!-- Създаваме таблица, коятао има следните характеристики.-->
                            <table border="4" bordercolor="pink" cellspacing="1" cellpadding="3">
                                <!-- Създаваме константа с име header със стойност "Име на песента".-->
                                <xsl:variable name="header" select="'Име на песен'"/>
                                <!-- За всеки елемент track от catalog/cd/tracklist, използваме константата и принтираме стойността на текущия елемент. -->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в нарастващ ред.-->
                                    <xsl:sort select="text()"/>
                                    <tr>
                                        <!-- Използваме зададената константа.-->
                                        <th><xsl:value-of select="$header"/></th>>
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