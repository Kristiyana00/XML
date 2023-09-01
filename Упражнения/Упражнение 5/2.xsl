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
                            <!-- Създаваме order list-->
                            <ol>
                            <!-- За всеки елемент //track правим проверка дали дължината на стойността е по-голяма или по-малка от 15, или не отговаря на тези условия. -->
                            <xsl:for-each select="//track">
                                <xsl:choose>
                                    <!-- Ако дължината е по-голяма от 15, извеждаме A big string, заедно със стойността на дадения елемент.-->
                                    <xsl:when test="string-length(.) &gt; 15">
                                        <!-- Добавяме резултата към списък li.-->
                                        <li>A big string: <xsl:value-of select="text()"/></li>
                                    </xsl:when>
                                    <!-- Ако дължината е по-малка от 15, извеждаме A small string, заедно със стойността на дадения елемент.-->
                                    <xsl:when test="string-length(.) &lt; 15">
                                        <!-- Добавяме резултата към списък li.-->
                                        <li>A small string: <xsl:value-of select="text()"></xsl:value-of></li>
                                    </xsl:when>
                                    <!--Ако дължината не отговаря на горните условия, извеждаме A medium string, заедно със стойността на дадения елемент. -->
                                    <xsl:otherwise>
                                        <!-- Добавяме резултата към списък li.-->
                                        <li>A medium string: <xsl:value-of select="text()"/></li>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>       
</xsl:stylesheet>