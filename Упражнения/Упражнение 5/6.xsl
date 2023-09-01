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
                                <!-- Извикваме шаблона с име year. -->
                                <xsl:call-template name="year"/>
                            </td>
                            <td>
                                <!-- Извикваме шаблона с име title.-->
                                <xsl:call-template name="title"/>
                            </td>
                            <td>
                                <!-- Извикваме шаблона с име artist.-->
                                <xsl:call-template name="artist"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
    <!-- Създаваме темплейт с име year.-->
    <xsl:template name="year">
        <!-- Темплейта извежда стойността на year елемента. -->
        <b><xsl:value-of select="year"/></b><br/>
    </xsl:template>    
    <!-- Създаваме темплейт с име title.-->
    <xsl:template name="title">
        <!-- Темплейта извежда стойността на title елемента. -->
        <b><xsl:value-of select="title"/></b><br/>
    </xsl:template>               
    <!-- Създаваме темплейт с име artist.-->    
    <xsl:template name="artist">
        <!-- Темплейта извежда стойността на artist елемента. -->
        <b><xsl:value-of select="artist"/></b><br/>
    </xsl:template>
</xsl:stylesheet>