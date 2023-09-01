<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!-- Match-ваме catalog/cd.-->    
<xsl:template match="catalog/cd">
        <!-- Създаваме елемент cd с подлемент title.-->
        <cd>
            <!-- Създаваме поделемента title.-->
            <title>
                <!-- Връщаме стойността на поделемента title.-->
                <xsl:value-of select="title"/>
            </title>
            <!-- Връщаме подлемента tracklist заедно с цялата негова структура.-->
            <xsl:copy-of select="tracklist"/>
        </cd>
    </xsl:template>                        
</xsl:stylesheet>