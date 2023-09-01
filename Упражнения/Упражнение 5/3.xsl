<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:form="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <!--Създаваме html документ. -->
        <html>
            <body>
                <table>
                    <tr>
                        <td>1. В нарастващ ред
                            <!-- Създаваме order list-->
                            <ol>
                                <!-- За всеки елемент track от catalog/cd/tracklist, сортираме стойностите в нарастващ ред.-->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в нарастващ ред.-->
                                    <xsl:sort select="."/>
                                        <!-- Добавяме стойността на текущия елемент към списък li.-->
                                        <li><xsl:value-of select="text()"/></li>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td>2. В намаляващ ред
                            <!-- Създаваме order list-->
                            <ol>
                                <!-- За всеки елемент track от catalog/cd/tracklist, сортираме стойностите в намаляващ ред.-->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в намаляващ ред.-->
                                    <xsl:sort select="." order="descending"/>
                                        <!-- Добавяме стойността на текущия елемент към списък li.-->
                                        <li><xsl:value-of select="text()"/></li>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td>3. В нарастващ или намаляващ ред в следния формат: track_1, track_2,...,track_n
                            <!-- Създаваме order list-->
                            <ol>
                                <!-- За всеки елемент track от catalog/cd/tracklist извеждаме информацията в горния формат.-->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в намаляващ ред.-->
                                    <xsl:sort select="." order="descending"/>
                                    <!-- Създаваме списък.-->
                                    <li>
                                        <!-- Добавяме стойността на текущия елемент.-->
                                        <xsl:value-of select="text()"/>
                                        <!-- Добавяме долна черта.-->
                                        <xsl:text>_</xsl:text>
                                        <!-- Вземаме позицията.-->
                                        <xsl:number value="position()"/>
                                        <!-- Ако не е на последна позиция, принтираме запетайка, в противен случай - не принтираме нищо. -->
                                        <xsl:if test="position() != last()">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </li>
                                </xsl:for-each>
                            </ol>
                            <!-- Създаваме order list-->
                            <ol>
                                <!-- За всеки елемент track от catalog/cd/tracklist извеждаме информацията в горния формат.-->
                                <xsl:for-each select="catalog/cd/tracklist/track">
                                    <!-- Сортираме в нарастващ ред.-->
                                    <xsl:sort select="."/>
                                    <!-- Създаваме списък.-->
                                    <li>
                                        <!-- Добавяме стойността на текущия елемент.-->
                                        <xsl:value-of select="text()"/>
                                        <!-- Добавяме долна черта.-->
                                        <xsl:text>_</xsl:text>
                                        <!-- Вземаме позицията.-->
                                        <xsl:number value="position()"/>
                                        <!-- Ако не е на последна позиция, принтираме запетайка, в противен случай - не принтираме нищо. -->
                                        <xsl:if test="position() != last()">
                                            <xsl:text>, </xsl:text>
                                        </xsl:if>
                                    </li>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>                     
</xsl:stylesheet>