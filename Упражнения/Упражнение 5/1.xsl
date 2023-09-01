<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:form="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <!--Създаваме html документ. -->
        <html>
            <body>
                <table>
                    <tr>1. Стойностите на всички track елементи, които имат стойност на атрибута length '4:04'
                        <td>
                            <!-- Създаваме order list, който съдържа всички track елементи, които имат атрубут
                            length със стойност '4:04'.-->
                            <ol>
                                <!-- За всеки елемент //track правим проверка дали атрибута length е равен на '4:04'
                                     Това постигаме чрез test="@length='4:04'".-->
                                <xsl:for-each select="//track">
                                    <xsl:if test="@length='4:04'">
                                        <!-- За всеки елемент, който отговаря на условието, добавяме стойността му към списък.-->
                                        <li><xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td>2. Стойностите на всички track елементи, чиято дължина е по-малка от 15, както и техните дължини
                            <ol>
                                <!-- За всеки елемент //track правим проверка дали дължината е по-малка от 15.
                                     Това постигаме чрез test="string-length(.) &lt; 15".-->
                                <xsl:for-each select="//track">
                                    <xsl:if test="string-length(.) &lt; 15">
                                        <!-- За всеки елемент, който отговаря на условието, добавяме стойността му към списък.-->
                                        <li><xsl:value-of select="text()"/>(<xsl:value-of select="string-length(.)"/>)</li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                    <tr>
                        <td>3. Всички track елементи на четни/нечетни позиции
                            Четни:
                            <ol>
                                <!-- За всеки елемент //track правим проверка дали позицията му е четна.
                                     Това постигаме чрез test="position() mod 2 = 0".-->
                                <xsl:for-each select="//track">
                                    <xsl:if test="position() mod 2 = 0">
                                        <!-- За всеки елемент, който отговаря на условието, добавяме стойността му към списък.-->
                                        <li><xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ol>
                            Нечетни:
                            <ol>
                                <!-- За всеки елемент //track правим проверка дали позицията му е нечетна.
                                     Това постигаме чрез test="position() mod 2 != 0".-->
                                <xsl:for-each select="//track">
                                    <xsl:if test="position() mod 2 != 0">
                                        <!-- За всеки елемент, който отговаря на условието, добавяме стойността му към списък.-->
                                        <li><xsl:value-of select="text()"/></li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ol>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>