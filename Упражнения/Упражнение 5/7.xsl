<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                              xmlns:form="http://www.w3.org/1999/XSL/Format">
    <xsl:template match="/">
        <!--Създаваме html документ. -->
        <html>
            <body>
                <!-- Създаваме таблица, коятао има следните характеристики.-->
                <table border="4" bordercolor="pink" cellspacing="1" cellpadding="3">
                    <tr>
                        <!-- Заглавия на колоните на таблицата.-->
                        <th>Year</th>
                        <th>Title</th>
                        <th>Artist</th>
                    </tr>
                    <!-- За всеки елемент cd от catalog извикваме съответния шаблон.-->
                    <xsl:for-each select="catalog/cd">
                        <tr>
                            <td>
                                <!-- Извикваме шаблона с име yearParam и параметър с име yearName. -->
                                <xsl:call-template name="yearParam">
                                    <xsl:with-param name="yearName" select="year"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <!-- Извикваме шаблона с име titleParam и параметър с име titleName.-->
                                <xsl:call-template name="titleParam">
                                    <xsl:with-param name="titleName" select="title"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <!-- Извикваме шаблона с име artistParam и параметър с име artistName.-->
                                <xsl:call-template name="artistParam">
                                    <xsl:with-param name="artistName" select="artist"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>   
    <!-- Създаваме темплейт с име yearParam.-->
    <xsl:template name="yearParam">
        <!-- Създаваме параметър с име yearName.-->
        <xsl:param name="yearName"/>
        <!-- Темплейта извежда стойността на year елемента. -->
        <p>1. Шаблон с име year, който има параматър с име yearName и извежда стойността на year елемента:<br/>
            <xsl:value-of select="$yearName"/>
        </p><br/>
    </xsl:template>
    <!-- Създаваме темплейт с име titleParam.-->
    <xsl:template name="titleParam">
        <!-- Създаваме параметър с име titleName.-->
        <xsl:param name="titleName"/>
        <!-- Темплейта извежда стойността на title елемента. -->
        <p>2. Шаблон с име title, който има параматър с име titleName и извежда стойността на title елемента:<br/> 
            <xsl:value-of select="$titleName"/>
        </p><br/>
    </xsl:template>
    <!-- Създаваме темплейт с име artistParam.-->
    <xsl:template name="artistParam">
        <!-- Създаваме параметър с име artistName.-->
        <xsl:param name="artistName"/>
        <!-- Темплейта извежда стойността на artist елемента. -->
        <p>3. Шаблон с име artist, който има параматър с име artistName и извежда стойността на artist елемента:<br/> 
            <xsl:value-of select="$artistName"/>
        </p><br/>
    </xsl:template>                     
</xsl:stylesheet>