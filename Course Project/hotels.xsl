<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				 xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="xsl">
	<xsl:template match="/">
		<html> 
			<head>
				<meta charset="UTF-8"></meta>
				<title>Hotels</title>
			 <link rel="stylesheet" href="./hotels.css" type="text/css" />
			 <script src="./hote"></script>
			 <script>
				 <![CDATA[
				  function sortByName(){
						 var table, rows, switching, i, x, y, shouldSwitch;
						 tbody = document.getElementById("tbodys");
						 switching = true;
						 while(switching==true){
						 switching=false;
						 rows=tbody.rows;
						 
						 for(i=0;i<(rows.length-1);i++){
							 shouldSwitch=false;
							 x = rows[i].getElementsByTagName("td")[0];
							  y = rows[i + 1].getElementsByTagName("td")[0];

							 if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
								 
								 shouldSwitch = true;
								 break;
							   }
						 }

						 if (shouldSwitch) {
							 
							 
							 rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
							 switching = true;
						   }
						 }
					 }

					 function sortByRoom(){
						 var table, rows, switching, i, x, y, shouldSwitch;
						 tbody = document.getElementById("tbodys");
						 switching = true;
						 while(switching==true){
						 switching=false;
						 rows=tbody.rows;
						 
						 for(i=0;i<(rows.length-1);i++){
							 shouldSwitch=false;
							 x = rows[i].getElementsByTagName("td")[5];
							  y = rows[i + 1].getElementsByTagName("td")[5];
							 
							 if (parseInt(x.innerText) < parseInt(y.innerText)) {
								 
								 
								 shouldSwitch = true;
								 break;
							   }
						 }

						 if (shouldSwitch) {
							 
							 
							 rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
							 switching = true;
						   }
						 }
					 }

					 function sortByCategory(){
						 var table, rows, switching, i, x, y, shouldSwitch;
						 tbody = document.getElementById("tbodys");
						 switching = true;
						 while(switching==true){
						 switching=false;
						 rows=tbody.rows;
						 
						 for(i=0;i<(rows.length-1);i++){
							 shouldSwitch=false;
							 x = rows[i].getElementsByTagName("td")[3];
							  y = rows[i + 1].getElementsByTagName("td")[3];

							 if (x.innerText.length > y.innerText.length) {
								 
								 shouldSwitch = true;
								 break;
							   }
						 }

						 if (shouldSwitch) {
							 
							 
							 rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
							 switching = true;
						   }
						 }
					 }




				 ]]>
				 </script>
   			</head>

			<body>
				<h1>Хотели в България</h1>
				<table border="1px solid grey">
					<thead>
						<th><a onclick="sortByName()">Name</a></th>
						<th>Image</th>
						<th>City</th>
						<th><a onclick="sortByCategory()">Category</a></th>
						<th>Description</th>
						
						<th><a onclick="sortByRoom()">Rooms</a></th>
						<th>Extras</th>
						<th>Web Site</th>
					</thead>

					<div id="defaultView" class="show">
					<tbody id="tbodys">
						<xsl:for-each select="Bulgaria/Hotels">
							<xsl:for-each select="./Hotel">
							<xsl:variable name="hID" select="@id"></xsl:variable>
								<tr>
									<td> <xsl:value-of select="./Name"></xsl:value-of> </td>
									<td><img src="Images/{$hID}.jpg"></img></td>
									<td> <xsl:value-of select="./City"></xsl:value-of> </td>
									<td> <xsl:value-of select="./Category"></xsl:value-of> </td>
									<td> <xsl:value-of select="./Description"></xsl:value-of> </td>
									<td> <xsl:value-of select="./Rooms"></xsl:value-of> </td>
									<td>
										<ul>
											<li>Басейн: <xsl:value-of select="./Extras/Pool"></xsl:value-of></li>
											<li>Wi-Fi: <xsl:value-of select="./Extras/WiFi"></xsl:value-of></li>
											<li>TV: <xsl:value-of select="./Extras/TV"></xsl:value-of></li>
											<li>СПА: <xsl:value-of select="./Extras/SPA"></xsl:value-of></li>
											<li>Ресторант: <xsl:value-of select="./Extras/Restaurant"></xsl:value-of></li>
										</ul>
									</td>
									<td><a href="{site/@href}"><xsl:value-of select="site/@href"></xsl:value-of></a></td>
								</tr>
						
							</xsl:for-each>
					
					
					
						</xsl:for-each>



					</tbody>
					
				</div>
					
				</table>


			</body>
		</html>






  	</xsl:template>
				
	
	


	
</xsl:stylesheet>
